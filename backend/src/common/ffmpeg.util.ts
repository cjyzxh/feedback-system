// ============================================================================
// ffmpeg 视频转码工具
// 用途：把浏览器不支持的视频编码（MPEG-4/H.265/VP9 等）统一转成 H.264+AAC 的 mp4
// 依赖：ffmpeg / ffprobe 可执行文件（优先取环境变量 FFMPEG_PATH / FFPROBE_PATH，
//        未设置时从系统 PATH 中查找）
// ============================================================================
import { execFile } from 'child_process';
import { promisify } from 'util';

const execFileP = promisify(execFile);

// 可执行文件解析：环境变量优先，否则用命令名（依赖 PATH）
function resolveBin(name: 'ffmpeg' | 'ffprobe'): string {
  if (name === 'ffmpeg' && process.env.FFMPEG_PATH) return process.env.FFMPEG_PATH;
  if (name === 'ffprobe' && process.env.FFPROBE_PATH) return process.env.FFPROBE_PATH;
  return name;
}

// 探测视频文件第一个视频流的编码名称（h264 / hevc / mpeg4 / vp9 ...）
// 探测失败（无视频流或 ffprobe 不可用）返回 null
export async function probeVideoCodec(filePath: string): Promise<string | null> {
  try {
    const { stdout } = await execFileP(
      resolveBin('ffprobe'),
      ['-v', 'error', '-select_streams', 'v:0', '-show_entries', 'stream=codec_name', '-of', 'csv=p=0', filePath],
      { timeout: 15000, windowsHide: true },
    );
    const codec = stdout.trim();
    return codec || null;
  } catch (e) {
    console.error('ffprobe 探测视频编码失败:', filePath, e?.message || e);
    return null;
  }
}

// 转码为 H.264 + AAC 的 mp4（veryfast 预设，CRF 23 平衡质量与体积；faststart 便于网页流式播放）
export async function transcodeToH264(input: string, output: string): Promise<void> {
  await execFileP(
    resolveBin('ffmpeg'),
    ['-y', '-i', input, '-c:v', 'libx264', '-preset', 'veryfast', '-crf', '23', '-c:a', 'aac', '-movflags', '+faststart', output],
    { timeout: 300000, windowsHide: true, maxBuffer: 64 * 1024 * 1024 },
  );
}

// 常见视频扩展名
export function isVideoFile(filename: string): boolean {
  return /\.(mp4|mov|avi|wmv|mkv|flv|webm|m4v|mpg|mpeg|3gp|rmvb)$/i.test(filename);
}
