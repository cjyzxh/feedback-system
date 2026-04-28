<template>
  <div class="login-container">
    <div class="login-box">
      <div class="login-header">
        <h1 class="title">问题反馈系统</h1>
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
          <el-button type="primary" size="large" class="login-button" @click="handleLogin" :loading="loading" :disabled="isLoginDisabled">
            {{ loading ? '登录中...' : '登 录' }}
          </el-button>
        </el-form-item>
      </el-form>
      
      <div class="login-tip" v-if="loginType === 'account'">测试账号：admin 密码：123456</div>
    </div>
  </div>
</template>

<script setup>
import { ref, reactive, computed } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { User, Lock, Iphone, Message } from '@element-plus/icons-vue'
import axios from 'axios'

const router = useRouter()
const loading = ref(false)
const loginType = ref('account')
const countdown = ref(0)
const timer = ref(null)
const hasSentCode = ref(false) // 记录是否已发送过验证码
const loginForm = reactive({
  username: '',
  password: '',
  phone: '',
  code: ''
})

// 计算登录按钮是否应该禁用
const isLoginDisabled = computed(() => {
  if (loading.value) return true
  
  if (loginType.value === 'account') {
    return !loginForm.username || !loginForm.password
  } else {
    // 短信登录：未发送验证码 或 手机号为空 或 验证码不是6位数字
    return !hasSentCode.value || !loginForm.phone || !/^\d{6}$/.test(loginForm.code)
  }
})

const switchLoginType = (type) => {
  loginType.value = type
  loginForm.username = ''
  loginForm.password = ''
  loginForm.phone = ''
  loginForm.code = ''
  hasSentCode.value = false // 切换登录类型时重置已发送状态
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
      // 直接使用原生 fetch，完全避免 axios 拦截器问题
      const response = await fetch('/api/auth/send-code', {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({ phone: loginForm.phone })
      })
      
      let result;
      if (response.ok) {
        // 如果响应正常，解析JSON
        result = await response.json();
        
        if (result.code === 200) {
          ElMessage.success('验证码已发送')
          hasSentCode.value = true // 设置为已发送验证码
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
        // 如果响应错误，尝试解析JSON错误信息
        try {
          result = await response.json();
          ElMessage.error(result.message || `发送验证码失败 (${response.status})`)
        } catch (jsonError) {
          // 如果无法解析JSON，显示状态码
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
    // 直接使用原生 fetch，完全避免 axios 拦截器问题
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
      // 如果响应正常，解析JSON
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
      }
    } else {
      // 如果响应错误，尝试解析JSON错误信息
      try {
        res = await response.json();
        // 显示服务器返回的具体错误信息
        ElMessage.error(res.message || `登录失败 (${response.status})`)
      } catch (jsonError) {
        // 如果无法解析JSON，显示状态码
        ElMessage.error(`登录失败 (${response.status})`)
      }
    }
  } catch (error) {
    console.error('登录失败:', error)
    ElMessage.error('登录失败')
  } finally {
    loading.value = false
  }
}
</script>

<style scoped>
.login-container { display: flex; justify-content: center; align-items: center; min-height: 100vh; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
.login-box { width: 440px; padding: 40px; background: #fff; border-radius: 12px; box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1); }
.login-header { text-align: center; margin-bottom: 24px; }
.title { font-size: 28px; font-weight: 600; color: #333; }
.login-tabs { display: flex; margin-bottom: 24px; border-bottom: 2px solid #f0f0f0; }
.tab-item { flex: 1; text-align: center; padding: 12px; cursor: pointer; color: #666; font-size: 15px; transition: all 0.3s; }
.tab-item.active { color: #667eea; border-bottom: 2px solid #667eea; font-weight: 500; }
.tab-item:hover { color: #667eea; }
.login-form { margin-top: 24px; }
.code-input-wrapper { display: flex; gap: 10px; }
.code-input-wrapper .el-input { flex: 1; }
.code-button { white-space: nowrap; padding: 0 20px; }
.login-button { width: 100%; font-size: 16px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); border: none; }
.login-tip { margin-top: 24px; text-align: center; color: #999; font-size: 12px; }
</style>
