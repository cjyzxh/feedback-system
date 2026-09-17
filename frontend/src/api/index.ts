import axios, { AxiosInstance, AxiosRequestConfig } from 'axios'
import { ElMessage } from 'element-plus'
import router from '@/router'
import { getToken, clearToken } from '@/utils/auth'

// 创建 axios 实例
// 类似于 VB6 的 WinHTTP 或 XMLHTTP 对象
const instance: AxiosInstance = axios.create({
  baseURL: '/api',  // 基础URL，会自动拼接到请求地址前
  timeout: 10000   // 请求超时时间（10秒）
})

// ========== 请求拦截器 ==========
// 发送请求前自动添加 Token
instance.interceptors.request.use((config) => {
  // 读取 token（sessionStorage 优先，其次 localStorage）
  const token = getToken()
  // 如果有 token，添加到请求头 Authorization 中
  if (token) { config.headers.Authorization = 'Bearer ' + token }
  return config
}, (error) => Promise.reject(error))

// ========== 响应拦截器 ==========
// 统一处理响应错误
instance.interceptors.response.use((response) => {
  // 写操作（增删改）成功且属于业务主表 → 通知 layout 刷新右上角处理状态统计
  // （SSE 之外的本机保险：操作成功后立即刷新，不依赖推送连接）
  const m = (response.config.method || '').toUpperCase()
  const u = response.config.url || ''
  if ((m === 'POST' || m === 'PUT' || m === 'DELETE') && u.startsWith('/feedback')) {
    window.dispatchEvent(new CustomEvent('feedback-data-changed'))
  }
  return response
}, (error) => {
  // 如果是 401 未授权（Token过期/无效/被顶下线），并且当前不在登录页
  if (error.response?.status === 401 && router.currentRoute.value.path !== '/login') {
    // 区分"被顶下线"和"登录过期"
    const kicked = error.response?.data?.code === 'SESSION_KICKED'
    // 清除本地存储的 token 和用户信息
    clearToken()
    localStorage.removeItem('user')
    // 提示用户（被顶下线 / 正常过期）
    ElMessage.warning(kicked ? '您的账号已在其他设备登录，已强制下线' : '登录已过期，请重新登录')
    // 跳转到登录页
    router.push('/login')
  }
  return Promise.reject(error)
})

// 基础 HTTP 请求方法封装（页面里所有 axios.get/post/put/delete 实际都走这里）
// 统一自动带 token、统一处理 401，页面代码不用重复写
const api = {
  get(url: string, config?: AxiosRequestConfig): Promise<any> { return instance.get(url, config) },
  post(url: string, data?: any, config?: AxiosRequestConfig): Promise<any> { return instance.post(url, data, config) },
  put(url: string, data?: any, config?: AxiosRequestConfig): Promise<any> { return instance.put(url, data, config) },
  delete(url: string, config?: AxiosRequestConfig): Promise<any> { return instance.delete(url, config) }
}

// ========== 认证相关 API（登录/退出/取用户信息） ==========
export const authApi = {
  // 用户登录
  login(data: any): Promise<any> { return api.post('/auth/login', data) },
  // 退出登录
  logout(): Promise<any> { return api.post('/auth/logout') },
  // 获取当前登录用户信息
  getUserInfo(): Promise<any> { return api.get('/auth/userInfo') },
  // 会话有效性校验（登录互斥轮询用：被顶下线时返回 401）
  sessionCheck(): Promise<any> { return api.get('/auth/session-check') }
}

// ========== 用户管理 API（对应后端 /api/user 接口） ==========
export const userApi = {
  // 获取用户列表
  getList(params: any): Promise<any> { return api.get('/user', { params }) },
  // 根据ID获取用户
  getById(id: number): Promise<any> { return api.get('/user/' + id) },
  // 创建用户
  create(data: any): Promise<any> { return api.post('/user', data) },
  // 更新用户
  update(id: number, data: any): Promise<any> { return api.put('/user/' + id, data) },
  // 删除用户
  delete(id: number): Promise<any> { return api.delete('/user/' + id) }
}

// ========== 角色管理 API（对应后端 /api/roles 接口） ==========
export const roleApi = {
  // 获取角色列表
  getList(params: any): Promise<any> { return api.get('/roles', { params }) },
  // 获取所有角色（不分页）
  getAll(): Promise<any> { return api.get('/roles/list') },
  // 根据ID获取角色
  getById(id: number): Promise<any> { return api.get('/roles/' + id) },
  // 创建角色
  create(data: any): Promise<any> { return api.post('/roles', data) },
  // 更新角色
  update(id: number, data: any): Promise<any> { return api.put('/roles/' + id, data) },
  // 删除角色
  delete(id: number): Promise<any> { return api.delete('/roles/' + id) }
}

export default api
