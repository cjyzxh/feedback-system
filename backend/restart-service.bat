
        @echo off
        timeout /t 3 /nobreak >nul
        cd /d "E:\工作\HIS开发\其它相关文件\web\code\wtfk - doubao\backend"
        start "" node dist/src/main.js > "E:\工作\HIS开发\其它相关文件\web\code\wtfk - doubao\backend\backend-error.log" 2>&1
      