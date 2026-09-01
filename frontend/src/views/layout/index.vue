<template>
  <div class="layout-container">
    <div class="sidebar">
      <div class="logo">问题反馈系统</div>
      <el-menu
        :default-active="activeMenu"
        class="el-menu-vertical"
        @select="handleMenuSelect"
      >
        <el-menu-item index="/feedback">
          <el-icon><ChatDotRound /></el-icon style="font-size:16px">
          <template #title>问题列表</template>
        </el-menu-item>
        <el-menu-item index="/test">
          <el-icon><Tools /></el-icon style="font-size:16px">
          <template #title>问题处理</template>
        </el-menu-item>
        <el-menu-item index="/testcheck">
          <el-icon><CircleCheck /></el-icon style="font-size:16px">
          <template #title>问题测试</template>
        </el-menu-item>
        <el-menu-item index="/report">
          <el-icon><DataAnalysis /></el-icon style="font-size:16px">
          <template #title>数据统计</template>
        </el-menu-item>
        <el-menu-item index="/settings">
          <el-icon><Setting /></el-icon style="font-size:16px">
          <template #title>系统设置</template>
        </el-menu-item>
      </el-menu>
    </div>
    <div class="main-content">
      <div class="header">
        <div class="title">{{ route.meta?.title || '' }}</div>
        <div class="user-info">
          <span class="username-link" @click="openProfileDialog">{{ username }} ({{ roleName }})</span>
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
        <el-form-item label="修改密码">
          <el-checkbox v-model="profileForm.changePassword">修改密码</el-checkbox>
        </el-form-item>
        <el-form-item v-if="profileForm.changePassword" label="新密码" prop="newPassword">
          <el-input v-model="profileForm.newPassword" type="password" show-password placeholder="请输入新密码" />
        </el-form-item>
        <el-form-item v-if="profileForm.changePassword" label="确认密码" prop="confirmPassword">
          <el-input v-model="profileForm.confirmPassword" type="password" show-password placeholder="请再次输入新密码" />
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="profileDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="saveProfile">保存</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted, onUnmounted, reactive } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { ElMessage, ElNotification } from 'element-plus'
import { ChatDotRound, Tools, CircleCheck, Setting, DataAnalysis, User, Key, Bell } from '@element-plus/icons-vue'
import { authApi } from '@/api'
import axios from 'axios'

const router = useRouter()
const route = useRoute()
const profileFormRef = ref()
const profileDialogVisible = ref(false)

const username = computed(() => { const u = JSON.parse(localStorage.getItem('user') || '{}'); return u.realName || u.username || localStorage.getItem('username') || '' })
const roleName = computed(() => { const u = JSON.parse(localStorage.getItem('user') || '{}'); return u.roleName || u.role || localStorage.getItem('roleName') || '用户' })

// ========== 消息提醒功能 ==========
const reminderTimer = ref<any>(null)
const CHECK_INTERVAL = 30 * 1000       // 每30秒检查一次新问题
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
  // 每30秒检查一次新问题
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

const profileRules = {
  email: [{ required: true, message: '请输入邮箱', trigger: 'blur' }],
  newPassword: [{ required: true, message: '请输入新密码', trigger: 'blur' }, { min: 6, message: '密码长度不能少于6位', trigger: 'blur' }],
  confirmPassword: [{ required: true, message: '请再次输入新密码', trigger: 'blur' }]
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
  profileForm.changePassword = false
  profileForm.newPassword = ''
  profileForm.confirmPassword = ''
  profileDialogVisible.value = true
}

const saveProfile = async () => {
  await profileFormRef.value.validate()
  
  // 如果勾选了修改密码，验证两次密码是否一致
  if (profileForm.changePassword) {
    if (!profileForm.newPassword) {
      ElMessage.warning('请输入新密码')
      return
    }
    if (profileForm.newPassword !== profileForm.confirmPassword) {
      ElMessage.warning('两次输入的密码不一致')
      return
    }
  }
  
  try {
    const data: any = {
      gender: profileForm.gender,
      birthDate: profileForm.birthDate,
      phone: profileForm.phone,
      email: profileForm.email
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
    localStorage.setItem('user', JSON.stringify(u))
    
    profileDialogVisible.value = false
  } catch (err) {
    ElMessage.error('保存失败')
  }
}

const handleMenuSelect = (index: string) => {
  router.push(index)
}

const logout = () => {
  localStorage.removeItem('token')
  localStorage.removeItem('username')
  localStorage.removeItem('roleName')
  localStorage.removeItem('user')
  localStorage.removeItem('viewOthers')
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
.layout-container { display: flex; height: 100vh; }
.sidebar { width: 200px; background: #304156; color: #fff; }
.logo { padding: 20px; font-size: 18px; font-weight: bold; text-align: center; border-bottom: 1px solid #3a3a3a; }
.main-content { flex: 1; display: flex; flex-direction: column; }
.header { height: 60px; background: #fff; display: flex; justify-content: space-between; align-items: center; padding: 0 20px; border-bottom: 1px solid #e4e7ed; }
.title { font-size: 18px; font-weight: bold; }
.user-info { display: flex; align-items: center; gap: 10px; }
.username-link { cursor: pointer; color: #409eff; }
.username-link:hover { text-decoration: underline; }
.content { flex: 1; padding: 20px; overflow-y: auto; background: #f0f2f5; }
.el-menu { border-right: none; background: #304156; }
.el-menu-item, .el-sub-menu__title { color: #bfcbd9; }
.el-menu-item:hover, .el-menu-item.is-active, .el-sub-menu__title:hover { background: #263445; color: #409eff; }
.el-sub-menu .el-menu-item { background: #1f2d3d; }
</style>
