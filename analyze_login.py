from PIL import Image
img = Image.open(r"E:\工作\HIS开发\新问题反馈系统\New_wtfk\user_login_issue.png").convert("RGB")
w, h = img.size
print(f"图片: {w}x{h}")
# 输入框区域（OCR: 账号 cjyzxh 在 208,626-302,658 / 800x1000 千分比）
def sample(note, x1, y1, x2, y2):
    # 千分比 -> 像素
    px1, py1, px2, py2 = int(x1*w/1000), int(y1*h/1000), int(x2*w/1000), int(y2*h/1000)
    # 采样中心点
    cx, cy = (px1+px2)//2, (py1+py2)//2
    print(f"{note} 中心({cx},{cy}): RGB={img.getpixel((cx,cy))}")
# 账号输入框背景（文字下方空白处）
sample("账号输入框背景(左)", 130, 620, 200, 650)
sample("账号输入框背景(右)", 500, 620, 620, 650)
# 密码输入框背景
sample("密码输入框背景", 200, 700, 620, 760)
# login-box 区域（输入框左侧空白）
sample("login-box 左侧", 120, 620, 160, 660)
# login-box 底部（按钮下方）
sample("login-box 底部", 400, 900, 500, 940)
# 页面深色背景（login-container，login-box 外）
sample("login-container 左上角", 60, 120, 100, 160)
