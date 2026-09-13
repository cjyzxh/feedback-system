// 下载文件工具：优先弹出系统"另存为"对话框（Chrome/Edge 的 showSaveFilePicker），
// 让用户自己选择保存位置；浏览器不支持时（Firefox/Safari 或非 HTTPS 环境）降级为默认目录下载。
import axios from 'axios'

export async function downloadWithSaveDialog(url: string, suggestedName: string): Promise<boolean> {
  try {
    const res = await axios.get(url, { responseType: 'blob' })
    const blob = res.data as Blob
    const w = window as any
    // 优先：系统另存为对话框（需 HTTPS 或 localhost 安全上下文）
    if (typeof w.showSaveFilePicker === 'function') {
      try {
        const handle = await w.showSaveFilePicker({ suggestedName })
        const writable = await handle.createWritable()
        await writable.write(blob)
        await writable.close()
        return true
      } catch (err: any) {
        // 用户点了取消 → 不算失败
        if (err && err.name === 'AbortError') return false
        // 其它异常降级到默认下载
      }
    }
    // 降级：a 标签下载到浏览器默认目录
    const objectUrl = URL.createObjectURL(blob)
    const a = document.createElement('a')
    a.href = objectUrl
    a.download = suggestedName
    document.body.appendChild(a)
    a.click()
    a.remove()
    URL.revokeObjectURL(objectUrl)
    return true
  } catch (e) {
    console.error('下载文件失败:', e)
    return false
  }
}
