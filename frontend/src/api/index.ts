import axios, { AxiosInstance, AxiosRequestConfig, AxiosResponse } from 'axios'
import { ElMessage } from 'element-plus'
import router from '@/router'
import type { ApiResponse, LoginRequest, LoginResponse, PageParams, PageResponse, User } from '@/types'

// 创建 axios 实例
const instance: AxiosInstance = axios.create({
  baseURL: '/api',
  timeout: 10000
})

// 请求拦截器
instance.interceptors.request.use(
  (config) => {
    const token = localStorage.getItem('token')
    if (token) {
      config.headers.Authorization = `Bearer ${token}`
    }
    return config
  },
  (error) => {
    return Promise.reject(error)
  }
)

// 响应拦截器
instance.interceptors.response.use(
  (response: AxiosResponse<ApiResponse>) => {
    const { code, message } = response.data
    
    if (code === 200) {
      return response.data
    }
    
    // 未授权
    if (code === 401) {
      ElMessage.error('登录已过期，请重新登录')
      localStorage.removeItem('token')
      localStorage.removeItem('user')
      router.push('/login')
      return Promise.reject(new Error(message))
    }
    
    ElMessage.error(message || '请求失败')
    return Promise.reject(new Error(message))
  },
  (error) => {
    ElMessage.error(error.message || '网络错误')
    return Promise.reject(error)
  }
)

// 扩展 axios 实例方法
const api = {
  get<T = any>(url: string, config?: AxiosRequestConfig): Promise<ApiResponse<T>> {
    return instance.get(url, config) as Promise<ApiResponse<T>>
  },
  
  post<T = any>(url: string, data?: any, config?: AxiosRequestConfig): Promise<ApiResponse<T>> {
    return instance.post(url, data, config) as Promise<ApiResponse<T>>
  },
  
  put<T = any>(url: string, data?: any, config?: AxiosRequestConfig): Promise<ApiResponse<T>> {
    return instance.put(url, data, config) as Promise<ApiResponse<T>>
  },
  
  delete<T = any>(url: string, config?: AxiosRequestConfig): Promise<ApiResponse<T>> {
    return instance.delete(url, config) as Promise<ApiResponse<T>>
  }
}

// 认证接口
export const authApi = {
  login(data: LoginRequest): Promise<ApiResponse<LoginResponse['data']>> {
    return api.post('/auth/login', data)
  },
  
  logout(): Promise<ApiResponse<null>> {
    return api.post('/auth/logout')
  },
  
  getUserInfo(): Promise<ApiResponse<Omit<User, 'password'>>> {
    return api.get('/auth/userInfo')
  }
}

// 用户管理接口
export const userApi = {
  // 获取用户列表（分页）
  getList(params: PageParams): Promise<ApiResponse<PageResponse<User>>> {
    return api.get('/user', { params })
  },
  
  // 获取用户详情
  getById(id: number): Promise<ApiResponse<User>> {
    return api.get(`/user/${id}`)
  },
  
  // 创建用户
  create(data: Omit<User, 'id' | 'createTime' | 'updateTime'>): Promise<ApiResponse<User>> {
    return api.post('/user', data)
  },
  
  // 更新用户
  update(id: number, data: Partial<User>): Promise<ApiResponse<User>> {
    return api.put(`/user/${id}`, data)
  },
  
  // 删除用户
  delete(id: number): Promise<ApiResponse<null>> {
    return api.delete(`/user/${id}`)
  },
  
  // 批量删除用户
  batchDelete(ids: number[]): Promise<ApiResponse<null>> {
    return api.post('/user/batch-delete', { ids })
  }
}

export default api
