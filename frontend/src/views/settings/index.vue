<template>
  <div class="settings-manage">
    <div class="content-area-full">
      <el-card v-if="!isSubRoute">
        <template #header>
          <span>系统管理</span>
        </template>
        
        <!-- 数据库连接状态提示 -->
        <el-alert 
          :title="appStatus.message" 
          :type="appStatus.isSafeMode ? 'error' : 'success'"
          :closable="false"
          show-icon
          style="margin-bottom: 20px;"
        >
          <template #default>
            <div v-if="appStatus.isSafeMode">
              <p>当前数据库连接失败，仅配置管理功能可用。</p>
              <p v-if="appStatus.dbConnectionError">错误信息：{{ appStatus.dbConnectionError }}</p>
              <p>请修改下方配置后，点击"测试连接"确认连接成功，再点击"保存配置"并"重启服务"。</p>
            </div>
            <div v-else>
              <p>数据库连接正常，所有功能可用。</p>
              <p>启动时间：{{ appStatus.startupTime }}</p>
            </div>
          </template>
        </el-alert>
        
        <el-form label-width="120px">
          <el-form-item label="界面风格">
            <el-radio-group v-model="themeMode" @change="handleThemeChange">
              <el-radio :value="'morandi'">莫兰迪系</el-radio>
              <el-radio :value="'light'">浅色系</el-radio>
              <el-radio :value="'dark'">深色系</el-radio>
            </el-radio-group>
          </el-form-item>
          <el-form-item label="数据库类型">
              <el-radio-group v-model="dbSettings.type">
                <el-radio :value="'mysql'">MySQL</el-radio>
                <el-radio :value="'mssql'">SQL Server</el-radio>
              </el-radio-group>
            </el-form-item>
          <el-form-item label="数据库地址">
            <el-input v-model="dbSettings.host" placeholder="请输入数据库IP地址" />
          </el-form-item>
          <el-form-item label="数据库端口">
            <el-input v-model.number="dbSettings.port" placeholder="请输入数据库端口" />
          </el-form-item>
          <el-form-item label="数据库名称">
            <el-input v-model="dbSettings.database" placeholder="请输入数据库名称" />
          </el-form-item>
          <el-form-item label="用户名">
            <el-input v-model="dbSettings.username" placeholder="请输入数据库用户名" autocomplete="off" />
          </el-form-item>
          <el-form-item label="密码">
            <el-input v-model="dbSettings.password" type="password" placeholder="请输入数据库密码" show-password autocomplete="new-password" />
          </el-form-item>
          <el-form-item>
            <el-button class="morandi-btn morandi-green" @click="handleSaveDbSettings">保存数据库配置</el-button>
            <el-button class="morandi-btn morandi-blue" @click="testDbConnection">测试连接</el-button>
            <el-button class="morandi-btn morandi-orange" @click="restartService">重启服务</el-button>
          </el-form-item>
        </el-form>

        <!-- 图片上传路径配置 -->
        <el-divider content-position="left">图片存储配置</el-divider>
        <el-form label-width="120px">
          <el-form-item label="图片存储路径">
            <el-input v-model="uploadPath" placeholder="例如: ./uploads 或 D:/wtfk-uploads" />
          </el-form-item>
          <el-form-item label="当前路径">
            <span style="color: #67c23a; font-weight: 500;">{{ uploadPath || './uploads (默认)' }}</span>
          </el-form-item>
          <el-form-item>
            <el-button class="morandi-btn morandi-green" @click="handleSaveUploadPath">保存图片路径</el-button>
            <el-button class="morandi-btn morandi-orange" @click="resetUploadPath">恢复默认</el-button>
          </el-form-item>
          <el-form-item>
            <div style="color: #909399; font-size: 12px; line-height: 1.8;">
              <p>说明：</p>
              <p>1. 相对路径（如 ./uploads）相对于后端运行目录</p>
              <p>2. 绝对路径（如 D:/wtfk-uploads）直接使用指定目录</p>
              <p>3. 修改后新上传的图片将保存到新路径，已有图片仍在原路径</p>
            </div>
          </el-form-item>
        </el-form>

        <!-- 短信服务配置 -->
        <el-divider content-position="left">短信服务配置</el-divider>
        <el-form label-width="120px">
          <el-form-item label="短信用户ID">
            <el-input v-model="smsSettings.userId" placeholder="用于签名的用户ID" autocomplete="off" />
          </el-form-item>
          <el-form-item label="企业ID">
            <el-input v-model="smsSettings.companyId" placeholder="API请求使用的企业ID" autocomplete="off" />
          </el-form-item>
          <el-form-item label="短信密码">
            <el-input v-model="smsSettings.password" type="password" placeholder="如未修改请保持 ******" show-password autocomplete="new-password" />
          </el-form-item>
          <el-form-item label="API地址">
            <el-input v-model="smsSettings.apiUrl" placeholder="短信API请求地址" autocomplete="off" />
          </el-form-item>
          <el-form-item>
            <el-button class="morandi-btn morandi-green" @click="handleSaveSmsConfig">保存短信配置</el-button>
            <el-button class="morandi-btn morandi-blue" @click="testSmsConfig">测试发送</el-button>
          </el-form-item>
          <el-form-item>
            <div style="color: #909399; font-size: 12px; line-height: 1.8;">
              <p>说明：</p>
              <p>1. 短信参数用于手机号验证码登录，保存后立即生效，无需重启服务</p>
              <p>2. 密码显示 ****** 表示未修改，保存时会保留原密码</p>
              <p>3. 点击"测试发送"可输入手机号验证短信通道是否正常</p>
            </div>
          </el-form-item>
        </el-form>
      </el-card>
      <router-view v-else />
    </div>
  </div>
</template>

<script setup lang="ts">
import { reactive, computed, ref, watch, onMounted } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ElMessage, ElMessageBox } from 'element-plus'
import { User, UserFilled, Position, Grid, Document, Setting } from '@element-plus/icons-vue'
import api from '@/api'

const route = useRoute()
const router = useRouter()

// 判断当前用户是否是管理员
const isAdmin = computed(() => {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  return parseInt(u.isAdmin || '0') === 1
})

const isSubRoute = computed(() => route.path !== '/settings')

// ========== 界面风格主题切换 ==========
// 三种主题：morandi(莫兰迪系-默认) / light(浅色系-白底Logo蓝) / dark(深色系)
const themeMode = ref(localStorage.getItem('themeMode') || 'morandi')

const applyTheme = (mode: string) => {
  // 先清除所有主题class
  document.body.classList.remove('theme-light', 'theme-dark')
  if (mode === 'light') {
    document.body.classList.add('theme-light')
  } else if (mode === 'dark') {
    document.body.classList.add('theme-dark')
  }
  // morandi 为默认主题，不加 class
}

const handleThemeChange = async (val: string) => {
  // 保存到后端系统配置（database-config.json）
  try {
    await api.post('/config/system-theme', { theme: val })
    const labels: Record<string, string> = { morandi: '莫兰迪系', light: '浅色系', dark: '深色系' }
    ElMessage.success(`系统默认样式已保存为${labels[val] || val}`)

    // 如果当前用户是"跟随系统"（个人themeMode为空），则保存后立即应用新的系统默认样式
    const userThemeMode = localStorage.getItem('userThemeMode') || ''
    if (!userThemeMode) {
      localStorage.setItem('themeMode', val)
      applyTheme(val)
    }
    // 如果用户有个人样式，则只保存系统默认，不影响当前页面
  } catch (e) {
    console.error('保存系统默认样式失败:', e)
    ElMessage.error('保存系统默认样式失败')
  }
}

// 从后端获取系统默认样式（仅用于显示单选框选中状态，不应用到当前页面）
const fetchSystemTheme = async () => {
  try {
    const response = await api.get('/config/system-theme')
    if (response.data && response.data.theme) {
      themeMode.value = response.data.theme  // 只更新单选框显示，不 applyTheme
    }
  } catch (error) {
    console.error('获取系统默认样式失败:', error)
  }
}

// 应用运行状态
const appStatus = reactive({
  isSafeMode: false,
  startupTime: '',
  dbConnectionError: '',
  message: '正在获取状态...',
})

// 获取应用运行状态
const fetchAppStatus = async () => {
  try {
    const response = await api.get('/config/status')
    if (response.data) {
      Object.assign(appStatus, response.data)
    }
  } catch (error) {
    console.error('获取应用状态失败:', error)
    appStatus.isSafeMode = true
    appStatus.message = '无法连接后端服务，请确认后端是否启动'
  }
}

const dbSettings = reactive({
  type: '',
  host: '',
  port: null as number | null,
  database: '',
  username: '',
  password: ''
})

// 图片上传路径
const uploadPath = ref('./uploads')

// 加载图片上传路径
const fetchUploadPath = async () => {
  try {
    const response = await api.get('/config/upload-path')
    if (response.data && response.data.uploadPath) {
      uploadPath.value = response.data.uploadPath
    }
  } catch (error) {
    console.error('获取图片上传路径失败:', error)
  }
}

// 保存图片上传路径
const handleSaveUploadPath = async () => {
  try {
    const response = await api.post('/config/upload-path', { uploadPath: uploadPath.value })
    if (response.data.success) {
      ElMessage.success('图片上传路径已保存')
    } else {
      ElMessage.error('保存失败: ' + (response.data.message || '未知错误'))
    }
  } catch (error) {
    ElMessage.error('保存图片上传路径失败')
  }
}

// 恢复默认图片上传路径
const resetUploadPath = () => {
  uploadPath.value = './uploads'
  ElMessage.info('已恢复默认路径，点击保存生效')
}

// ========== 短信服务配置 ==========
const smsSettings = reactive({
  userId: '',
  companyId: '',
  password: '',
  apiUrl: '',
})

// 加载短信配置
const fetchSmsConfig = async () => {
  try {
    const response = await api.get('/config/sms')
    if (response.data) {
      smsSettings.userId = response.data.userId || ''
      smsSettings.companyId = response.data.companyId || ''
      smsSettings.password = response.data.password || ''
      smsSettings.apiUrl = response.data.apiUrl || ''
    }
  } catch (error) {
    console.error('获取短信配置失败:', error)
  }
}

// 保存短信配置
const handleSaveSmsConfig = async () => {
  try {
    const response = await api.post('/config/sms', {
      userId: smsSettings.userId,
      companyId: smsSettings.companyId,
      password: smsSettings.password,
      apiUrl: smsSettings.apiUrl,
    })
    if (response.data.success) {
      ElMessage.success('短信配置已保存，立即生效')
      // 重新加载（密码会显示为 ******）
      await fetchSmsConfig()
    } else {
      ElMessage.error('保存失败: ' + (response.data.message || '未知错误'))
    }
  } catch (error) {
    ElMessage.error('保存短信配置失败')
  }
}

// 测试短信发送
const testSmsConfig = async () => {
  try {
    const { value: phone } = await ElMessageBox.prompt('请输入测试手机号', '测试短信发送', {
      confirmButtonText: '发送',
      cancelButtonText: '取消',
      inputPattern: /^1[3-9]\d{9}$/,
      inputErrorMessage: '请输入正确的11位手机号',
    })
    if (phone) {
      // 调用发送验证码接口（会生成随机验证码并发送）
      const response = await api.post('/auth/send-code', { phone })
      if (response.data && response.data.success) {
        ElMessage.success('测试短信已发送，请查收')
      } else {
        ElMessage.error('发送失败: ' + (response.data?.message || '未知错误'))
      }
    }
  } catch (error: any) {
    if (error !== 'cancel') {
      ElMessage.error('测试短信发送失败: ' + (error.message || '未知错误'))
    }
  }
}

const handleSaveDbSettings = async () => {
  try {
    const response = await api.post('/config/database/save', dbSettings)
    if (response.data.success) {
      ElMessage.success('数据库配置已保存')
      // 提示用户是否重启服务使配置生效
      setTimeout(async () => {
        try {
          await ElMessageBox.confirm(
            '配置已保存，是否立即重启后端服务使新配置生效？\n重启期间服务将短暂中断。',
            '重启服务',
            {
              confirmButtonText: '立即重启',
              cancelButtonText: '稍后重启',
              type: 'warning',
            }
          )
          // 用户确认重启
          await restartService()
        } catch (e) {
          // 用户取消重启
        }
      }, 500)
    } else {
      ElMessage.error('保存数据库配置失败: ' + (response.data.message || '未知错误'))
    }
  } catch (error) {
    ElMessage.error('保存数据库配置失败')
  }
}

// 重启后端服务
const restartService = async () => {
  try {
    ElMessage.info('服务正在重启，请稍候...')
    await api.post('/config/restart')
    
    // 等待服务重启，每2秒尝试连接一次，最多等待30秒
    let retryCount = 0
    const maxRetries = 15
    
    const checkService = async () => {
      try {
        await api.get('/config/database?type=mssql', { timeout: 3000 })
        return true
      } catch (e) {
        return false
      }
    }
    
    const waitForRestart = async () => {
      while (retryCount < maxRetries) {
        await new Promise(resolve => setTimeout(resolve, 2000))
        retryCount++
        const isUp = await checkService()
        if (isUp) {
          ElMessage.success('服务重启成功！新配置已生效。')
          // 重新加载配置
          await initDbSettings(dbSettings.type)
          return
        }
      }
      ElMessage.warning('服务重启超时，请手动刷新页面确认服务状态。')
    }
    
    await waitForRestart()
  } catch (error) {
    ElMessage.error('重启服务请求失败')
  }
}

const testDbConnection = async () => {
  try {
    const response = await api.post('/config/database/test', dbSettings)
    if (response.data.success) {
      ElMessage.success('连接测试成功')
    } else {
      ElMessage.error('连接测试失败: ' + (response.data.message || '未知错误'))
    }
  } catch (error) {
    ElMessage.error('连接测试失败')
  }
}

// 初始化数据库设置
let isLoading = false;
const initDbSettings = async (type?: string) => {
  if (isLoading) return;
  isLoading = true;
  try {
    const url = type ? `/config/database?type=${type}` : '/config/database';
    const response = await api.get(url);
    if (response.data) {
      // 先设置其他字段，最后设置type，避免触发watch
      const { type: configType, ...otherFields } = response.data;
      Object.assign(dbSettings, otherFields);
      dbSettings.type = configType;
    }
  } catch (error) {
    console.error('获取数据库配置失败:', error);
  } finally {
    setTimeout(() => { isLoading = false; }, 500);
  }
}

// 监听数据库类型变化，加载对应类型的配置
watch(() => dbSettings.type, (newType, oldType) => {
  if (newType && newType !== oldType && !isLoading) {
    initDbSettings(newType);
  }
});

// 页面加载时初始化
onMounted(() => {
  fetchSystemTheme();  // 从后端加载系统默认样式
  fetchAppStatus();
  initDbSettings();
  fetchUploadPath();
  fetchSmsConfig();
});
</script>

<style scoped>
.settings-manage {
  padding: 0;
  height: 100%;
  min-height: calc(100vh - 100px);
}

.settings-home { padding: 20px; }

.content-area-full {
  width: 100%;
  height: 100%;
  margin: 0;
  padding: 0;
}

.content-area-full > * {
  width: 100%;
  height: 100%;
  min-height: calc(100vh - 100px);
}

.content-area-full .el-card {
  height: 100%;
  min-height: calc(100vh - 100px);
  margin: 0;
  border: 1px solid #ebeef5;
  border-radius: 4px;
  overflow: hidden;
  box-sizing: border-box;
}

.el-card {
  margin: 0 !important;
  box-sizing: border-box !important;
}

.el-card__header {
  padding: 12px 20px;
  border-bottom: 1px solid #ebeef5;
  background-color: #fafafa;
  margin: 0;
  box-sizing: border-box;
}

.el-card__body {
  padding: 20px;
  height: calc(100% - 53px);
  overflow: auto;
  margin: 0;
  box-sizing: border-box;
}

/* ========== 莫兰迪色系按钮 - 低饱和度、柔和、高级 ========== */
.morandi-btn {
  border: none !important;
  color: #ffffff !important;
  font-weight: 500;
  border-radius: 6px !important;
  padding: 8px 16px !important;
  transition: all 0.3s ease;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
}
.morandi-btn:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.12);
  color: #ffffff !important;
}
.morandi-btn:active {
  transform: translateY(0);
}
.morandi-btn:disabled,
.morandi-btn.is-disabled {
  background: #909399 !important;
  color: #ffffff !important;
  cursor: not-allowed;
  transform: none;
  box-shadow: none;
}

/* 保存 - 莫兰迪绿（柔和、沉稳，表示确认完成） */
/* 测试连接 - 莫兰迪蓝（柔和、沉稳，表示测试连接） */
/* 重启服务 - 莫兰迪橙（柔和、温暖，表示操作提醒） */
</style>
