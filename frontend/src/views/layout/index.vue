<template>
  <div class="scale-wrap" ref="wrapRef">
  <div class="layout-container" :style="containerScaleStyle">
    <div class="sidebar" :class="{ collapsed: isCollapse }">
      <div class="logo">
        <img :src="logoSrc" alt="logo" class="logo-img" />
      </div>
      <el-menu
        :default-active="activeMenu"
        class="el-menu-vertical"
        :collapse="isCollapse"
        :collapse-transition="false"
        @select="handleMenuSelect"
      >
        <!-- 普通用户菜单（超级管理员不可见） -->
        <template v-if="!isSuperAdmin">
          <el-menu-item index="/feedback" v-if="hasMenuPermission('/feedback')">
            <el-icon><ChatDotRound /></el-icon style="font-size:16px">
            <template #title>问题列表</template>
          </el-menu-item>
          <el-menu-item index="/test" v-if="hasMenuPermission('/test')">
            <el-icon><Tools /></el-icon style="font-size:16px">
            <template #title>问题处理</template>
          </el-menu-item>
          <el-menu-item index="/testcheck" v-if="hasMenuPermission('/testcheck')">
            <el-icon><CircleCheck /></el-icon style="font-size:16px">
            <template #title>问题测试</template>
          </el-menu-item>
          <el-sub-menu index="/report" v-if="hasMenuPermission('/report') || hasMenuPermission('/report/modify-status')">
            <template #title>
              <el-icon><DataAnalysis /></el-icon style="font-size:16px">
              <span>数据统计</span>
            </template>
            <el-menu-item index="/report" v-if="hasMenuPermission('/report')">
              <el-icon><DataAnalysis /></el-icon style="font-size:14px">
              <template #title>通用统计</template>
            </el-menu-item>
            <el-menu-item index="/report/modify-status" v-if="hasMenuPermission('/report/modify-status')">
              <el-icon><TrendCharts /></el-icon style="font-size:14px">
              <template #title>修改状态统计</template>
            </el-menu-item>
          </el-sub-menu>
        </template>
        <!-- 系统设置菜单（子菜单样式） -->
        <el-sub-menu index="/settings" v-if="hasMenuPermission('/settings') || hasMenuPermission('/settings/user') || hasMenuPermission('/settings/role') || hasMenuPermission('/settings/module') || hasMenuPermission('/settings/form') || hasMenuPermission('/settings/template')">
          <template #title>
            <el-icon><Setting /></el-icon style="font-size:16px">
            <span>系统设置</span>
          </template>
          <el-menu-item index="/settings" v-if="hasMenuPermission('/settings')">
            <el-icon><Setting /></el-icon style="font-size:14px">
            <template #title>系统管理</template>
          </el-menu-item>
          <!-- 人员维护菜单已停用 -->
          <el-menu-item index="/settings/user" v-if="hasMenuPermission('/settings/user')">
            <el-icon><UserFilled /></el-icon style="font-size:14px">
            <template #title>用户管理</template>
          </el-menu-item>
          <el-menu-item index="/settings/role" v-if="hasMenuPermission('/settings/role')">
            <el-icon><Position /></el-icon style="font-size:14px">
            <template #title>角色管理</template>
          </el-menu-item>
          <el-menu-item index="/settings/module" v-if="hasMenuPermission('/settings/module')">
            <el-icon><Grid /></el-icon style="font-size:14px">
            <template #title>模块维护</template>
          </el-menu-item>
          <el-menu-item index="/settings/form" v-if="hasMenuPermission('/settings/form')">
            <el-icon><Document /></el-icon style="font-size:14px">
            <template #title>窗体维护</template>
          </el-menu-item>
          <el-menu-item index="/settings/template" v-if="hasMenuPermission('/settings/template')">
            <el-icon><Collection /></el-icon style="font-size:14px">
            <template #title>模板维护</template>
          </el-menu-item>
          <el-menu-item index="/settings/other" v-if="hasMenuPermission('/settings/other')">
            <el-icon><Tools /></el-icon style="font-size:14px">
            <template #title>其它设置</template>
          </el-menu-item>
        </el-sub-menu>
      </el-menu>
      <!-- 系统消息提醒权限开关（浏览器最小化/切走时也能收到系统通知） -->
      <div class="sidebar-notice" :class="{ collapsed: isCollapse }">
        <template v-if="notificationPermission === 'granted'">
          <el-icon><Bell /></el-icon>
          <span>系统提醒已开启</span>
        </template>
        <template v-else>
          <el-button class="notice-btn" size="small" @click="enableSystemNotice">
            <el-icon><Bell /></el-icon>
            <span>{{ notificationPermission === 'denied' ? '通知被阻止' : '开启系统提醒' }}</span>
          </el-button>
        </template>
      </div>
    </div>
    <div class="main-content">
      <div class="header">
        <div class="header-left">
          <el-button class="collapse-btn" text size="default" @click="toggleCollapse">
            <el-icon :size="18"><component :is="isCollapse ? Expand : Fold" /></el-icon>
          </el-button>
        </div>
        <div class="header-title">
          <span class="title" :style="{ left: titleOffset }">{{ route.meta?.title || '' }}</span>
        </div>
        <div class="user-info">
          <span class="username-link" @click="openProfileDialog">
            <template v-if="isCustomerUser">{{ userHospital }}（{{ username }}）</template>
            <template v-else>{{ username }} ({{ roleName }})</template>
          </span>
          <el-button type="danger" size="small" @click="logout">退出</el-button>
        </div>
      </div>
      <div class="content">
        <router-view />
      </div>
    </div>

    <!-- 个人信息编辑弹窗 -->
    <el-dialog v-model="profileDialogVisible" title="个人信息" width="500px">
      <el-form ref="profileFormRef" :model="profileForm" :rules="profileRules" label-width="100px">
        <el-form-item label="用户名">
          <el-input v-model="profileForm.username" disabled />
        </el-form-item>
        <el-form-item label="姓名">
          <el-input v-model="profileForm.realName" disabled />
        </el-form-item>
        <el-form-item label="角色">
          <el-input v-model="profileForm.role" disabled />
        </el-form-item>
        <el-form-item label="状态">
          <el-input :value="profileForm.status === 1 ? '正常' : '禁用'" disabled />
        </el-form-item>
        <el-form-item label="性别" prop="gender">
          <el-radio-group v-model="profileForm.gender">
            <el-radio value="男">男</el-radio>
            <el-radio value="女">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="出生日期" prop="birthDate">
          <el-date-picker v-model="profileForm.birthDate" type="date" placeholder="选择出生日期" value-format="YYYY-MM-DD" style="width:100%" />
        </el-form-item>
        <el-form-item label="手机号" prop="phone">
          <el-input v-model="profileForm.phone" />
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="profileForm.email" />
        </el-form-item>
        <el-form-item label="界面风格">
          <el-radio-group v-model="profileForm.themeMode" @change="handleProfileThemeChange">
            <el-radio value="">跟随系统</el-radio>
            <el-radio value="morandi">莫兰迪系</el-radio>
            <el-radio value="light">浅色系</el-radio>
            <el-radio value="dark">深色系</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="字体大小">
          <el-radio-group v-model="profileForm.fontSize" @change="handleProfileFontChange">
            <el-radio value="">跟随系统</el-radio>
            <el-radio v-for="(label, key) in FONT_SIZE_LABELS" :key="key" :value="key">{{ label }}</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="修改密码">
          <el-checkbox v-model="profileForm.changePassword">修改密码</el-checkbox>
        </el-form-item>
        <el-form-item v-if="profileForm.changePassword" label="新密码" prop="newPassword">
          <el-input v-model="profileForm.newPassword" type="password" show-password placeholder="请输入新密码" autocomplete="new-password" />
        </el-form-item>
        <el-form-item v-if="profileForm.changePassword" label="确认密码" prop="confirmPassword">
          <el-input v-model="profileForm.confirmPassword" type="password" show-password placeholder="请再次输入新密码" autocomplete="new-password" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button class="btn-cancel" @click="profileDialogVisible = false">取消</el-button>
        <el-button class="morandi-btn morandi-blue" @click="saveProfile">保存</el-button>
      </template>
    </el-dialog>
  </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted, reactive, watch, nextTick, h } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { ElMessage, ElNotification } from 'element-plus'
import { ChatDotRound, Tools, CircleCheck, Setting, DataAnalysis, User, UserFilled, Position, Grid, Document, Key, Bell, TrendCharts, Fold, Expand } from '@element-plus/icons-vue'
import { authApi } from '@/api'
import axios from 'axios'
import { clearToken } from '@/utils/auth'
import { applySystemFontSize, applyFontSize, FONT_SIZE_LABELS } from '@/utils/theme'

const router = useRouter()
const route = useRoute()

// ========== 分辨率适配：放得下保持原始大小，放不下才等比缩小 ==========
// 规则（用户确认）：
//   1. 界面保持原始大小（字/控件不缩小、清晰）
//   2. 只有查询行在当前宽度放不下（会换行/溢出）时，才整体等比缩小到恰好放得下
//   3. 查询行由各页面 CSS 强制不换行；表格列多时表格内部自行滚动（不参与缩放）
// 实现：临时 zoom=1 测量查询行真实宽度（不换行时），scale = min(1, 视口宽/内容宽)
const scaleRatio = ref(1)
const wrapRef = ref<HTMLElement>()
const containerScaleStyle = computed(() => ({
  width: (100 / scaleRatio.value) + '%',   // 布局宽 = 视口/scale，transform 后渲染恰好 = 视口宽
  margin: '0 auto',
  // 用 transform 而非 zoom：zoom 会改变布局尺寸，导致 el-table 固定列定位错乱、
  // 且切页回来时比例突变产生“字变小、固定列消失、滚动条消失”的问题；
  // transform 只在渲染层整体缩放，布局尺寸不变，固定列按真实布局计算、不冲突
  transform: `scale(${scaleRatio.value})`,
  transformOrigin: 'top left',
  height: (100 / scaleRatio.value) + 'vh'
}))

// 全局最宽基准：以所有页面中内容宽度最大的为准（跨页面累积，切页不还原）
// globalMaxW：正常间距(--qgap 6px)下的最宽内容宽
// 间距为全局统一值(--qgap 6px)，不按页面单独压缩；放不下时整体等比缩放
let globalMaxW = 0
let scaleRetry = 0 // 子页面懒加载未完成时的重测计数

const applyPageScale = () => {
  const wrap = wrapRef.value
  if (!wrap) return
  // 测量前把缩放容器临时恢复原始大小（transform=none、width=100%），
  // 避免量到的是被缩放后的状态；transform 不影响 scrollWidth，此重置为保险起见
  const layoutEl = wrap.querySelector<HTMLElement>('.layout-container') as HTMLElement | null
  const prevTransform = layoutEl ? layoutEl.style.transform : ''
  const prevWidth = layoutEl ? layoutEl.style.width : ''
  if (layoutEl) { layoutEl.style.transform = 'none'; layoutEl.style.width = '100%' }
  // 换行型布局（inline 表单/flex wrap）宽度不足时会自动换行消化溢出，
  // 测量时临时禁止这些行换行，让真实宽度暴露出来，测完立即恢复
  const saved: Array<{ el: HTMLElement; ws: string; fw: string }> = []
  const noWrapEls = wrap.querySelectorAll<HTMLElement>('.el-form--inline, .header-filters, .card-header')
  noWrapEls.forEach(el => {
    saved.push({ el, ws: el.style.whiteSpace, fw: el.style.flexWrap })
    el.style.whiteSpace = 'nowrap'
    el.style.flexWrap = 'nowrap'
  })
  // 只允许业务主页面参与缩放基准测量：管理/统计页的查询行未做 --qgap 间距适配，
  // 若参与测量会把全局基准(globalMaxW)越拉越大，导致字体越切越小
  const MEASURE_PATHS = ['/feedback', '/test', '/testcheck', '/discuss']
  if (!MEASURE_PATHS.includes(route.path)) {
    saved.forEach(({ el, ws, fw }) => { el.style.whiteSpace = ws; el.style.flexWrap = fw })
    if (layoutEl) { layoutEl.style.transform = prevTransform; layoutEl.style.width = prevWidth }
    return
  }
  // 子页面（懒加载）尚未渲染完成：先恢复原状，稍后重测，避免 F5 首次进入时测到空内容
  // 而保持“不缩放”，切页后才算出缩放比例导致界面突变
  if (noWrapEls.length === 0) {
    if (layoutEl) { layoutEl.style.transform = prevTransform; layoutEl.style.width = prevWidth }
    if (scaleRetry < 12) { scaleRetry++; setTimeout(applyPageScale, 400) }
    return
  }
  scaleRetry = 0
  // 只量查询行/头部（表格不参与：列宽由 el-table 内部滚动处理，不拖累整页缩放）
  // 量"正常间距"(--qgap 6px)下的真实宽度
  const root = document.documentElement
  let maxW = 0
  noWrapEls.forEach(el => { maxW = Math.max(maxW, el.scrollWidth) })
  saved.forEach(({ el, ws, fw }) => { el.style.whiteSpace = ws; el.style.flexWrap = fw })
  // 全局累积：以所有页面中最宽的内容宽度为准
  globalMaxW = Math.max(globalMaxW, maxW)
  // 决定缩放：间距保持全局默认(--qgap 6px)，放不下时整体等比缩放
  const sidebarEl = wrap.querySelector<HTMLElement>('.sidebar')
  const sidebarW = sidebarEl ? sidebarEl.offsetWidth : 158 // 侧边栏宽（展开158px/收缩48px）
  const vw = document.documentElement.clientWidth
  const contentW = vw - sidebarW // 内容区可用宽
  let s = 1
  if (globalMaxW > contentW) {
    s = contentW / (globalMaxW || contentW)
  }
  root.style.removeProperty('--qgap') // 间距永远用全局默认 6px，不按页面单独压缩
  s = Math.max(0.4, Math.min(1, s)) // 只缩小不放大；下限 0.4 防极端屏
  scaleRatio.value = Math.round(s * 100) / 100
  // 测量完恢复缩放容器原状（若 scaleRatio 不变，Vue 不会重渲染，必须手动恢复）
  if (layoutEl) { layoutEl.style.transform = prevTransform; layoutEl.style.width = prevWidth }
  // 通知各页面：缩放已应用，请重新计算表格固定列（zoom 环境下挂载的表格固定列会错位，
  // 且 zoom 不触发 ResizeObserver，必须手动通知 doLayout）
  requestAnimationFrame(() => {
    window.dispatchEvent(new CustomEvent('page-scale-applied'))
  })
}
const profileFormRef = ref()
const profileDialogVisible = ref(false)

// ========== 侧边栏收缩（大图标模式）==========
const isCollapse = ref(localStorage.getItem('sidebarCollapsed') === '1')
const toggleCollapse = () => {
  isCollapse.value = !isCollapse.value
  localStorage.setItem('sidebarCollapsed', isCollapse.value ? '1' : '0')
}
// 标题居中偏移：随侧边栏宽度变化（展开158px/收缩48px）
const titleOffset = computed(() => (isCollapse.value ? '-24px' : '-79px'))
// ========== 侧边栏收缩结束 ==========

// ========== 界面风格切换（个人信息弹窗中使用）==========
const themeMode = ref(localStorage.getItem('themeMode') || 'light')
// Logo 图片：莫兰迪模式用绿色 logo，浅色/深色模式用原蓝色 logo
const logoSrc = computed(() => {
  const mode = themeMode.value || 'light'
  if (mode === 'light' || mode === 'dark') {
    return new URL('@/assets/logo.jpg', import.meta.url).href
  }
  return new URL('@/assets/logo-morandi.jpg', import.meta.url).href
})
const applyTheme = (mode: string) => {
  document.body.classList.remove('theme-light', 'theme-dark')
  if (mode === 'light') {
    document.body.classList.add('theme-light')
  } else if (mode === 'dark') {
    document.body.classList.add('theme-dark')
  }
}
const handleProfileThemeChange = async (val: string) => {
  let themeToApply = val
  let label = ''
  if (!val) {
    // 跟随系统：获取系统默认样式并预览
    label = '跟随系统'
    try {
      const res = await fetch('/api/config/system-theme')
      if (res.ok) {
        const data = await res.json()
        themeToApply = data.theme || 'light'
      }
    } catch (e) {
      console.warn('获取系统默认样式失败:', e)
      themeToApply = 'light'
    }
  } else {
    const labels: Record<string, string> = { morandi: '莫兰迪系', light: '浅色系', dark: '深色系' }
    label = labels[val] || val
  }
  // 预览：保存到 localStorage 并应用（保存时才写入用户表）
  localStorage.setItem('themeMode', themeToApply)
  applyTheme(themeToApply)
  themeMode.value = themeToApply  // 更新响应式主题，触发 logo 切换
  ElMessage.success(`已切换为${label}（保存后生效）`)
}
// ========== 界面风格切换结束 ==========

// ========== 字体大小切换（个人信息弹窗中使用，逻辑与界面风格一致）==========
const handleProfileFontChange = async (val: string) => {
  let sizeToApply = val
  let label = ''
  if (!val) {
    // 跟随系统：读取系统字号并预览
    label = '跟随系统'
    try {
      const res = await fetch('/api/config/font-size')
      if (res.ok) {
        const data = await res.json()
        sizeToApply = data.fontSize || 'standard'
      }
    } catch (e) {
      console.warn('获取系统字体字号失败:', e)
      sizeToApply = 'standard'
    }
  } else {
    label = FONT_SIZE_LABELS[val] || val
  }
  // 预览：立即应用（保存时才写入用户表）
  applyFontSize(sizeToApply)
  ElMessage.success(`已切换为${label}（保存后生效）`)
}
// ========== 字体大小切换结束 ==========

const username = computed(() => { const u = JSON.parse(localStorage.getItem('user') || '{}'); return u.realName || u.username || localStorage.getItem('username') || '' })
const roleName = computed(() => { const u = JSON.parse(localStorage.getItem('user') || '{}'); return u.roleName || u.role || localStorage.getItem('roleName') || '用户' })

// 判断当前用户是否为客户（基于userType字段）
const isCustomerUser = computed(() => {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  return u.userType === '客户'
})

// 客户绑定的医院名称
const userHospital = computed(() => {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  return u.hospital || ''
})

// ========== 消息提醒功能 ==========
const reminderTimer = ref<any>(null)
const CHECK_INTERVAL = 10 * 1000       // 每10秒检查一次新问题

// 播放提示音
const playNotificationSound = () => {
  try {
    const audioContext = new (window.AudioContext || (window as any).webkitAudioContext)()
    const oscillator = audioContext.createOscillator()
    const gainNode = audioContext.createGain()
    oscillator.connect(gainNode)
    gainNode.connect(audioContext.destination)
    oscillator.frequency.value = 800
    oscillator.type = 'sine'
    gainNode.gain.setValueAtTime(0.3, audioContext.currentTime)
    gainNode.gain.exponentialRampToValueAtTime(0.01, audioContext.currentTime + 0.5)
    oscillator.start(audioContext.currentTime)
    oscillator.stop(audioContext.currentTime + 0.5)
  } catch (e) {
    console.log('播放提示音失败:', e)
  }
}

// ========== 浏览器原生通知（操作系统级别，浏览器最小化也能看到） ==========
const notificationPermission = ref<string>('default')

// 请求浏览器通知权限（浏览器最小化时也能看到系统通知）
const requestNotificationPermission = async () => {
  if (!('Notification' in window)) {
    notificationPermission.value = 'unsupported'
    console.log('此浏览器不支持桌面通知')
    return
  }
  if (Notification.permission === 'default') {
    try {
      const permission = await Notification.requestPermission()
      notificationPermission.value = permission
      console.log('通知权限:', permission)
      if (permission === 'granted') {
        ElMessage.success('系统消息提醒已开启：浏览器最小化或切走后也能收到通知')
      }
    } catch (e) {
      console.log('请求通知权限失败:', e)
    }
  } else {
    notificationPermission.value = Notification.permission
  }
}

// 侧边栏"开启系统提醒"按钮：default 重新请求；denied 引导去浏览器设置
const enableSystemNotice = () => {
  if (!('Notification' in window)) {
    ElMessage.warning('当前浏览器不支持桌面通知')
    return
  }
  if (Notification.permission === 'denied') {
    ElMessage.warning('浏览器已阻止本站通知：请点击地址栏左侧图标 → 网站设置 → 通知 → 允许，然后回来点此按钮')
    return
  }
  requestNotificationPermission()
}

// 发送操作系统原生通知（浏览器最小化时也能在右下角看到）
const sendSystemNotification = (title: string, body: string, onClick: () => void) => {
  if (!('Notification' in window)) return
  if (Notification.permission !== 'granted') return

  try {
    const notification = new Notification(title, {
      body: body,
      icon: '/favicon.ico',
      tag: 'feedback-reminder'
      // 不设置 requireInteraction: true，否则通知不会自动关闭，且点击行为可能被拦截
    })

    // 点击通知时：激活浏览器窗口、执行回调、关闭通知
    notification.onclick = (event) => {
      event.preventDefault()  // 阻止默认行为（避免浏览器自动聚焦到通知源）
      window.focus()          // 激活浏览器窗口
      onClick()               // 执行回调（跳转页面、标记已确认等）
      notification.close()    // 立即关闭通知
    }

    // 30秒后自动关闭（兜底，防止通知一直显示）
    setTimeout(() => {
      notification.close()
    }, 30000)
  } catch (e) {
    console.log('发送系统通知失败:', e)
  }
}

// ========== 页面标题闪烁（任务栏可见） ==========
const originalTitle = ref<string>(document.title)
const titleBlinkTimer = ref<any>(null)
const isTitleBlinking = ref(false)

// 开始标题闪烁
const startTitleBlink = (message: string) => {
  if (isTitleBlinking.value) return
  isTitleBlinking.value = true
  let showMessage = true
  titleBlinkTimer.value = setInterval(() => {
    if (showMessage) {
      document.title = `【${message}】${originalTitle.value}`
    } else {
      document.title = originalTitle.value
    }
    showMessage = !showMessage
  }, 1000)
}

// 停止标题闪烁
const stopTitleBlink = () => {
  if (titleBlinkTimer.value) {
    clearInterval(titleBlinkTimer.value)
    titleBlinkTimer.value = null
  }
  isTitleBlinking.value = false
  document.title = originalTitle.value
}

// 页面获得焦点时停止标题闪烁
const handlePageFocus = () => {
  stopTitleBlink()
}
// ========== 浏览器原生通知和标题闪烁结束 ==========

// 已提醒过的通知ID（localStorage 记录，避免每10秒重复弹同一个通知）
const getRemindedTzxxIds = (): number[] => {
  try {
    return JSON.parse(localStorage.getItem('remindedTzxxIds') || '[]')
  } catch (e) {
    return []
  }
}

const saveRemindedTzxxIds = (ids: number[]) => {
  localStorage.setItem('remindedTzxxIds', JSON.stringify(ids))
}

// ===== 事件通知轮询 =====
// 后端按用户编码写入 xt_tzxx 通知表：新增→工程师+跟进人；处理→跟进人+反馈人；测试→反馈人+工程师+跟进人；返回→工程师+反馈人
// 接收人=操作人本人时不写通知；前端每10秒拉一次"我的未读通知"，点击后标记已读并跳转
const checkNewProblems = async () => {
  try {
    let currentUser = localStorage.getItem('userCode') || ''
    if (!currentUser) {
      const u = JSON.parse(localStorage.getItem('user') || '{}')
      currentUser = u.username || ''
    }
    if (!currentUser) return

    const res = await axios.get(`/api/feedback/reminder/count?currentUser=${encodeURIComponent(currentUser)}`)
    const data = res.data?.data
    if (!data || !data.list || data.list.length === 0) return

    // 只提醒还没提醒过的通知（未读通知刷新后会再次提醒，已读后不再出现）
    const remindedIds = getRemindedTzxxIds()
    const newList = data.list.filter((t: any) => !remindedIds.includes(t.id))
    if (newList.length === 0) return

    // 通知类型 → 跳转页面 + 弹窗颜色
    const tzConfig: Record<string, any> = {
      '新增': { page: '/feedback', type: 'warning' },   // 新增问题：去问题列表看新问题
      '处理': { page: '/testcheck', type: 'success' },  // 工程师处理完：去测试页
      '测试': { page: '/feedback', type: 'success' },   // 测试通过：回列表看结果
      '返回': { page: '/test', type: 'error' }          // 测试返回：去处理页重新处理
    }

    // 按类别分组：一个类别弹一个通知，内容列表限制高度滚动显示
    const groups = new Map<string, any[]>()
    newList.forEach((t: any) => {
      const key = t.lx || '消息'
      if (!groups.has(key)) groups.set(key, [])
      groups.get(key)!.push(t)
    })
    const MAX_SHOW = 6  // 弹窗内最多显示条数，超出提示"等N条"

    groups.forEach((items, lx) => {
      const cfg = tzConfig[lx] || { page: '/feedback', type: 'info' }
      const ids = items.map((t: any) => t.id)
      const onClick = () => {
        // 点击弹窗：该类别全部标记已读并跳转对应页面
        ids.forEach((id: number) => axios.post('/api/feedback/reminder/read', { id }).catch(() => {}))
        router.push(cfg.page)
        stopTitleBlink()
      }
      const showItems = items.slice(0, MAX_SHOW)
      const moreCount = items.length - showItems.length

      if (document.hidden) {
        // 浏览器最小化/切走：系统通知每类别一条，正文汇总
        const body = showItems.map((t: any) => t.nr).join('\n') + (moreCount > 0 ? `\n…等${items.length}条` : '')
        sendSystemNotification(`【${lx}提醒】(${items.length}条)`, body, onClick)
        startTitleBlink('有新消息')
      } else {
        // 页面内通知：VNode 渲染列表，容器限高滚动，避免弹窗无限高
        const lines = showItems.map((t: any) =>
          h('div', { style: 'padding: 5px 0; border-bottom: 1px dashed #ebeef5;' }, t.nr || '')
        )
        if (moreCount > 0) {
          lines.push(h('div', { style: 'color: #909399; margin-top: 4px; font-size: 12px;' }, `…等${items.length}条，点击查看全部`))
        }
        const messageVNode = h('div', { style: 'max-height: 240px; overflow-y: auto; line-height: 1.7;' }, lines)
        const notification = ElNotification({
          title: `【${lx}提醒】(${items.length}条)`,
          message: messageVNode,
          type: cfg.type,
          duration: 15000,
          position: 'bottom-right',
          icon: Bell,
          onClick: () => {
            notification.close()
            onClick()
          }
        })
      }
    })

    // 声音提醒
    playNotificationSound()

    // 记录已提醒的通知ID，防止重复弹
    const newIds = newList.map((t: any) => t.id)
    saveRemindedTzxxIds([...new Set([...remindedIds, ...newIds])])
  } catch (error) {
    console.error('检查新问题失败:', error)
  }
}

// 启动消息提醒
const startReminder = () => {
  // 立即检查一次
  checkNewProblems()
  // 每10秒检查一次新问题
  reminderTimer.value = setInterval(() => {
    checkNewProblems()
  }, CHECK_INTERVAL)
}

// 停止消息提醒
const stopReminder = () => {
  if (reminderTimer.value) {
    clearInterval(reminderTimer.value)
    reminderTimer.value = null
  }
}
// ========== 消息提醒功能结束 ==========

// 判断当前用户是否是管理员
const isAdmin = computed(() => {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  return parseInt(u.isAdmin || '0') === 1
})

// 判断当前用户是否是内置超级用户admin（系统初始化用，只能使用系统设置菜单）
const isSuperAdmin = computed(() => {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  return u.isSuperAdmin === true || localStorage.getItem('isSuperAdmin') === '1'
})

// ========== 菜单权限控制 ==========
// 解析用户的菜单权限（从角色的menuPermissions字段）
const menuPermissions = computed(() => {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  try {
    return u.menuPermissions ? JSON.parse(u.menuPermissions) : []
  } catch(e) {
    return []
  }
})

// 判断用户是否有某个菜单的权限
const hasMenuPermission = (menuPath) => {
  // 内置超级用户可以使用系统设置的全部子菜单
  if (isSuperAdmin.value) {
    return menuPath === '/settings' || menuPath.startsWith('/settings/')
  }
  // 管理员默认拥有所有权限
  if (isAdmin.value) {
    return true
  }
  // 普通用户根据menuPermissions判断
  return menuPermissions.value.includes(menuPath)
}

const activeMenu = computed(() => route.path)

const profileForm = reactive({
  id: null,
  username: '',
  realName: '',
  role: '',
  status: 1,
  gender: '',
  birthDate: '',
  phone: '',
  email: '',
  changePassword: false,
  newPassword: '',
  confirmPassword: '',
  fontSize: ''
})

const validatePassword = (rule: any, value: string, callback: any) => {
  if (!profileForm.changePassword) {
    callback()
    return
  }
  if (!value) {
    callback(new Error('请输入新密码'))
    return
  }
  if (value.length < 8) {
    callback(new Error('密码长度不能少于8位'))
    return
  }
  if (!/[a-zA-Z]/.test(value) || !/\d/.test(value)) {
    callback(new Error('密码必须包含字母和数字'))
    return
  }
  callback()
}

const validateConfirmPassword = (rule: any, value: string, callback: any) => {
  if (!profileForm.changePassword) {
    callback()
    return
  }
  if (!value) {
    callback(new Error('请再次输入新密码'))
    return
  }
  if (value !== profileForm.newPassword) {
    callback(new Error('两次输入的密码不一致'))
    return
  }
  callback()
}

const profileRules = {
  phone: [{ required: true, message: '请输入手机号', trigger: 'blur' }],
  newPassword: [{ validator: validatePassword, trigger: 'blur' }],
  confirmPassword: [{ validator: validateConfirmPassword, trigger: 'blur' }]
}

const openProfileDialog = () => {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  profileForm.id = u.id
  profileForm.username = u.username
  profileForm.realName = u.realName || u.username
  profileForm.role = u.roleName || u.role
  profileForm.status = u.status || 1
  profileForm.gender = u.gender || ''
  profileForm.birthDate = u.birthDate || ''
  profileForm.phone = u.phone || ''
  profileForm.email = u.email || ''
  profileForm.themeMode = u.themeMode || ''  // 空=跟随系统，有值=个人样式
  profileForm.fontSize = u.fontSize || ''    // 空=跟随系统，有值=个人字号
  profileForm.changePassword = false
  profileForm.newPassword = ''
  profileForm.confirmPassword = ''
  profileDialogVisible.value = true
}

// 当勾选修改密码时，清空密码字段，确保用户重新输入
watch(() => profileForm.changePassword, (newVal) => {
  if (newVal) {
    // 使用nextTick确保DOM渲染后再清空，防止浏览器自动填充
    nextTick(() => {
      profileForm.newPassword = ''
      profileForm.confirmPassword = ''
    })
  }
})

const saveProfile = async () => {
  await profileFormRef.value.validate()
  
  try {
    const data: any = {
      gender: profileForm.gender,
      birthDate: profileForm.birthDate,
      phone: profileForm.phone,
      email: profileForm.email,
      themeMode: profileForm.themeMode || '',  // 空=跟随系统，有值=个人样式
      fontSize: profileForm.fontSize || ''     // 空=跟随系统，有值=个人字号
    }
    
    // 如果勾选了修改密码，添加新密码
    if (profileForm.changePassword) {
      data.password = profileForm.newPassword
    }
    
    await axios.put('/api/user/' + profileForm.id, data)
    ElMessage.success('保存成功')
    
    // 更新 localStorage 中的用户信息
    const u = JSON.parse(localStorage.getItem('user') || '{}')
    u.gender = profileForm.gender
    u.birthDate = profileForm.birthDate
    u.phone = profileForm.phone
    u.email = profileForm.email
    u.themeMode = profileForm.themeMode || ''  // 同步个人样式偏好
    u.fontSize = profileForm.fontSize || ''    // 同步个人字号偏好
    localStorage.setItem('user', JSON.stringify(u))
    localStorage.setItem('userThemeMode', profileForm.themeMode || '')  // 更新个人样式标记：空=跟随系统，有值=个人设置
    
    profileDialogVisible.value = false
  } catch (err) {
    ElMessage.error('保存失败')
  }
}

const handleMenuSelect = (index: string) => {
  router.push(index)
}

const logout = () => {
  clearToken()  // 清除 token（sessionStorage + localStorage 两处都清）
  localStorage.removeItem('username')
  localStorage.removeItem('roleName')
  localStorage.removeItem('user')
  localStorage.removeItem('viewOthers')
  localStorage.removeItem('isSuperAdmin')  // 清除内置超级用户标记
  localStorage.removeItem('permissions')
  router.push('/login')
}

// ========== 登录互斥：30秒轮询 + 页面聚焦立即校验 ==========
// 会话被顶下线时 session-check 返回 401（code=SESSION_KICKED），由 api 拦截器统一清登录态并跳登录页
let sessionTimer: number | undefined = undefined
const checkSession = () => {
  authApi.sessionCheck().catch(() => { /* 401 由拦截器处理；网络错误忽略，不登出 */ })
}
const startSessionPolling = () => {
  checkSession()
  sessionTimer = window.setInterval(checkSession, 30 * 1000)
}

onMounted(() => {
  // 请求浏览器通知权限（用于操作系统级通知，浏览器最小化也能看到）
  requestNotificationPermission()
  // 页面获得焦点时停止标题闪烁
  window.addEventListener('focus', handlePageFocus)
  // 页面切回前台时立即校验会话（被顶下线马上登出）
  window.addEventListener('focus', checkSession)
  // 启动会话轮询（登录互斥，30秒一次）
  startSessionPolling()
  // 启动消息提醒
  startReminder()
  // 应用系统全局字体字号（其它设置里配置）
  applySystemFontSize()
  // 分辨率适配：子页面懒加载完成后才能测到查询行，延迟重测确保准确
  applyPageScale()
  setTimeout(() => applyPageScale(), 300)
  window.addEventListener('resize', applyPageScale)
})

// 路由切换后子页面懒加载渲染完成，重新计算缩放
watch(() => route.path, () => {
  nextTick(() => setTimeout(() => applyPageScale(), 300))
})

onUnmounted(() => {
  // 移除页面焦点事件监听
  window.removeEventListener('focus', handlePageFocus)
  window.removeEventListener('focus', checkSession)
  // 停止会话轮询
  if (sessionTimer) { clearInterval(sessionTimer); sessionTimer = undefined }
  // 停止标题闪烁
  stopTitleBlink()
  // 停止消息提醒
  stopReminder()
  // 移除分辨率监听
  window.removeEventListener('resize', applyPageScale)
})
</script>

<style scoped>
/* 清新简约风格配色 - 青绿色/薄荷绿主色调 */
.scale-wrap { width: 100%; height: 100vh; overflow: hidden; }
.layout-container { display: flex; background: #f5f7fa; }
.sidebar { width: 158px; --el-menu-collapse-width: 48px; background: #ffffff; color: #303133; border-right: 1px solid #e4e7ed; box-shadow: 2px 0 8px rgba(0,0,0,0.04); transition: width 0.3s ease; flex-shrink: 0; display: flex; flex-direction: column; }
.sidebar .el-menu { flex: 1; }
.sidebar.collapsed { width: 48px; }
.sidebar.collapsed .logo { padding: 10px 8px; gap: 0; }
.sidebar.collapsed .logo span { display: none; }
.logo { 
  padding: 10px 12px; 
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  font-size: 15px; 
  font-weight: 600; 
  text-align: center; 
  border-bottom: 1px solid #f0f2f5; 
  color: var(--el-color-primary); 
  letter-spacing: 1px;
  background: linear-gradient(135deg, #f0fffb 0%, #ffffff 100%);
  white-space: nowrap;
  overflow: hidden;
  transition: padding 0.3s ease;
}
.logo-img {
  width: 40px;
  height: 40px;
  object-fit: contain;
  border-radius: 6px;
  flex-shrink: 0;
}
/* 侧边栏底部：系统消息提醒权限开关 */
.sidebar-notice {
  margin-top: auto;
  padding: 12px;
  border-top: 1px solid #f0f2f5;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 6px;
  font-size: 12px;
  color: #67C23A;
  white-space: nowrap;
  overflow: hidden;
}
.sidebar-notice.collapsed { padding: 12px 4px; }
.sidebar-notice.collapsed span { display: none; }
.notice-btn {
  border: 1px dashed #c0c4cc !important;
  color: #606266 !important;
  background: #ffffff !important;
  border-radius: 6px;
}
.notice-btn:hover {
  color: var(--el-color-primary) !important;
  border-color: var(--el-color-primary) !important;
  background: var(--el-color-primary-light-9) !important;
}
.main-content { flex: 1; display: flex; flex-direction: column; min-width: 0; }
.header { 
  height: 60px; 
  background: linear-gradient(135deg, #ffffff 0%, var(--el-color-primary-light-9) 100%);
  display: flex; 
  justify-content: space-between; 
  align-items: center; 
  padding: 0 24px; 
  border-bottom: 1px solid #e4e7ed; 
  box-shadow: 0 2px 8px rgba(var(--el-color-primary-rgb), 0.08);
  position: relative;
}
.header-left { flex: 1; display: flex; align-items: center; }
.collapse-btn { color: #909399; padding: 6px; border-radius: 6px; }
.collapse-btn:hover { color: var(--el-color-primary); background: var(--el-color-primary-light-9) !important; }
.header-title { 
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: center;
}
.title { 
  flex: 1;
  font-size: 22px; 
  font-weight: 600; 
  text-align: center;
  background: linear-gradient(135deg, var(--el-color-primary) 0%, var(--el-color-primary-dark-2) 50%, var(--el-color-primary-dark-2) 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  font-family: "Microsoft YaHei", "PingFang SC", "Helvetica Neue", Arial, sans-serif;
  letter-spacing: 3px;
  text-shadow: 0 2px 4px rgba(var(--el-color-primary-rgb), 0.1);
  /* 考虑左侧导航栏宽度(158px)，让标题在整个页面居中 */
  /* 左侧导航栏占用158px，所以标题需要向左偏移79px（导航栏宽度的一半） */
  position: relative;
  left: -105px;
}
.user-info { 
  flex: 1;
  display: flex; 
  align-items: center; 
  gap: 12px; 
  justify-content: flex-end;
}
.username-link { cursor: pointer; color: var(--el-color-primary); font-weight: 500; }
.username-link:hover { text-decoration: underline; color: var(--el-color-primary-dark-2); }
.content { flex: 1; padding: 0; overflow-y: auto; background: #f5f7fa; }

/* 浅色侧边栏菜单样式 - 清新简约 */
:deep(.el-menu) { border-right: 1px solid var(--el-color-primary-light-9); background: linear-gradient(180deg, var(--el-color-primary-light-9) 0%, var(--el-color-primary-light-9) 100%); }
/* 收缩（大图标）模式菜单 */
:deep(.el-menu--collapse) { width: 64px !important; }
:deep(.el-menu--collapse .el-menu-item),
:deep(.el-menu--collapse .el-sub-menu__title) {
  width: 64px !important;
  padding: 0 !important;
  justify-content: center;
}
:deep(.el-menu--collapse .el-menu-item .el-icon),
:deep(.el-menu--collapse .el-sub-menu__title .el-icon) {
  margin: 0 !important;
  font-size: 20px !important;
  width: 22px !important;
}
:deep(.el-menu--collapse .el-sub-menu .el-menu) {
  width: 170px;
}
:deep(.el-menu-item),
:deep(.el-sub-menu__title) {
  color: #606266 !important;
  font-size: 16px;
  font-family: "Microsoft YaHei", "微软雅黑", sans-serif !important;
  height: 50px;
  line-height: 50px;
}
:deep(.el-menu-item:hover),
:deep(.el-sub-menu__title:hover) {
  background: var(--el-color-primary-light-9) !important;
  color: var(--el-color-primary) !important;
}
:deep(.el-menu-item.is-active) {
  background: linear-gradient(90deg, var(--el-color-primary-light-9) 0%, var(--el-color-primary-light-9) 100%) !important;
  color: var(--el-color-primary) !important;
  font-weight: 600;
  border-right: 3px solid var(--el-color-primary);
}
/* 子菜单样式 */
:deep(.el-sub-menu .el-menu-item) {
  background: var(--el-color-primary-light-9) !important;
  color: #606266 !important;
  font-family: "Microsoft YaHei", "微软雅黑", sans-serif !important;
  height: 46px;
  line-height: 46px;
  font-size: 15px;
}
:deep(.el-sub-menu .el-menu-item:hover) {
  background: var(--el-color-primary-light-9) !important;
  color: var(--el-color-primary) !important;
}
:deep(.el-sub-menu .el-menu-item.is-active) {
  background: var(--el-color-primary-light-9) !important;
  color: var(--el-color-primary) !important;
  font-weight: 600;
}
/* 菜单图标颜色 */
:deep(.el-menu-item .el-icon),
:deep(.el-sub-menu__title .el-icon) {
  color: #909399 !important;
  font-size: 16px;
}
:deep(.el-menu-item:hover .el-icon),
:deep(.el-sub-menu__title:hover .el-icon),
:deep(.el-menu-item.is-active .el-icon) {
  color: var(--el-color-primary) !important;
}
/* 退出按钮样式 */
:deep(.el-button--danger) {
  background: #ffffff;
  border-color: #f56c6c;
  color: #f56c6c;
}
:deep(.el-button--danger:hover) {
  background: #fef0f0;
  border-color: #f56c6c;
  color: #f56c6c;
}
</style>
