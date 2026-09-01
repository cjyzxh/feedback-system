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
          <el-icon :size="40"><Monitor /></el-icon>
        </div>
        <h1 class="title">问题反馈系统</h1>
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
              type="primary" 
              size="large" 
              :disabled="countdown > 0"
              @click="sendCode"
              class="code-button"
            >
              {{ countdown > 0 ? `${countdown}秒后重试` : '获取验证码' }}
            </el-button>
          </div>
        </el-form-item>
        
        <el-form-item>
          <div class="button-group">
            <button type="button" class="btn-gradient" @click="handleLogin">
              <span v-if="loading" class="loading-text">登录中...</span>
              <span v-else>登 录</span>
            </button>
            <button type="button" class="btn-gradient" @click="handleClear">
              <el-icon class="btn-icon"><Delete /></el-icon>清 空
            </button>
          </div>
        </el-form-item>
      </el-form>
    </div>
    
    <div class="footer">
      <p>北京创佳益软件有限公司 版权所有(2004-2026)</p>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, computed } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { User, Lock, Iphone, Message, Monitor, Delete } from '@element-plus/icons-vue'
import axios from 'axios'

const router = useRouter()
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
  background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
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
  background: radial-gradient(circle, rgba(102, 126, 234, 0.3) 0%, transparent 70%);
  animation: float 8s ease-in-out infinite;
}

.circle-1 {
  width: 400px;
  height: 400px;
  top: -100px;
  left: -100px;
  animation-delay: 0s;
}

.circle-2 {
  width: 300px;
  height: 300px;
  bottom: -50px;
  right: -50px;
  animation-delay: 2s;
}

.circle-3 {
  width: 200px;
  height: 200px;
  top: 50%;
  right: 10%;
  animation-delay: 4s;
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
    linear-gradient(rgba(255, 255, 255, 0.03) 1px, transparent 1px),
    linear-gradient(90deg, rgba(255, 255, 255, 0.03) 1px, transparent 1px);
  background-size: 50px 50px;
}

.login-box { 
  position: relative;
  z-index: 10;
  width: 440px; 
  padding: 40px; 
  background: rgba(255, 255, 255, 0.98); 
  border-radius: 16px; 
  box-shadow: 0 20px 60px rgba(0, 0, 0, 0.3);
  animation: slideUp 0.6s ease-out;
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
  width: 70px;
  height: 70px;
  border-radius: 50%;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: #fff;
  margin-bottom: 16px;
  box-shadow: 0 8px 24px rgba(102, 126, 234, 0.4);
  animation: pulse 2s ease-in-out infinite;
}

@keyframes pulse {
  0%, 100% { box-shadow: 0 8px 24px rgba(102, 126, 234, 0.4); }
  50% { box-shadow: 0 8px 32px rgba(102, 126, 234, 0.6); }
}

.title { 
  font-size: 26px; 
  font-weight: 600; 
  color: #333;
  margin: 0;
}

.subtitle {
  font-size: 13px;
  color: #999;
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
  color: #666; 
  font-size: 15px; 
  transition: all 0.3s; 
}

.tab-item.active { 
  color: #667eea; 
  border-bottom: 2px solid #667eea; 
  font-weight: 500; 
}

.tab-item:hover { 
  color: #667eea; 
}

.login-form { 
  margin-top: 24px; 
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
  gap: 16px;
  justify-content: center;
  width: 100%;
}

.btn-gradient {
  width: 150px;
  height: 40px;
  font-size: 15px;
  font-weight: 500;
  color: #fff;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: all 0.3s ease;
  box-shadow: 0 2px 8px rgba(102, 126, 234, 0.35);
  display: inline-flex;
  align-items: center;
  justify-content: center;
  letter-spacing: 2px;
}

.btn-gradient:hover {
  background: linear-gradient(135deg, #7689f0 0%, #865bb2 100%);
  box-shadow: 0 4px 16px rgba(102, 126, 234, 0.5);
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
  color: #999; 
  font-size: 12px; 
}

.footer {
  position: absolute;
  bottom: 20px;
  left: 0;
  right: 0;
  text-align: center;
  color: rgba(255, 255, 255, 0.6);
  font-size: 13px;
  z-index: 10;
}

.footer p {
  margin: 0;
}
</style>
