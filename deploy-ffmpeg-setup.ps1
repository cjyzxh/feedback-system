# ============================================================
# Remote ffmpeg deploy & config script (ASCII only for PS5 compat)
# 1. Extract ffmpeg to C:\wtfk-backend\ffmpeg (skip if exists)
# 2. Write FFMPEG_PATH / FFPROBE_PATH into C:\wtfk-backend\.env
# 3. Add client_max_body_size 60m to nginx.conf (idempotent)
# Run BEFORE deploy.bat so backend starts with ffmpeg configured.
# ============================================================
$ErrorActionPreference = 'Stop'

# ---------- 1. Extract ffmpeg ----------
if (-not (Test-Path 'C:\wtfk-backend\ffmpeg\bin\ffmpeg.exe')) {
    $zip = $null
    if (Test-Path 'C:\wtfk-deploy\ffmpeg.zip') { $zip = 'C:\wtfk-deploy\ffmpeg.zip' }
    elseif (Test-Path 'C:\ffmpeg.zip') { $zip = 'C:\ffmpeg.zip' }
    if ($zip) {
        Write-Host "[ffmpeg] Extracting $zip ..."
        if (Test-Path 'C:\wtfk-backend\ffmpeg') { Remove-Item 'C:\wtfk-backend\ffmpeg' -Recurse -Force }
        Expand-Archive -Path $zip -DestinationPath 'C:\wtfk-backend' -Force
    } else {
        Write-Host '[ffmpeg] WARN: ffmpeg.zip not found'
    }
} else {
    Write-Host '[ffmpeg] Already exists, skip extract'
}

# ---------- 2. Write .env ----------
$envPath = 'C:\wtfk-backend\.env'
$lines = New-Object System.Collections.Generic.List[string]
if (Test-Path $envPath) {
    $lines.AddRange([System.IO.File]::ReadAllLines($envPath))
}
function Set-Line([string]$key, [string]$val) {
    for ($i = 0; $i -lt $lines.Count; $i++) {
        if ($lines[$i] -match "^$key=") { $lines[$i] = "$key=$val"; return }
    }
    $lines.Add("$key=$val")
}
Set-Line 'FFMPEG_PATH' 'C:\wtfk-backend\ffmpeg\bin\ffmpeg.exe'
Set-Line 'FFPROBE_PATH' 'C:\wtfk-backend\ffmpeg\bin\ffprobe.exe'
[System.IO.File]::WriteAllLines($envPath, $lines, (New-Object System.Text.UTF8Encoding($false)))
Write-Host '[ffmpeg] .env updated: FFMPEG_PATH / FFPROBE_PATH'

# ---------- 3. nginx.conf upload size ----------
$nginx = 'C:\nginx\conf\nginx.conf'
if (Test-Path $nginx) {
    $t = [System.IO.File]::ReadAllText($nginx)
    if ($t -notmatch 'client_max_body_size') {
        Write-Host '[nginx] Adding client_max_body_size 60m ...'
        $regex = New-Object System.Text.RegularExpressions.Regex('server \{')
        $t = $regex.Replace($t, "client_max_body_size 60m;`r`nserver {", 1)
        [System.IO.File]::WriteAllText($nginx, $t, (New-Object System.Text.UTF8Encoding($false)))
        Write-Host '[nginx] nginx.conf updated (take effect after nginx restart)'
    } else {
        Write-Host '[nginx] client_max_body_size already present, skip'
    }
} else {
    Write-Host '[nginx] WARN: C:\nginx\conf\nginx.conf not found'
}

Write-Host 'FFMPEG_SETUP_DONE'
