Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("E:\工作\HIS开发\新问题反馈系统\New_wtfk\user_login_issue.png")
$w = $img.Width; $h = $img.Height
Write-Output "图片: ${w}x${h}"
function Sample($note, $x1, $y1, $x2, $y2) {
    $px1 = [int]($x1 * $w / 1000); $py1 = [int]($y1 * $h / 1000)
    $px2 = [int]($x2 * $w / 1000); $py2 = [int]($y2 * $h / 1000)
    $cx = [int](($px1 + $px2) / 2); $cy = [int](($py1 + $py2) / 2)
    $c = $img.GetPixel($cx, $cy)
    Write-Output "$note 中心($cx,$cy): RGB=($($c.R),$($c.G),$($c.B))"
}
Sample "账号输入框背景" 130 620 200 650
Sample "账号输入框右侧" 500 620 620 650
Sample "密码输入框背景" 200 700 620 760
Sample "login-box左侧" 120 620 160 660
Sample "login-box底部" 400 900 500 940
Sample "login-container左上" 60 120 100 160
Sample "login-box中部标题区" 400 420 500 500
$img.Dispose()
