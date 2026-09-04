<template>
  <div class="login-container">
    <!-- 背景装饰 -->
    <div class="bg-decoration">
      <div class="circle circle-1"></div>
      <div class="circle circle-2"></div>
      <div class="circle circle-3"></div>
      <div class="grid-bg"></div>
    </div>
    
    <div class="login-box">
      <div class="login-header">
        <div class="logo-icon">
          <img :src="logoSrc" alt="logo" class="logo-img" />
        </div>
        <h1 class="title">创佳益问题反馈系统</h1>
        <p class="subtitle">HIS 问题跟踪与管理平台</p>
      </div>
      
      <div class="login-tabs">
        <div 
          class="tab-item" 
          :class="{ active: loginType === 'account' }"
          @click="switchLoginType('account')"
        >
          账号登录
        </div>
        <div 
          class="tab-item" 
          :class="{ active: loginType === 'sms' }"
          @click="switchLoginType('sms')"
        >
          验证码登录
        </div>
      </div>
      
      <el-form ref="formRef" :model="loginForm" class="login-form">
        <el-form-item v-if="loginType === 'account'">
          <el-input 
            v-model="loginForm.username" 
            placeholder="请输入用户名或ID号" 
            size="large" 
            :prefix-icon="User"
            clearable
          />
        </el-form-item>
        
        <el-form-item v-if="loginType === 'account'">
          <el-input 
            v-model="loginForm.password" 
            type="password" 
            placeholder="请输入密码" 
            size="large" 
            show-password 
            :prefix-icon="Lock"
            @keyup.enter="handleLogin"
          />
        </el-form-item>
        
        <el-form-item v-if="loginType === 'sms'">
          <el-input 
            v-model="loginForm.phone" 
            placeholder="请输入手机号" 
            size="large" 
            :prefix-icon="Iphone"
            maxlength="11"
            clearable
          />
        </el-form-item>
        
        <el-form-item v-if="loginType === 'sms'">
          <div class="code-input-wrapper">
            <el-input 
              v-model="loginForm.code" 
              placeholder="请输入验证码" 
              size="large" 
              :prefix-icon="Message"
              maxlength="6"
              @keyup.enter="handleLogin"
            />
            <el-button 
              class="morandi-btn morandi-blue code-button" 
              size="large" 
              :disabled="countdown > 0"
              @click="sendCode"
            >
              {{ countdown > 0 ? `${countdown}秒后重试` : '获取验证码' }}
            </el-button>
          </div>
        </el-form-item>
        
        <el-form-item>
          <div class="button-group">
            <button type="button" class="btn-gradient btn-login" @click="handleLogin">
              <span v-if="loading" class="loading-text">登录中...</span>
              <span v-else>登 录</span>
            </button>
            <button type="button" class="btn-gradient btn-clear" @click="handleClear">
              <el-icon class="btn-icon"><Delete /></el-icon>清 空
            </button>
          </div>
        </el-form-item>
      </el-form>
    </div>
    
    <div class="footer">
      <p>北京创佳益软件有限公司 版权所有(2004-2026)</p>
      <p class="version-text">版本 v{{ appVersion }}</p>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, computed } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { User, Lock, Iphone, Message, Monitor, Delete } from '@element-plus/icons-vue'
import axios from 'axios'
import { APP_VERSION } from '../../version'

const router = useRouter()
const appVersion = APP_VERSION
const loading = ref(false)
const loginType = ref('account')
const countdown = ref(0)
const timer = ref(null)
const hasSentCode = ref(false)
const loginForm = reactive({
  username: '',
  password: '',
  phone: '',
  code: ''
})

// Logo 图片：莫兰迪模式用绿色 logo，浅色/深色模式用原蓝色 logo
const logoSrc = computed(() => {
  const mode = localStorage.getItem('themeMode') || 'light'
  if (mode === 'light' || mode === 'dark') {
    return new URL('@/assets/logo.jpg', import.meta.url).href
  }
  return new URL('@/assets/logo-morandi.jpg', import.meta.url).href
})

const isLoginDisabled = computed(() => {
  if (loading.value) return true
  
  if (loginType.value === 'account') {
    return !loginForm.username || !loginForm.password
  } else {
    return !hasSentCode.value || !loginForm.phone || !/^\d{6}$/.test(loginForm.code)
  }
})

const switchLoginType = (type) => {
  loginType.value = type
  loginForm.username = ''
  loginForm.password = ''
  loginForm.phone = ''
  loginForm.code = ''
  hasSentCode.value = false
}

const handleClear = () => {
  if (loginType.value === 'account') {
    loginForm.username = ''
    loginForm.password = ''
  } else {
    loginForm.phone = ''
    loginForm.code = ''
    hasSentCode.value = false
    if (timer.value) {
      clearInterval(timer.value)
      timer.value = null
    }
    countdown.value = 0
  }
  ElMessage.success('已清空')
}

const sendCode = async () => {
  if (!loginForm.phone) {
    ElMessage.warning('请输入手机号')
    return
  }
  
  const phoneReg = /^1[3-9]\d{9}$/
  if (!phoneReg.test(loginForm.phone)) {
    ElMessage.warning('请输入正确的手机号')
    return
  }
  
  try {
      const response = await fetch('/api/auth/send-code', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ phone: loginForm.phone })
      })
      
      let result;
      if (response.ok) {
        result = await response.json();
        
        if (result.code === 200) {
          ElMessage.success('验证码已发送')
          hasSentCode.value = true
          countdown.value = 60
          timer.value = setInterval(() => {
            countdown.value--
            if (countdown.value <= 0) {
              clearInterval(timer.value)
              timer.value = null
            }
          }, 1000)
        } else {
          ElMessage.error(result.message || '发送验证码失败')
        }
      } else {
        try {
          result = await response.json();
          ElMessage.error(result.message || `发送验证码失败 (${response.status})`)
        } catch (jsonError) {
          ElMessage.error(`发送验证码失败 (${response.status})`)
        }
      }
    } catch (error) {
      console.error('发送验证码失败:', error)
      ElMessage.error('发送验证码失败，请检查网络连接')
    }
}

const handleLogin = async () => {
  if (loginType.value === 'account') {
    if (!loginForm.username || !loginForm.password) {
      ElMessage.warning('请输入用户名和密码')
      return
    }
  } else {
    if (!loginForm.phone || !loginForm.code) {
      ElMessage.warning('请输入手机号和验证码')
      return
    }
  }
  
  loading.value = true
  try {
    // ========== 内置超级用户 admin（系统初始化用，不连接数据库） ==========
    if (loginType.value === 'account' && loginForm.username.trim().toLowerCase() === 'admin') {
      // 密码格式：当天日期(YYYYMMDD) + 大写X，例如 20260901X
      const today = new Date()
      const year = today.getFullYear()
      const month = String(today.getMonth() + 1).padStart(2, '0')
      const day = String(today.getDate()).padStart(2, '0')
      const expectedPassword = `${year}${month}${day}X`
      
      if (loginForm.password === expectedPassword) {
        // 内置超级用户登录成功，不连接数据库
        const superAdminUser = {
          id: 0,
          username: 'admin',
          realName: '系统管理员',
          role: '超级管理员',
          roleName: '超级管理员',
          isAdmin: 1,
          viewOthers: 1,
          isSuperAdmin: true,  // 标记为内置超级用户，只能使用系统设置菜单
          permissions: []
        }
        
        localStorage.setItem('token', 'super-admin-token-' + Date.now())
        localStorage.setItem('user', JSON.stringify(superAdminUser))
        localStorage.setItem('username', '系统管理员')
        localStorage.setItem('roleName', '超级管理员')
        localStorage.setItem('permissions', JSON.stringify([]))
        localStorage.setItem('viewOthers', '1')
        localStorage.setItem('isSuperAdmin', '1')  // 标记为内置超级用户
        
        // 清除消息提醒记录
        localStorage.removeItem('confirmedPendingIds')
        localStorage.removeItem('confirmedTestIds')
        localStorage.removeItem('confirmedReturnedIds')
        localStorage.removeItem('lastRemindTimes')
        
        ElMessage.success('超级管理员登录成功（仅可使用系统设置）')
        router.push('/settings')  // 直接跳转到系统设置页面
        return
      } else {
        ElMessage.error('用户名或密码错误')
        loading.value = false
        return
      }
    }
    // ========== 内置超级用户判断结束 ==========
    
    let url, data
    if (loginType.value === 'account') {
      url = '/api/auth/login'
      data = { 
        username: loginForm.username, 
        password: loginForm.password 
      }
    } else {
      url = '/api/auth/login-sms'
      data = { 
        phone: loginForm.phone, 
        code: loginForm.code 
      }
    }
    
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(data)
    })
    
    let res;
    if (response.ok) {
      res = await response.json();
      
      const token = res.data?.token;
      const user = res.data?.user;
      
      if (token) {
        localStorage.setItem('token', token)
        localStorage.setItem('user', JSON.stringify(user || {}))
        localStorage.setItem('username', user?.realName || user?.username || '')
        localStorage.setItem('roleName', user?.roleName || user?.role || '用户')
        localStorage.setItem('permissions', JSON.stringify(user?.permissions || []))
        localStorage.setItem('viewOthers', user?.viewOthers || 0)
        // ========== 界面样式：个人优先，系统默认兜底 ==========
        const userTheme = user?.themeMode || ''
        let finalTheme = 'light'
        if (userTheme) {
          // 个人有设置，使用个人样式
          finalTheme = userTheme
        } else {
          // 个人未设置，获取系统默认样式
          try {
            const themeRes = await fetch('/api/config/system-theme')
            if (themeRes.ok) {
              const themeData = await themeRes.json()
              finalTheme = themeData.theme || 'light'
            }
          } catch (themeErr) {
            console.warn('获取系统默认样式失败，使用浅色:', themeErr)
          }
        }
        localStorage.setItem('themeMode', finalTheme)
        localStorage.setItem('userThemeMode', userTheme)  // 个人themeMode原始值：空=跟随系统，有值=个人设置
        // 应用样式到页面
        document.body.classList.remove('theme-light', 'theme-dark')
        if (finalTheme === 'light') document.body.classList.add('theme-light')
        else if (finalTheme === 'dark') document.body.classList.add('theme-dark')
        // ========== 界面样式结束 ==========
        // 登录成功后清除消息提醒的已确认记录和提醒时间
        // 这样每次登录后都会立即提醒所有待处理/待测试/测试返回的问题，就算之前点过了也提醒
        localStorage.removeItem('confirmedPendingIds')
        localStorage.removeItem('confirmedTestIds')
        localStorage.removeItem('confirmedReturnedIds')
        localStorage.removeItem('lastRemindTimes')
        ElMessage.success('登录成功')
        router.push('/')
      } else {
        ElMessage.error(res.message || '登录失败，未获取到token')
      }
    } else {
      try {
        res = await response.json();
        ElMessage.error(res.message || `登录失败 (${response.status})`)
      } catch (jsonError) {
        ElMessage.error(`登录失败 (${response.status})`)
      }
    }
  } catch (error) {
    console.error('登录失败:', error)
    ElMessage.error('登录失败: ' + error.message)
  } finally {
    loading.value = false
  }
}
</script>

<style scoped>
.login-container { 
  position: relative;
  display: flex; 
  justify-content: center; 
  align-items: center; 
  min-height: 100vh; 
  background: linear-gradient(135deg, var(--el-color-primary-light-9) 0%, var(--el-color-primary-light-9) 30%, var(--el-color-primary-light-9) 60%, var(--el-color-primary-light-9) 100%);
  overflow: hidden;
}

/* 背景装饰 */
.bg-decoration {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  pointer-events: none;
}

.circle {
  position: absolute;
  border-radius: 50%;
  background: radial-gradient(circle, rgba(var(--el-color-primary-rgb), 0.25) 0%, transparent 70%);
  animation: float 8s ease-in-out infinite;
}

.circle-1 {
  width: 400px;
  height: 400px;
  top: -100px;
  left: -100px;
  animation-delay: 0s;
  background: radial-gradient(circle, rgba(var(--el-color-primary-rgb), 0.3) 0%, transparent 70%);
}

.circle-2 {
  width: 300px;
  height: 300px;
  bottom: -50px;
  right: -50px;
  animation-delay: 2s;
  background: radial-gradient(circle, rgba(201, 192, 143, 0.3) 0%, transparent 70%);
}

.circle-3 {
  width: 200px;
  height: 200px;
  top: 50%;
  right: 10%;
  animation-delay: 4s;
  background: radial-gradient(circle, rgba(166, 156, 172, 0.25) 0%, transparent 70%);
}

@keyframes float {
  0%, 100% { transform: translateY(0) scale(1); opacity: 0.6; }
  50% { transform: translateY(-30px) scale(1.1); opacity: 0.8; }
}

.grid-bg {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  background-image: 
    linear-gradient(rgba(var(--el-color-primary-rgb), 0.08) 1px, transparent 1px),
    linear-gradient(90deg, rgba(var(--el-color-primary-rgb), 0.08) 1px, transparent 1px);
  background-size: 50px 50px;
}

.login-box { 
  position: relative;
  z-index: 10;
  width: 440px; 
  padding: 40px; 
  background: linear-gradient(180deg, #ffffff 0%, var(--el-color-primary-light-9) 50%, var(--el-color-primary-light-9) 100%);
  border-radius: 16px; 
  box-shadow: 0 20px 60px rgba(var(--el-color-primary-rgb), 0.15), 0 8px 24px rgba(0, 0, 0, 0.06);
  animation: slideUp 0.6s ease-out;
  border: 1px solid rgba(var(--el-color-primary-rgb), 0.25);
}

@keyframes slideUp {
  from {
    opacity: 0;
    transform: translateY(30px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}

.login-header { 
  text-align: center; 
  margin-bottom: 24px; 
}

.logo-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 80px;
  height: 80px;
  margin-bottom: 16px;
}
.logo-img {
  width: 100%;
  height: 100%;
  object-fit: contain;
  border-radius: 12px;
}

@keyframes pulse {
  0%, 100% { box-shadow: 0 8px 24px rgba(var(--el-color-primary-rgb), 0.35); }
  50% { box-shadow: 0 8px 32px rgba(var(--el-color-primary-rgb), 0.55); }
}

.title { 
  font-size: 26px; 
  font-weight: 600; 
  background: linear-gradient(135deg, var(--el-color-primary) 0%, var(--el-color-primary-dark-2) 50%, var(--el-color-primary-dark-2) 100%);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
  background-clip: text;
  margin: 0;
  letter-spacing: 2px;
}

.subtitle {
  font-size: 13px;
  color: #909399;
  margin-top: 8px;
}

.login-tabs { 
  display: flex; 
  margin-bottom: 24px; 
  border-bottom: 2px solid #f0f0f0; 
}

.tab-item { 
  flex: 1; 
  text-align: center; 
  padding: 12px; 
  cursor: pointer; 
  color: #909399; 
  font-size: 15px; 
  transition: all 0.3s; 
}

.tab-item.active { 
  color: var(--el-color-primary); 
  border-bottom: 2px solid var(--el-color-primary); 
  font-weight: 500; 
}

.tab-item:hover { 
  color: var(--el-color-primary); 
}

.login-form { 
  margin-top: 24px; 
}

/* 输入框样式 - 默认浅青绿背景，深色模式跟随主题变量（--wtfk-input-*） */
.login-form :deep(.el-input__wrapper) {
  background: var(--wtfk-input-bg, linear-gradient(135deg, var(--el-color-primary-light-9) 0%, var(--el-color-primary-light-9) 100%));
  border-radius: 8px;
  box-shadow: 0 0 0 1px var(--wtfk-input-border, var(--el-color-primary-light-8)) inset;
  transition: all 0.3s;
}

.login-form :deep(.el-input__wrapper:hover) {
  box-shadow: 0 0 0 1px var(--wtfk-input-border-hover, var(--el-color-primary-light-3)) inset;
  background: var(--wtfk-input-bg-hover, linear-gradient(135deg, #ffffff 0%, var(--el-color-primary-light-9) 100%));
}

.login-form :deep(.el-input__wrapper.is-focus) {
  box-shadow: 0 0 0 1px var(--wtfk-input-border-focus, var(--el-color-primary)) inset, 0 0 10px rgba(var(--el-color-primary-rgb), 0.15);
  background: var(--wtfk-input-bg-focus, linear-gradient(135deg, #ffffff 0%, #f0fffb 100%));
}

.login-form :deep(.el-input__inner) {
  color: var(--wtfk-input-text, #303133);
  font-size: 14px;
}

.login-form :deep(.el-input__inner::placeholder) {
  color: var(--wtfk-input-placeholder, #a8b5b0);
}

.login-form :deep(.el-input__prefix) {
  color: var(--wtfk-input-prefix, var(--el-color-primary-light-3));
}


.code-input-wrapper { 
  display: flex; 
  gap: 10px; 
}

.code-input-wrapper .el-input { 
  flex: 1; 
}

.code-button { 
  white-space: nowrap; 
  padding: 0 20px; 
}

.button-group {
  display: flex;
  gap: 12px;
  justify-content: center;
  width: 100%;
}

.btn-gradient {
  width: 150px;
  height: 42px;
  font-size: 15px;
  font-weight: 500;
  color: #fff;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: all 0.3s ease;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  letter-spacing: 2px;
}

/* 登录按钮 - 莫兰迪绿 */
.btn-login {
  background: linear-gradient(135deg, var(--el-color-primary-light-3) 0%, var(--el-color-primary) 100%);
  box-shadow: 0 2px 8px rgba(var(--el-color-primary-rgb), 0.35);
}

.btn-login:hover {
  background: linear-gradient(135deg, var(--el-color-primary-light-3) 0%, var(--el-color-primary-light-3) 100%);
  box-shadow: 0 4px 16px rgba(var(--el-color-primary-rgb), 0.5);
  transform: translateY(-1px);
}

/* 清空按钮 - 莫兰迪绿（与登录按钮一致） */
.btn-clear {
  background: linear-gradient(135deg, var(--el-color-primary-light-3) 0%, var(--el-color-primary) 100%);
  box-shadow: 0 2px 8px rgba(var(--el-color-primary-rgb), 0.35);
}

.btn-clear:hover {
  background: linear-gradient(135deg, var(--el-color-primary-light-3) 0%, var(--el-color-primary-light-3) 100%);
  box-shadow: 0 4px 16px rgba(var(--el-color-primary-rgb), 0.5);
  transform: translateY(-1px);
}

.btn-gradient:active {
  transform: translateY(0);
}

.btn-icon {
  margin-right: 4px;
  font-size: 15px;
}

.loading-text {
  display: inline-block;
  animation: pulse 1s ease-in-out infinite;
}

@keyframes pulse {
  0%, 100% { opacity: 1; }
  50% { opacity: 0.5; }
}

.login-tip { 
  margin-top: 24px; 
  text-align: center; 
  color: #909399; 
  font-size: 12px; 
}

.footer {
  position: absolute;
  bottom: 20px;
  left: 0;
  right: 0;
  text-align: center;
  color: #909399;
  font-size: 13px;
  z-index: 10;
}

.footer p {
  margin: 0;
}
.footer .version-text {
  margin-top: 4px;
  font-size: 12px;
}
</style>

<style>
/* 深色模式下登录输入框深色（非 scoped，确保选择器完整不被裁剪） */
body.theme-dark .login-form .el-input__wrapper,
body.theme-dark .login-form .el-select__wrapper {
  background: #1A2332 !important;
  box-shadow: 0 0 0 1px #34445F inset !important;
}
body.theme-dark .login-form .el-input__wrapper:hover {
  box-shadow: 0 0 0 1px #3B82C4 inset !important;
}
body.theme-dark .login-form .el-input__wrapper.is-focus {
  box-shadow: 0 0 0 1px #3B82C4 inset, 0 0 8px rgba(59, 130, 196, 0.3) !important;
}
body.theme-dark .login-form .el-input__inner {
  color: #E6EDF7 !important;
}
body.theme-dark .login-form .el-input__inner::placeholder {
  color: #6B7E97 !important;
}
body.theme-dark .login-form .el-input__prefix {
  color: #93A5BD !important;
}
body.theme-dark .login-form .el-input__wrapper:hover,
body.theme-dark .login-form .el-input__wrapper.is-focus {
  background: #22304A !important;
  box-shadow: 0 0 0 1px #3B82C4 inset !important;
}
body.theme-dark .login-form .el-input__inner:-webkit-autofill {
  -webkit-box-shadow: 0 0 0 1000px #1A2332 inset !important;
  -webkit-text-fill-color: #E6EDF7 !important;
}
</style>
