// ============================================================
// 全局字体/字号 工具（其它设置 → 字体字号）
// 系统级配置存后端 database-config.json（fontSize 字段）
// 选项：small=13px / standard=14px / large=15px / xlarge=16px
// 应用方式：设置根元素 --el-font-size-base，Element Plus 所有组件
//           及页面基础文字统一生效（按钮/输入框/表格/标签等）
// ============================================================

export const FONT_SIZE_MAP: Record<string, string> = {
  small: '13px',
  standard: '14px',
  large: '15px',
  xlarge: '16px',
}

export const FONT_SIZE_LABELS: Record<string, string> = {
  small: '小（13px）',
  standard: '标准（14px）',
  large: '大（15px）',
  xlarge: '特大（16px）',
}

// 立即应用字号到全局（不依赖后端）
export function applyFontSize(size: string) {
  const px = FONT_SIZE_MAP[size] || '14px'
  document.documentElement.style.setProperty('--el-font-size-base', px)
  localStorage.setItem('fontSize', size || 'standard')
}

// 从后端加载系统字号并应用（登录页 / 布局页进入时调用）
export async function applySystemFontSize() {
  try {
    const res = await fetch('/api/config/font-size')
    if (res.ok) {
      const data = await res.json()
      applyFontSize(data.fontSize || 'standard')
      return
    }
  } catch (e) {
    console.warn('获取系统字体字号失败，使用本地缓存:', e)
  }
  // 后端不可用时回退到本地缓存 / 默认
  applyFontSize(localStorage.getItem('fontSize') || 'standard')
}
