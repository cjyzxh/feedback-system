<template>
  <div class="layout-container">
    <div class="sidebar" :class="{ collapsed: isCollapse }">
      <div class="logo">
        <img :src="logoSrc" alt="logo" class="logo-img" />
        <span v-if="!isCollapse">问题反馈系统</span>
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
        <el-sub-menu index="/settings" v-if="hasMenuPermission('/settings') || hasMenuPermission('/settings/staff') || hasMenuPermission('/settings/user') || hasMenuPermission('/settings/role') || hasMenuPermission('/settings/module') || hasMenuPermission('/settings/form')">
          <template #title>
            <el-icon><Setting /></el-icon style="font-size:16px">
            <span>系统设置</span>
          </template>
          <el-menu-item index="/settings" v-if="hasMenuPermission('/settings')">
            <el-icon><Setting /></el-icon style="font-size:14px">
            <template #title>系统管理</template>
          </el-menu-item>
          <el-menu-item index="/settings/staff" v-if="hasMenuPermission('/settings/staff')">
            <el-icon><User /></el-icon style="font-size:14px">
            <template #title>人员维护</template>
          </el-menu-item>
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
        </el-sub-menu>
      </el-menu>
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
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted, reactive, watch, nextTick } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { ElMessage, ElNotification } from 'element-plus'
import { ChatDotRound, Tools, CircleCheck, Setting, DataAnalysis, User, UserFilled, Position, Grid, Document, Key, Bell, TrendCharts, Fold, Expand } from '@element-plus/icons-vue'
import { authApi } from '@/api'
import axios from 'axios'
import { clearToken } from '@/utils/auth'

const router = useRouter()
const route = useRoute()
const profileFormRef = ref()
const profileDialogVisible = ref(false)

// ========== 侧边栏收缩（大图标模式）==========
const isCollapse = ref(localStorage.getItem('sidebarCollapsed') === '1')
const toggleCollapse = () => {
  isCollapse.value = !isCollapse.value
  localStorage.setItem('sidebarCollapsed', isCollapse.value ? '1' : '0')
}
// 标题居中偏移：随侧边栏宽度变化（展开210px/收缩64px）
const titleOffset = computed(() => (isCollapse.value ? '-32px' : '-105px'))
// ========== 侧边栏收缩结束 ==========

// ========== 界面风格切换（个人信息弹窗中使用）==========
const themeMode = ref(localStorage.getItem('themeMode') || 'morandi')
// Logo 图片：莫兰迪模式用绿色 logo，浅色/深色模式用原蓝色 logo
const logoSrc = computed(() => {
  const mode = themeMode.value || 'morandi'
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
        themeToApply = data.theme || 'morandi'
      }
    } catch (e) {
      console.warn('获取系统默认样式失败:', e)
      themeToApply = 'morandi'
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
const REMIND_INTERVAL = 5 * 60 * 1000  // 同一个问题每5分钟重复提醒一次（未点击时）

// 从 localStorage 获取已确认（点击过）的问题ID - 这些不再提醒
const getConfirmedPendingIds = (): number[] => {
  try {
    return JSON.parse(localStorage.getItem('confirmedPendingIds') || '[]')
  } catch (e) {
    return []
  }
}

const getConfirmedTestIds = (): number[] => {
  try {
    return JSON.parse(localStorage.getItem('confirmedTestIds') || '[]')
  } catch (e) {
    return []
  }
}

// 测试后返回的问题（红色提醒，需要重新处理）
const getConfirmedReturnedIds = (): number[] => {
  try {
    return JSON.parse(localStorage.getItem('confirmedReturnedIds') || '[]')
  } catch (e) {
    return []
  }
}

// 保存已确认的问题ID到 localStorage
const saveConfirmedPendingIds = (ids: number[]) => {
  localStorage.setItem('confirmedPendingIds', JSON.stringify(ids))
}

const saveConfirmedTestIds = (ids: number[]) => {
  localStorage.setItem('confirmedTestIds', JSON.stringify(ids))
}

const saveConfirmedReturnedIds = (ids: number[]) => {
  localStorage.setItem('confirmedReturnedIds', JSON.stringify(ids))
}

// 获取最后提醒时间记录 {pending: {id: timestamp}, test: {id: timestamp}, returned: {id: timestamp}}
const getLastRemindTimes = (): { pending: Record<number, number>; test: Record<number, number>; returned: Record<number, number> } => {
  try {
    const data = JSON.parse(localStorage.getItem('lastRemindTimes') || '{}')
    return {
      pending: data.pending || {},
      test: data.test || {},
      returned: data.returned || {}
    }
  } catch (e) {
    return { pending: {}, test: {}, returned: {} }
  }
}

// 保存最后提醒时间
const saveLastRemindTimes = (times: { pending: Record<number, number>; test: Record<number, number>; returned: Record<number, number> }) => {
  localStorage.setItem('lastRemindTimes', JSON.stringify(times))
}

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

// 请求浏览器通知权限
const requestNotificationPermission = async () => {
  if (!('Notification' in window)) {
    console.log('此浏览器不支持桌面通知')
    return
  }
  if (Notification.permission === 'default') {
    try {
      const permission = await Notification.requestPermission()
      notificationPermission.value = permission
      console.log('通知权限:', permission)
    } catch (e) {
      console.log('请求通知权限失败:', e)
    }
  } else {
    notificationPermission.value = Notification.permission
  }
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

// 检查新问题并提醒
const checkNewProblems = async () => {
  try {
    const currentUser = username.value
    if (!currentUser) return

    const res = await axios.get(`/api/feedback/reminder/count?currentUser=${encodeURIComponent(currentUser)}`)
    const data = res.data?.data
    if (!data) return

    const { pendingList, testList, returnedList } = data
    const confirmedPendingIds = getConfirmedPendingIds()
    const confirmedTestIds = getConfirmedTestIds()
    const confirmedReturnedIds = getConfirmedReturnedIds()
    const lastRemindTimes = getLastRemindTimes()
    const now = Date.now()

    // 测试返回问题的ID列表（这些问题只提醒红色，不重复提醒黄色）
    const returnedIds = returnedList.map((item: any) => item.id)

    // 检查待处理问题：过滤掉已确认的、过滤掉测试返回问题（测试返回问题单独用红色提醒），然后检查是否需要提醒
    const pendingToRemind = pendingList.filter((item: any) => {
      if (confirmedPendingIds.includes(item.id)) return false  // 已点击确认，不再提醒
      if (returnedIds.includes(item.id)) return false  // 测试返回问题，用红色单独提醒，不重复提醒黄色
      const lastTime = lastRemindTimes.pending[item.id] || 0
      return now - lastTime >= REMIND_INTERVAL  // 从未提醒或超过5分钟，需要提醒
    })

    if (pendingToRemind.length > 0) {
      const titles = pendingToRemind.map((item: any) => `【${item.id}】${item.yiyuanmc || ''} - ${item.wentism?.substring(0, 20) || ''}`).join('\n')
      const notifyTitle = `您有 ${pendingToRemind.length} 个待处理问题`
      const notifyMessage = titles + '\n\n（点击查看并确认，否则每5分钟提醒一次）'
      const isPageHidden = document.hidden  // 浏览器是否最小化或在后台

      const confirmPending = () => {
        router.push('/test')
        const newIds = pendingToRemind.map((item: any) => item.id)
        const updatedIds = [...new Set([...confirmedPendingIds, ...newIds])]
        saveConfirmedPendingIds(updatedIds)
        stopTitleBlink()
      }

      if (isPageHidden) {
        // 浏览器最小化或在后台：使用系统通知 + 标题闪烁 + 声音
        sendSystemNotification(notifyTitle, notifyMessage, confirmPending)
        startTitleBlink(`${pendingToRemind.length}个待处理问题`)
      } else {
        // 浏览器可见：只使用页面内通知 + 声音
        const notification = ElNotification({
          title: notifyTitle,
          message: notifyMessage,
          type: 'warning',
          duration: 15000,
          position: 'bottom-right',
          icon: Bell,
          onClick: () => {
            notification.close()  // 点击后立即关闭通知
            confirmPending()      // 执行回调
          }
        })
      }

      // 声音提醒（无论浏览器是否可见都播放）
      playNotificationSound()

      // 记录这些问题的最后提醒时间
      pendingToRemind.forEach((item: any) => {
        lastRemindTimes.pending[item.id] = now
      })
      saveLastRemindTimes(lastRemindTimes)
    }

    // 检查待测试问题：过滤掉已确认的，然后检查是否需要提醒
    const testToRemind = testList.filter((item: any) => {
      if (confirmedTestIds.includes(item.id)) return false  // 已点击确认，不再提醒
      const lastTime = lastRemindTimes.test[item.id] || 0
      return now - lastTime >= REMIND_INTERVAL  // 从未提醒或超过5分钟，需要提醒
    })

    if (testToRemind.length > 0) {
      const titles = testToRemind.map((item: any) => `【${item.id}】${item.yiyuanmc || ''} - ${item.wentism?.substring(0, 20) || ''}`).join('\n')
      const notifyTitle = `您有 ${testToRemind.length} 个待测试问题`
      const notifyMessage = titles + '\n\n（点击查看并确认，否则每5分钟提醒一次）'
      const isPageHidden = document.hidden  // 浏览器是否最小化或在后台

      const confirmTest = () => {
        router.push('/testcheck')
        const newIds = testToRemind.map((item: any) => item.id)
        const updatedIds = [...new Set([...confirmedTestIds, ...newIds])]
        saveConfirmedTestIds(updatedIds)
        stopTitleBlink()
      }

      if (isPageHidden) {
        // 浏览器最小化或在后台：使用系统通知 + 标题闪烁 + 声音
        sendSystemNotification(notifyTitle, notifyMessage, confirmTest)
        startTitleBlink(`${testToRemind.length}个待测试问题`)
      } else {
        // 浏览器可见：只使用页面内通知 + 声音
        const notification = ElNotification({
          title: notifyTitle,
          message: notifyMessage,
          type: 'success',
          duration: 15000,
          position: 'bottom-right',
          icon: Bell,
          onClick: () => {
            notification.close()  // 点击后立即关闭通知
            confirmTest()         // 执行回调
          }
        })
      }

      // 声音提醒（无论浏览器是否可见都播放）
      playNotificationSound()

      // 记录这些问题的最后提醒时间
      testToRemind.forEach((item: any) => {
        lastRemindTimes.test[item.id] = now
      })
      saveLastRemindTimes(lastRemindTimes)
    }

    // 检查测试后返回的问题：过滤掉已确认的，然后检查是否需要提醒（红色，需要重新处理）
    const returnedToRemind = returnedList.filter((item: any) => {
      if (confirmedReturnedIds.includes(item.id)) return false  // 已点击确认，不再提醒
      const lastTime = lastRemindTimes.returned[item.id] || 0
      return now - lastTime >= REMIND_INTERVAL  // 从未提醒或超过5分钟，需要提醒
    })

    if (returnedToRemind.length > 0) {
      const titles = returnedToRemind.map((item: any) => `【${item.id}】${item.yiyuanmc || ''} - ${item.wentism?.substring(0, 20) || ''}\n  测试意见: ${(item.shouhoucs || '').substring(0, 30)}`).join('\n')
      const notifyTitle = `⚠ 您有 ${returnedToRemind.length} 个测试返回的问题需要重新处理`
      const notifyMessage = titles + '\n\n（点击查看并确认，否则每5分钟提醒一次）'
      const isPageHidden = document.hidden  // 浏览器是否最小化或在后台

      const confirmReturned = () => {
        router.push('/test')
        const newIds = returnedToRemind.map((item: any) => item.id)
        const updatedIds = [...new Set([...confirmedReturnedIds, ...newIds])]
        saveConfirmedReturnedIds(updatedIds)
        stopTitleBlink()
      }

      if (isPageHidden) {
        // 浏览器最小化或在后台：使用系统通知 + 标题闪烁 + 声音
        sendSystemNotification(notifyTitle, notifyMessage, confirmReturned)
        startTitleBlink(`${returnedToRemind.length}个测试返回问题`)
      } else {
        // 浏览器可见：只使用页面内通知 + 声音（红色 error 类型）
        const notification = ElNotification({
          title: notifyTitle,
          message: notifyMessage,
          type: 'error',  // 红色，区别于黄色待处理和绿色待测试
          duration: 20000,  // 红色提醒显示时间更长
          position: 'bottom-right',
          icon: Bell,
          onClick: () => {
            notification.close()  // 点击后立即关闭通知
            confirmReturned()     // 执行回调
          }
        })
      }

      // 声音提醒（无论浏览器是否可见都播放）
      playNotificationSound()

      // 记录这些问题的最后提醒时间
      returnedToRemind.forEach((item: any) => {
        lastRemindTimes.returned[item.id] = now
      })
      saveLastRemindTimes(lastRemindTimes)
    }

    // 清理1：问题被处理后（不在列表中），清除已确认记录，避免 localStorage 膨胀
    const pendingIds = pendingList.map((item: any) => item.id)
    const testIds = testList.map((item: any) => item.id)
    // returnedIds 已经在前面定义过了

    let cleanedConfirmedPending = confirmedPendingIds.filter(id => pendingIds.includes(id))
    let cleanedConfirmedTest = confirmedTestIds.filter(id => testIds.includes(id))
    let cleanedConfirmedReturned = confirmedReturnedIds.filter(id => returnedIds.includes(id))

    // 清理2：状态流转时清除对应已确认记录，让问题在状态变化后能重新提醒
    // 问题进入待测试状态（已被工程师处理）→ 从待处理和测试返回的已确认列表中删除
    // （下次测试不通过返回待处理时，应该重新提醒）
    testIds.forEach(id => {
      if (cleanedConfirmedPending.includes(id)) {
        cleanedConfirmedPending = cleanedConfirmedPending.filter(i => i !== id)
      }
      if (cleanedConfirmedReturned.includes(id)) {
        cleanedConfirmedReturned = cleanedConfirmedReturned.filter(i => i !== id)
      }
    })

    // 问题进入待处理状态（还未被工程师处理）→ 从待测试的已确认列表中删除
    // （下次工程师处理完进入待测试时，应该重新提醒）
    pendingIds.forEach(id => {
      if (cleanedConfirmedTest.includes(id)) {
        cleanedConfirmedTest = cleanedConfirmedTest.filter(i => i !== id)
      }
    })

    // 保存清理后的已确认记录
    if (cleanedConfirmedPending.length !== confirmedPendingIds.length) {
      saveConfirmedPendingIds(cleanedConfirmedPending)
    }
    if (cleanedConfirmedTest.length !== confirmedTestIds.length) {
      saveConfirmedTestIds(cleanedConfirmedTest)
    }
    if (cleanedConfirmedReturned.length !== confirmedReturnedIds.length) {
      saveConfirmedReturnedIds(cleanedConfirmedReturned)
    }

    // 清理提醒时间记录
    let timesChanged = false

    // 清理1：不在对应列表中的问题，清除提醒时间
    Object.keys(lastRemindTimes.pending).forEach(idStr => {
      if (!pendingIds.includes(parseInt(idStr))) {
        delete lastRemindTimes.pending[parseInt(idStr)]
        timesChanged = true
      }
    })
    Object.keys(lastRemindTimes.test).forEach(idStr => {
      if (!testIds.includes(parseInt(idStr))) {
        delete lastRemindTimes.test[parseInt(idStr)]
        timesChanged = true
      }
    })
    Object.keys(lastRemindTimes.returned).forEach(idStr => {
      if (!returnedIds.includes(parseInt(idStr))) {
        delete lastRemindTimes.returned[parseInt(idStr)]
        timesChanged = true
      }
    })

    // 清理2：状态流转时清除对应提醒时间，让问题在状态变化后能立即重新提醒
    // 问题进入待测试状态 → 清除待处理和测试返回的提醒时间
    testIds.forEach(id => {
      if (lastRemindTimes.pending[id] !== undefined) {
        delete lastRemindTimes.pending[id]
        timesChanged = true
      }
      if (lastRemindTimes.returned[id] !== undefined) {
        delete lastRemindTimes.returned[id]
        timesChanged = true
      }
    })

    // 问题进入待处理状态 → 清除待测试的提醒时间
    pendingIds.forEach(id => {
      if (lastRemindTimes.test[id] !== undefined) {
        delete lastRemindTimes.test[id]
        timesChanged = true
      }
    })

    if (timesChanged) {
      saveLastRemindTimes(lastRemindTimes)
    }
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
  confirmPassword: ''
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
      themeMode: profileForm.themeMode || ''  // 空=跟随系统，有值=个人样式
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

onMounted(() => {
  // 请求浏览器通知权限（用于操作系统级通知，浏览器最小化也能看到）
  requestNotificationPermission()
  // 页面获得焦点时停止标题闪烁
  window.addEventListener('focus', handlePageFocus)
  // 启动消息提醒
  startReminder()
})

onUnmounted(() => {
  // 移除页面焦点事件监听
  window.removeEventListener('focus', handlePageFocus)
  // 停止标题闪烁
  stopTitleBlink()
  // 停止消息提醒
  stopReminder()
})
</script>

<style scoped>
/* 清新简约风格配色 - 青绿色/薄荷绿主色调 */
.layout-container { display: flex; height: 100vh; background: #f5f7fa; }
.sidebar { width: 210px; background: #ffffff; color: #303133; border-right: 1px solid #e4e7ed; box-shadow: 2px 0 8px rgba(0,0,0,0.04); transition: width 0.3s ease; flex-shrink: 0; }
.sidebar.collapsed { width: 64px; }
.sidebar.collapsed .logo { padding: 16px 8px; gap: 0; }
.sidebar.collapsed .logo span { display: none; }
.logo { 
  padding: 20px 15px; 
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  font-size: 17px; 
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
  width: 36px;
  height: 36px;
  object-fit: contain;
  border-radius: 6px;
  flex-shrink: 0;
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
  /* 考虑左侧导航栏宽度(210px)，让标题在整个页面居中 */
  /* 左侧导航栏占用210px，所以标题需要向左偏移105px（导航栏宽度的一半） */
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
