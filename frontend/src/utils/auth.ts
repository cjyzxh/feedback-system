// ============================================================
// 登录 Token 统一存取工具
// ------------------------------------------------------------
// 规则（与后端约定一致）：
//   - 手机号（验证码）登录：token 存 localStorage + tokenTime
//     → 有效 6 小时，超过必须重新登录；浏览器关闭不失效
//   - 账号密码登录 / 内置超管 admin：token 存 sessionStorage
//     → 浏览器关闭（标签页关闭）即失效，无需检查时间
//   - 两种方式：只要界面不关，刷新页面都不用重新登录
// ============================================================

// 手机号登录 token 有效期：6 小时
const PHONE_TOKEN_TTL = 6 * 60 * 60 * 1000

/**
 * 保存 token（按登录方式选择存储位置）
 * @param token 后端返回的 token
 * @param mode  登录方式：'sms'（手机号验证码）/'account'（账号密码，含内置超管）
 */
export function setToken(token: string, mode: string) {
  if (mode === 'sms') {
    localStorage.setItem('token', token)
    localStorage.setItem('tokenTime', String(Date.now()))
  } else {
    sessionStorage.setItem('token', token)
  }
}

/**
 * 读取 token（sessionStorage 优先，其次 localStorage）
 * 账号登录和手机号登录互不覆盖，都能取到
 */
export function getToken(): string | null {
  return sessionStorage.getItem('token') || localStorage.getItem('token')
}

/**
 * 当前登录方式（用于判断走哪套有效期规则）
 */
export function getLoginMode(): string {
  return localStorage.getItem('token') ? 'sms' : 'account'
}

/**
 * 清除 token（两个存储位置都清，含 tokenTime）
 */
export function clearToken() {
  sessionStorage.removeItem('token')
  localStorage.removeItem('token')
  localStorage.removeItem('tokenTime')
}

/**
 * 手机号登录的 token 是否已超过 6 小时
 * 账号登录（sessionStorage）不在此列，由浏览器关闭自然失效
 */
export function isPhoneTokenExpired(): boolean {
  const token = localStorage.getItem('token')
  if (!token) return false
  const tokenTime = Number(localStorage.getItem('tokenTime') || 0)
  if (!tokenTime) return true // 有 token 但没有时间记录 → 视为过期
  return Date.now() - tokenTime > PHONE_TOKEN_TTL
}
