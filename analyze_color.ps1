Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("E:\工作\HIS开发\新问题反馈系统\New_wtfk\user_login_color.png")
$w = $img.Width; $h = $img.Height
Write-Output "图片: ${w}x${h}"
function Sample($note, $x1, $y1, $x2, $y2) {
    $px1 = [int]($x1 * $w / 1000); $py1 = [int]($y1 * $h / 1000)
    $px2 = [int]($x2 * $w / 1000); $py2 = [int]($y2 * $h / 1000)
    $cx = [int](($px1 + $px2) / 2); $cy = [int](($py1 + $py2) / 2)
    $c = $img.GetPixel($cx, $cy)
    Write-Output "$note 中心($cx,$cy): RGB=($($c.R),$($c.G),$($c.B)) Hex=#$($c.R.ToString('X2'))$($c.G.ToString('X2'))$($c.B.ToString('X2'))"
}
# 账号输入框背景（中部）
Sample "账号输入框中部" 350 630 450 660
# 账号输入框左侧
Sample "账号输入框左侧" 230 630 260 660
# 密码输入框
Sample "密码输入框中部" 350 730 450 760
# login-box 区域（输入框左侧空白）
Sample "login-box 左侧" 200 630 225 660
# login-box 标题区
Sample "login-box 标题区" 350 300 450 350
# login-container 背景（login-box 外）
Sample "login-container 背景" 60 100 100 140
# 登录按钮
Sample "登录按钮" 300 830 350 860
$img.Dispose()
