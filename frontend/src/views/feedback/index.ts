import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import type { App } from 'vue'

// 静态导入布局组件
import Layout from '@/views/layout/index.vue'
import Login from '@/views/login/index.vue'
import UserManage from '@/views/user/index.vue'
import FeedbackManage from '@/views/feedback/index.vue'
import FeedbackForm from '@/views/feedback/form.vue'
import SettingsManage from '@/views/settings/index.vue'

// 路由记录
const routes: RouteRecordRaw[] = [
  {
    path: '/login',
    name: 'Login',
    component: Login,
    meta: { title: '登录', hidden: true }
  },
  {
    path: '/',
    component: Layout,
    redirect: '/feedback',
    meta: { requiresAuth: true },
    children: [
      {
        path: '/feedback',
        name: 'FeedbackManage',
        component: FeedbackManage,
        meta: { title: '问题反馈', icon: 'ChatDotRound' }
      },
      {
        path: '/user',
        name: 'UserManage',
        component: UserManage,
        meta: { title: '用户管理', icon: 'User' }
      },
      {
        path: '/settings',
        name: 'SettingsManage',
        component: SettingsManage,
        meta: { title: '系统设置', icon: 'Setting' }
      }
    ]
  }
]

// 创建路由实例
const router = createRouter({
  history: createWebHistory(),
  routes
})

// 路由守卫
router.beforeEach((to, _from, next) => {
  const token = localStorage.getItem('token')
  
  if (to.meta.requiresAuth && !token) {
    next('/login')
  } else if (to.path === '/login' && token) {
    next('/')
  } else {
    next()
  }
})

// 安装路由
export function setupRouter(app: App) {
  app.use(router)
}

export default router
