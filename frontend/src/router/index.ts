import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import type { App } from 'vue'

import Layout from '@/views/layout/index.vue'
import Login from '@/views/login/index.vue'
import FeedbackList from '@/views/feedback/index.vue'
import FeedbackForm from '@/views/feedback/form.vue'
import TestHandle from '@/views/test/index.vue'
import TestCheck from '@/views/testcheck/index.vue'
import Settings from '@/views/settings/index.vue'
import StaffManage from '@/views/settings/staff.vue'
import ModuleManage from '@/views/settings/module.vue'
import FormManage from '@/views/settings/form.vue'
import UserManage from '@/views/user/index.vue'
import HospitalManage from '@/views/hospital/index.vue'
import RoleManage from '@/views/role/index.vue'
import DiscussList from '@/views/discuss/index.vue'
import Report from '@/views/report/index.vue'

// 路由配置
// 类似于 VB6 的菜单配置，定义每个路径对应的页面组件
const routes: RouteRecordRaw[] = [
  // 登录页面（不需要认证）
  { path: '/login', name: 'Login', component: Login, meta: { title: '登录', hidden: true } },
  
  // 主布局（包含侧边栏、顶部导航）
  {
    path: '/',
    component: Layout,  // 布局组件
    redirect: '/feedback',  // 默认重定向到问题列表
    meta: { requiresAuth: true },  // 需要登录认证
    children: [
      // 问题列表
      { path: '/feedback', name: 'FeedbackList', component: FeedbackList, meta: { title: '问题列表', permission: 'feedback' } },
      // 问题详情/编辑
      { path: '/feedback/:id', name: 'FeedbackForm', component: FeedbackForm, meta: { title: '问题详情', hidden: true } },
      // 问题处理
      { path: '/test', name: 'TestHandle', component: TestHandle, meta: { title: '问题处理', permission: 'test' } },
      // 问题测试
      { path: '/testcheck', name: 'TestCheck', component: TestCheck, meta: { title: '问题测试', permission: 'testcheck' } },
      // 问题讨论
      { path: '/discuss', name: 'DiscussList', component: DiscussList, meta: { title: '问题讨论', permission: 'test' } },
      // 时效报表
      { path: '/report', name: 'Report', component: Report, meta: { title: '时效报表', permission: 'test' } },
      
      // 系统管理（子菜单）
      {
        path: '/settings',
        component: Settings,
        redirect: '/settings',
        children: [
          { path: '', name: 'SettingsHome', component: Settings, meta: { title: '系统管理', permission: 'settings' } },
          { path: 'staff', name: 'StaffManage', component: StaffManage, meta: { title: '人员维护', permission: 'settings' } },
          { path: 'module', name: 'ModuleManage', component: ModuleManage, meta: { title: '模块维护', permission: 'settings' } },
          { path: 'form', name: 'FormManage', component: FormManage, meta: { title: '窗体维护', permission: 'settings' } },
          { path: 'user', name: 'UserManage', component: UserManage, meta: { title: '用户管理', permission: 'user' } },
          { path: 'hospital', name: 'HospitalManage', component: HospitalManage, meta: { title: '医院维护' } },
          { path: 'role', name: 'RoleManage', component: RoleManage, meta: { title: '角色管理', permission: 'role' } }
        ]
      }
    ]
  }
]

// 创建路由实例
const router = createRouter({ history: createWebHistory(), routes })

// 路由守卫（页面跳转前执行）
// 类似于 VB6 的 Form_Load 或权限验证
router.beforeEach((to, from, next) => {
  // 从 localStorage 中获取 token
  const token = localStorage.getItem('token')
  
  // 如果页面需要认证但没有 token，跳转到登录页
  if (to.meta.requiresAuth && !token) next('/login')
  // 如果已经登录了但访问登录页，跳转到首页
  else if (to.path === '/login' && token) next('/')
  // 其他情况正常跳转
  else next()
})

export function setupRouter(app: App) { app.use(router) }
export default router