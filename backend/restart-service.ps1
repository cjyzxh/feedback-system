
Start-Sleep -Seconds 3
Set-Location "E:\工作\HIS开发\其它相关文件\web\code\wtfk - doubao\backend"
Start-Process -FilePath "node" -ArgumentList "dist/src/main.js" -RedirectStandardOutput "E:\工作\HIS开发\其它相关文件\web\code\wtfk - doubao\backend\backend-startup.log" -RedirectStandardError "E:\工作\HIS开发\其它相关文件\web\code\wtfk - doubao\backend\backend-startup.log" -WindowStyle Hidden
