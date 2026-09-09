@echo off
chcp 65001 >nul
title WTFK Backup to NAS
cd /d E:\工作\HIS开发\新问题反馈系统\New_wtfk

:: extract version from version.ts
for /f "tokens=2 delims='" %%a in ('findstr /r APP_VERSION frontend\src\version.ts') do set VER=%%a
if "%VER%"=="" set VER=unknown

:: date YYYY-MM-DD
set DT=%date:~0,10%
set DT=%DT:/=-%

echo ========================================
echo  Backup to NAS Gitea (cjyzxh/feedback-system)
echo  Version: %VER%   Date: %DT%
echo ========================================
echo.

echo [1/3] git add -A ...
git add -A
if errorlevel 1 goto :err

echo [2/3] git commit ...
git commit -m "v%VER% %DT% backup"
if errorlevel 1 goto :err

echo [3/3] git push nas master ...
git push nas master
if errorlevel 1 goto :err

echo.
echo ========================================
echo  Backup OK - pushed to NAS Gitea
echo ========================================
goto :end

:err
echo.
echo  ERROR: backup failed, please check the output above.
timeout /t 10 >nul
exit /b 1

:end
timeout /t 10 >nul
