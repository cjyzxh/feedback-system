Add-Type -AssemblyName System.Drawing
$img = [System.Drawing.Bitmap]::FromFile("E:\工作\HIS开发\新问题反馈系统\New_wtfk\user_login_color.png")
$w = $img.Width; $h = $img.Height
Write-Output "图片: ${w}x${h}"
function Sample($note, $px, $py2) {
    $c = $img.GetPixel($px, $py2)
    Write-Output "$note ($px,$py2): RGB=($($c.R),$($c.G),$($c.B)) Hex=#$($c.R.ToString('X2'))$($c.G.ToString('X2'))$($c.B.ToString('X2'))"
}
# OCR 用户名框: 千分比 232,541-412,573 -> 像素 x=306-543, y=638-676
Sample "用户名框中心" 425 656
Sample "用户名框内左" 350 656
Sample "用户名框内右" 500 656
# OCR 密码框: 千分比 232,629-342,661 -> 像素 x=306-451, y=742-779
Sample "密码框中心" 379 760
Sample "密码框内左" 330 760
Sample "密码框内右" 430 760
# 密码框上方（可能是另一个输入框或区域）
Sample "密码框上方" 379 720
# 登录卡片背景（用户名框左侧）
Sample "卡片背景(用户名框左)" 280 656
$img.Dispose()
