# -*- coding: utf-8 -*-
# 在 backend/.env 中追加 ffmpeg 路径配置（幂等：已存在则更新）
import io, os, re

ENV = r"E:\工作\HIS开发\新问题反馈系统\New_wtfk\backend\.env"
FFMPEG = r"E:\工作\HIS开发\新问题反馈系统\New_wtfk\docs\工具\ffmpeg\bin\ffmpeg.exe"
FFPROBE = r"E:\工作\HIS开发\新问题反馈系统\New_wtfk\docs\工具\ffmpeg\bin\ffprobe.exe"

with io.open(ENV, "r", encoding="utf-8-sig") as f:
    text = f.read()

def upsert(text, key, value):
    pat = re.compile(rf"^{key}=.*$", re.M)
    line = f"{key}={value}"
    if pat.search(text):
        return pat.sub(line, text)
    if not text.endswith("\n"):
        text += "\n"
    return text + line + "\n"

text = upsert(text, "FFMPEG_PATH", FFMPEG)
text = upsert(text, "FFPROBE_PATH", FFPROBE)

with io.open(ENV, "w", encoding="utf-8", newline="\n") as f:
    f.write(text)

print("FFMPEG_PATH=%s" % FFMPEG)
print("FFPROBE_PATH=%s" % FFPROBE)
