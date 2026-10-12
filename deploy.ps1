# ============================================================
# 一键部署脚本 v3：编译 -> 打包 -> scp 上传 -> 远程执行 deploy.bat
# 用法：.\deploy.ps1
# 依赖：SSH 免密已配置（id_ed25519 密钥）
# ============================================================
$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path

# ---------- 读取配置 ----------
$cfgPath = Join-Path $Root 'deploy-config.json'
if (-not (Test-Path $cfgPath)) {
    Write-Host 'ERROR: 缺少 deploy-config.json' -ForegroundColor Red
    exit 1
}
$cfg = Get-Content $cfgPath -Encoding UTF8 | ConvertFrom-Json
$sshHost = [string]$cfg.server.host
$sshPort = [string]$cfg.server.port
$sshUser = [string]$cfg.server.user
$sshOpts = @('-p', $sshPort, '-o', 'BatchMode=yes', '-o', 'StrictHostKeyChecking=accept-new', '-o', 'ConnectTimeout=15')
$scpOpts = @('-P', $sshPort, '-o', 'BatchMode=yes', '-o', 'StrictHostKeyChecking=accept-new', '-o', 'ConnectTimeout=15')
$remoteTmp = 'C:\wtfk-deploy'

function Invoke-Ssh([string]$cmd) {
    ssh @sshOpts "$sshUser@$sshHost" $cmd 2>&1
    if ($LASTEXITCODE -ne 0) { throw "SSH 命令失败: $cmd" }
}
function Send-File([string]$local, [string]$remote, [int]$tries = 3) {
    for ($i = 1; $i -le $tries; $i++) {
        Write-Host "    上传 $([System.IO.Path]::GetFileName($local)) (第 $i 次)..." -ForegroundColor Cyan
        scp @scpOpts "`"$local`"" "${sshUser}@${sshHost}:`"$remote`"" 2>&1
        if ($LASTEXITCODE -eq 0) { return }
        Start-Sleep -Seconds 3
    }
    throw "上传失败: $local"
}

# ---------- 第 0 步：清 DNS 缓存 + 域名解析检查 ----------
# 花生壳是动态域名（zicp.fun），IP 随时可能变化：严禁把 host 改成 IP 直连（改 IP 下次部署必失效）。
# "Could not resolve hostname" 多数是 DNS 缓存过期（flushdns 即可解决），少数是花生壳客户端掉线/映射失效
# （需人工检查花生壳客户端，不能靠换 IP 绕过）。
Write-Host "==> 清 DNS 缓存 ..." -ForegroundColor Cyan
ipconfig /flushdns | Out-Null

Write-Host "==> 检查域名 $sshHost 是否可解析 ..." -ForegroundColor Cyan
$dnsOk = $false
try {
    $ips = @(Resolve-DnsName -Name $sshHost -Type A -ErrorAction Stop | Where-Object { $_.IPAddress })
    if ($ips.Count -gt 0) { $dnsOk = $true; Write-Host "    解析成功: $($ips[0].IPAddress)" -ForegroundColor Green }
} catch { }
if (-not $dnsOk) {
    # Resolve-DnsName 与 ssh 共用系统解析器；失败时再用 nslookup 复核，防止单路径误判
    $nsOut = (nslookup $sshHost 2>&1 | Out-String)
    if ($nsOut -match 'Address:\s*(\d{1,3}(?:\.\d{1,3}){3})') {
        $dnsOk = $true
        Write-Host "    解析成功: $($matches[1])" -ForegroundColor Green
    }
}
if (-not $dnsOk) {
    Write-Host "ERROR: 域名 $sshHost 无法解析（Could not resolve hostname）" -ForegroundColor Red
    Write-Host "  可能原因与处理：" -ForegroundColor Yellow
    Write-Host "    1. DNS 缓存过期（已 flushdns，一般已解决）" -ForegroundColor Yellow
    Write-Host "    2. 花生壳客户端未在线 / 域名映射失效 —— 请检查花生壳客户端与映射后重试" -ForegroundColor Yellow
    Write-Host "    3. 网络/DNS 服务器异常 —— 稍后重试" -ForegroundColor Yellow
    Write-Host "  注意：不要将 host 改成 IP 直连，花生壳是动态 IP，改 IP 下次部署必失效。" -ForegroundColor Yellow
    exit 1
}

# ---------- 第 1 步：SSH 测试 ----------
Write-Host "==> 测试 SSH 连接 $sshUser@$sshHost`:$sshPort ..." -ForegroundColor Cyan
Invoke-Ssh 'echo SSH_OK'
Write-Host "    SSH 连接正常。" -ForegroundColor Green

# ---------- 第 2 步：编译 ----------
if ($cfg.build.frontend -eq $true) {
    Write-Host "==> 编译前端 ..." -ForegroundColor Cyan
    Push-Location (Join-Path $Root 'frontend')
    npm run build
    if ($LASTEXITCODE -ne 0) { Pop-Location; throw '前端编译失败' }
    Pop-Location
}
if ($cfg.build.backend -eq $true) {
    Write-Host "==> 编译后端 ..." -ForegroundColor Cyan
    Push-Location (Join-Path $Root 'backend')
    npm run build
    if ($LASTEXITCODE -ne 0) { Pop-Location; throw '后端编译失败' }
    Pop-Location
}

# ---------- 第 3 步：打包 ----------
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$tmp = Join-Path $env:TEMP "wtfk-deploy-$stamp"
New-Item -ItemType Directory -Path $tmp -Force | Out-Null
$feZip = Join-Path $tmp 'wtfk-frontend.zip'
$beZip = Join-Path $tmp 'wtfk-backend.zip'
$bat   = Join-Path $tmp 'deploy.bat'
$ffmpegZip = Join-Path $Root 'docs\工具\ffmpeg.zip'
$ffmpegSetup = Join-Path $Root 'deploy-ffmpeg-setup.ps1'

Write-Host "==> 打包 dist ..." -ForegroundColor Cyan
$feDist = Join-Path $Root 'frontend\dist'
$beDist = Join-Path $Root 'backend\dist'
if (-not (Test-Path $feDist)) { throw '前端 dist 不存在' }
if (-not (Test-Path $beDist)) { throw '后端 dist 不存在' }
Compress-Archive -Path (Join-Path $feDist '*') -DestinationPath $feZip -Force
Compress-Archive -Path (Join-Path $beDist '*') -DestinationPath $beZip -Force

# ---------- 第 4 步：本地生成远程部署脚本（避免命令行引号转义） ----------
$batContent = @"
@echo off
set TMP=C:\wtfk-deploy
set BK=C:\wtfk-backup\%date:~0,4%%date:~5,2%%date:~8,2%-%time:~0,2%%time:~3,2%
if not exist C:\wtfk-backup mkdir C:\wtfk-backup
mkdir "%BK%" 2>nul
echo [1/4] 停止前后台服务...
net stop WtfkBackend >nul 2>&1
net stop Nginx >nul 2>&1
echo [2/4] 备份并覆盖后端...
if exist C:\wtfk-backend\dist robocopy C:\wtfk-backend\dist "%BK%\backend-dist" /E /MOVE >nul
powershell -NoProfile -Command "Expand-Archive -Path '%TMP%\wtfk-backend.zip' -DestinationPath 'C:\wtfk-backend\dist' -Force"
echo [3/4] 备份并覆盖前端...
if exist C:\nginx\html\wtfk robocopy C:\nginx\html\wtfk "%BK%\frontend" /E /MOVE >nul
powershell -NoProfile -Command "Expand-Archive -Path '%TMP%\wtfk-frontend.zip' -DestinationPath 'C:\nginx\html\wtfk' -Force"
echo [4/4] 启动前后台服务...
net start WtfkBackend
net start Nginx
echo DEPLOY_DONE
"@
[System.IO.File]::WriteAllText($bat, $batContent, [System.Text.Encoding]::ASCII)

# ---------- 第 5 步：上传 ----------
Write-Host "==> 上传到服务器 ..." -ForegroundColor Cyan
Invoke-Ssh "if not exist $remoteTmp mkdir $remoteTmp"
Send-File $feZip "$remoteTmp\wtfk-frontend.zip"
Send-File $beZip "$remoteTmp\wtfk-backend.zip"
Send-File $bat   "$remoteTmp\deploy.bat"
# ffmpeg：远程已存在则跳过上传（幂等，避免每次传 115MB）
$ffHasFfmpeg = Invoke-Ssh 'if exist C:\wtfk-backend\ffmpeg\bin\ffmpeg.exe (echo YES) else (echo NO)'
if ($ffHasFfmpeg -match 'YES') {
    Write-Host "==> 远程已有 ffmpeg，跳过上传" -ForegroundColor DarkGray
} else {
    if (-not (Test-Path $ffmpegZip)) { throw "缺少 ffmpeg.zip: $ffmpegZip" }
    Send-File $ffmpegZip "$remoteTmp\ffmpeg.zip"
}
Send-File $ffmpegSetup "$remoteTmp\deploy-ffmpeg-setup.ps1"

# ---------- 第 6 步：远程执行部署 ----------
# 先配置 ffmpeg/.env/nginx（保证后端启动时已带 ffmpeg 配置），再执行 dist 覆盖
Write-Host "==> 远程配置 ffmpeg 与 nginx ..." -ForegroundColor Cyan
$setupOut = Invoke-Ssh "powershell -NoProfile -ExecutionPolicy Bypass -File $remoteTmp\deploy-ffmpeg-setup.ps1"
$setupOut | ForEach-Object { Write-Host $_ }
Write-Host "==> 远程部署中 ..." -ForegroundColor Cyan
$out = Invoke-Ssh "$remoteTmp\deploy.bat"
$out | ForEach-Object { Write-Host $_ }

# ---------- 第 7 步：验证 ----------
Write-Host "==> 验证服务状态 ..." -ForegroundColor Cyan
$state = Invoke-Ssh 'sc query WtfkBackend | findstr STATE & sc query Nginx | findstr STATE'
$state | ForEach-Object { Write-Host $_ }

Write-Host ""
Write-Host "==== 部署完成 ====" -ForegroundColor Green
Write-Host "前端地址: http://cjysoft.zicp.fun/login" -ForegroundColor Cyan
