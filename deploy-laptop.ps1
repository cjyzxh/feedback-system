# ============================================================
# deploy-laptop.ps1 - LAPTOP deploy: build -> pack -> upload -> remote deploy
# Laptop-specific: SKIP ffmpeg.zip upload & ffmpeg-setup (already configured on server)
# Usage: powershell -ExecutionPolicy Bypass -File deploy-laptop.ps1
# Depends: SSH key auth (id_ed25519, BatchMode)
# ============================================================
param([switch]$SkipBuild)
$ErrorActionPreference = 'Stop'
$Root = Split-Path -Parent $MyInvocation.MyCommand.Path

# ---------- load config ----------
$cfgPath = Join-Path $Root 'deploy-config.json'
if (-not (Test-Path $cfgPath)) {
    Write-Host 'ERROR: deploy-config.json missing' -ForegroundColor Red
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
    if ($LASTEXITCODE -ne 0) { throw "SSH command failed: $cmd" }
}
function Send-File([string]$local, [string]$remote, [int]$tries = 3) {
    for ($i = 1; $i -le $tries; $i++) {
        Write-Host "  upload $([System.IO.Path]::GetFileName($local)) (try $i)..." -ForegroundColor Cyan
        scp @scpOpts "`"$local`"" "${sshUser}@${sshHost}:`"$remote`"" 2>&1
        if ($LASTEXITCODE -eq 0) { return }
        Start-Sleep -Seconds 3
    }
    throw "upload failed: $local"
}

# ---------- step 0: SSH test ----------
Write-Host "==> SSH test $sshUser@$sshHost`:$sshPort ..." -ForegroundColor Cyan
Invoke-Ssh 'echo SSH_OK'
Write-Host "    SSH OK." -ForegroundColor Green

# ---------- step 1: build ----------
if (-not $SkipBuild -and $cfg.build.frontend -eq $true) {
    Write-Host "==> build frontend ..." -ForegroundColor Cyan
    Push-Location (Join-Path $Root 'frontend')
    npm run build
    if ($LASTEXITCODE -ne 0) { Pop-Location; throw 'frontend build failed' }
    Pop-Location
}
if (-not $SkipBuild -and $cfg.build.backend -eq $true) {
    Write-Host "==> build backend ..." -ForegroundColor Cyan
    Push-Location (Join-Path $Root 'backend')
    npm run build
    if ($LASTEXITCODE -ne 0) { Pop-Location; throw 'backend build failed' }
    Pop-Location
}

# ---------- step 2: pack ----------
$stamp = Get-Date -Format 'yyyyMMdd-HHmmss'
$tmp = Join-Path $env:TEMP "wtfk-deploy-$stamp"
New-Item -ItemType Directory -Path $tmp -Force | Out-Null
$feZip = Join-Path $tmp 'wtfk-frontend.zip'
$beZip = Join-Path $tmp 'wtfk-backend.zip'
$bat   = Join-Path $tmp 'deploy.bat'

Write-Host "==> pack dist ..." -ForegroundColor Cyan
$feDist = Join-Path $Root 'frontend\dist'
$beDist = Join-Path $Root 'backend\dist'
if (-not (Test-Path $feDist)) { throw 'frontend dist missing' }
if (-not (Test-Path $beDist)) { throw 'backend dist missing' }
Compress-Archive -Path (Join-Path $feDist '*') -DestinationPath $feZip -Force
Compress-Archive -Path (Join-Path $beDist '*') -DestinationPath $beZip -Force

# ---------- step 3: generate remote deploy.bat ----------
$batContent = @"
@echo off
set TMP=C:\wtfk-deploy
set BK=C:\wtfk-backup\%date:~0,4%%date:~5,2%%date:~8,2%-%time:~0,2%%time:~3,2%
if not exist C:\wtfk-backup mkdir C:\wtfk-backup
mkdir "%BK%" 2>nul
echo [1/4] stop services...
net stop WtfkBackend >nul 2>&1
net stop Nginx >nul 2>&1
echo [2/4] backup+replace backend...
if exist C:\wtfk-backend\dist robocopy C:\wtfk-backend\dist "%BK%\backend-dist" /E /MOVE >nul
powershell -NoProfile -Command "Expand-Archive -Path '%TMP%\wtfk-backend.zip' -DestinationPath 'C:\wtfk-backend\dist' -Force"
echo [3/4] backup+replace frontend...
if exist C:\nginx\html\wtfk robocopy C:\nginx\html\wtfk "%BK%\frontend" /E /MOVE >nul
powershell -NoProfile -Command "Expand-Archive -Path '%TMP%\wtfk-frontend.zip' -DestinationPath 'C:\nginx\html\wtfk' -Force"
echo [4/4] start services...
net start WtfkBackend
net start Nginx
echo DEPLOY_DONE
"@
[System.IO.File]::WriteAllText($bat, $batContent, [System.Text.Encoding]::ASCII)

# ---------- step 4: upload (NO ffmpeg - already configured) ----------
Write-Host "==> upload to server ..." -ForegroundColor Cyan
Invoke-Ssh "if not exist $remoteTmp mkdir $remoteTmp"
Send-File $feZip "$remoteTmp\wtfk-frontend.zip"
Send-File $beZip "$remoteTmp\wtfk-backend.zip"
Send-File $bat   "$remoteTmp\deploy.bat"

# ---------- step 5: remote deploy ----------
Write-Host "==> remote deploy ..." -ForegroundColor Cyan
$out = Invoke-Ssh "$remoteTmp\deploy.bat"
$out | ForEach-Object { Write-Host $_ }

# ---------- step 6: verify ----------
Write-Host "==> verify services ..." -ForegroundColor Cyan
$state = Invoke-Ssh 'sc query WtfkBackend | findstr STATE & sc query Nginx | findstr STATE'
$state | ForEach-Object { Write-Host $_ }

Write-Host ""
Write-Host "==== DEPLOY DONE ====" -ForegroundColor Green
Write-Host "Frontend: http://cjysoft.zicp.fun/login" -ForegroundColor Cyan
