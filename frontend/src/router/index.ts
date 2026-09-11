import { createRouter, createWebHistory, RouteRecordRaw } from 'vue-router'
import type { App } from 'vue'
import { getToken, clearToken, isPhoneTokenExpired } from '@/utils/auth'

import Layout from '@/views/layout/index.vue'
import Login from '@/views/login/index.vue'
import FeedbackList from '@/views/feedback/index.vue'
import TestHandle from '@/views/test/index.vue'
import TestCheck from '@/views/testcheck/index.vue'
import Settings from '@/views/settings/index.vue'
// import StaffManage from '@/views/settings/staff.vue'  // 已停用：人员维护页（人员数据源改为 sys_user）
import ModuleManage from '@/views/settings/module.vue'
import FormManage from '@/views/settings/form.vue'
import TemplateManage from '@/views/settings/template.vue'
import UserManage from '@/views/user/index.vue'
import RoleManage from '@/views/role/index.vue'
import DiscussList from '@/views/discuss/index.vue'
import Report from '@/views/report/index.vue'
import ModifyStatusReport from '@/views/report/modify-status.vue'

// ============ 路由配置（类比 VB6 的菜单配置：每个菜单项对应一个窗体） ============
// meta 里的字段：
//   title        = 菜单/页面标题
//   hidden       = true 表示不出现在侧边栏（如登录页、问题详情页）
//   permission   = 菜单权限标识（角色勾选的权限里包含它才能访问）
//   requireAdmin = true 表示仅管理员可访问（用户管理/角色管理）
//   requiresAuth = true 表示必须登录才能进（挂在父路由上，子路由都继承）
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
      // 问题处理
      { path: '/test', name: 'TestHandle', component: TestHandle, meta: { title: '问题处理', permission: 'test' } },
      // 问题测试
      { path: '/testcheck', name: 'TestCheck', component: TestCheck, meta: { title: '问题测试', permission: 'testcheck' } },
      // 问题讨论（暂时隐藏菜单）
      { path: '/discuss', name: 'DiscussList', component: DiscussList, meta: { title: '问题讨论', permission: 'test', hidden: true } },
      // 数据统计
      { path: '/report', name: 'Report', component: Report, meta: { title: '数据统计', permission: 'test' } },
      // 修改状态统计（数据统计的子菜单）
      { path: '/report/modify-status', name: 'ModifyStatusReport', component: ModifyStatusReport, meta: { title: '修改状态统计', permission: 'test' } },
      
      // 系统设置（人员维护等）
      {
        path: '/settings',
        component: Settings,
        redirect: '/settings',
        children: [
          { path: '', name: 'SettingsHome', component: Settings, meta: { title: '系统管理', permission: 'settings' } },
          // { path: 'staff', name: 'StaffManage', component: StaffManage, meta: { title: '人员维护', permission: 'settings' } },  // 已停用
          { path: 'module', name: 'ModuleManage', component: ModuleManage, meta: { title: '模块维护', permission: 'settings' } },
          { path: 'form', name: 'FormManage', component: FormManage, meta: { title: '窗体维护', permission: 'settings' } },
          { path: 'template', name: 'TemplateManage', component: TemplateManage, meta: { title: '模板维护', permission: 'settings' } },
          { path: 'user', name: 'UserManage', component: UserManage, meta: { title: '用户管理', permission: 'user', requireAdmin: true } },
          { path: 'role', name: 'RoleManage', component: RoleManage, meta: { title: '角色管理', permission: 'role', requireAdmin: true } }
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
  // ===== 手机号登录 token 6小时有效期检查 =====
  // 每次页面跳转（含刷新、重新打开）都检查一次：
  // 手机号登录的 token 超过6小时 → 清除登录信息，必须重新登录
  if (isPhoneTokenExpired()) {
    clearToken()
    localStorage.removeItem('user')
    localStorage.removeItem('username')
    localStorage.removeItem('roleName')
    localStorage.removeItem('permissions')
    localStorage.removeItem('viewOthers')
    localStorage.removeItem('isSuperAdmin')
  }
  // ===== 有效期检查结束 =====

  // 读取 token（sessionStorage 优先，其次 localStorage）
  const token = getToken()
  // 判断是否是内置超级用户admin
  const isSuperAdmin = localStorage.getItem('isSuperAdmin') === '1'
  
  // 如果页面需要认证但没有 token，跳转到登录页
  if (to.meta.requiresAuth && !token) next('/login')
  // 如果已经登录了但访问登录页，跳转到首页
  else if (to.path === '/login' && token) next('/')
  // 如果是内置超级用户，只能访问系统设置相关页面，其他页面跳转到系统设置
  else if (isSuperAdmin && !to.path.startsWith('/settings')) {
    next('/settings')
  }
  // 菜单权限控制：普通用户只能访问有权限的页面
  else if (token && !isSuperAdmin && to.path !== '/' && to.path !== '/login') {
    const userStr = localStorage.getItem('user')
    let user = {}
    try {
      user = userStr ? JSON.parse(userStr) : {}
    } catch(e) {
      user = {}
    }
    
    // 管理员默认拥有所有权限
    const isAdmin = parseInt(user.isAdmin || '0') === 1
    if (!isAdmin) {
      // 解析菜单权限
      let menuPermissions = []
      try {
        menuPermissions = user.menuPermissions ? JSON.parse(user.menuPermissions) : []
      } catch(e) {
        menuPermissions = []
      }
      
      // 判断当前路径是否有权限
      const targetPath = to.path
      const hasPermission = menuPermissions.some(p => {
        // 精确匹配或前缀匹配（子页面）
        return targetPath === p || targetPath.startsWith(p + '/')
      })
      
      // 问题详情页等隐藏页面允许访问（只要有问题列表权限）
      const isHiddenPage = to.meta.hidden === true
      if (!hasPermission && !isHiddenPage) {
        // 没有权限，跳转到第一个有权限的页面
        const firstPermitted = menuPermissions[0]
        // 如果没有任何菜单权限，或者第一个有权限的页面就是当前页面（避免无限重定向）
        // 则清除登录信息并跳转到登录页
        if (!firstPermitted || firstPermitted === to.path) {
          clearToken()
          localStorage.removeItem('user')
          next('/login')
          return
        }
        next(firstPermitted)
        return
      }
    }
    next()
  }
  // 其他情况正常跳转
  else next()
})

export function setupRouter(app: App) { app.use(router) }
export default router
