// 用户类型
export interface User {
  id?: number
  username: string
  password?: string
  realName: string
  email: string
  phone?: string
  role: 'admin' | 'user'
  status: 0 | 1  // 0: 禁用, 1: 正常
  createTime?: string
  updateTime?: string
}

// 登录请求
export interface LoginRequest {
  username: string
  password: string
}

// 登录响应
export interface LoginResponse {
  code: number
  message: string
  data: {
    token: string
    user: Omit<User, 'password'>
  }
}

// API 响应封装
export interface ApiResponse<T = any> {
  code: number
  message: string
  data: T
}

// 分页查询参数
export interface PageParams {
  page: number
  pageSize: number
  keyword?: string
}

// 分页响应
export interface PageResponse<T> {
  list: T[]
  total: number
  page: number
  pageSize: number
}
