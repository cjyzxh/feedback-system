<template>
  <div class="other-settings">
    <el-card shadow="never" class="card">
      <template #header>
        <div class="card-title">
          <el-icon><Setting /></el-icon>
          <span>其它设置</span>
        </div>
      </template>

      <!-- 界面风格（系统默认样式） -->
      <el-form label-width="100px" label-position="left">
        <el-form-item label="界面风格">
          <el-radio-group v-model="themeMode" @change="handleThemeChange">
            <el-radio value="morandi">莫兰迪系</el-radio>
            <el-radio value="light">浅色系</el-radio>
            <el-radio value="dark">深色系</el-radio>
          </el-radio-group>
          <div class="tip">系统默认样式：个人未设置个人样式时生效；个人可在右上角"个人信息"中选择自己的样式</div>
        </el-form-item>

        <!-- 全局字体/字号 -->
        <el-form-item label="字体字号">
          <el-radio-group v-model="fontSize" @change="handleFontSizeChange">
            <el-radio value="small">小（13px）</el-radio>
            <el-radio value="standard">标准（14px）</el-radio>
            <el-radio value="large">大（15px）</el-radio>
            <el-radio value="xlarge">特大（16px）</el-radio>
          </el-radio-group>
          <div class="tip">全局字体字号：立即对系统所有页面生效（按钮/输入框/表格等）</div>
        </el-form-item>
      </el-form>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { Setting } from '@element-plus/icons-vue'
import api from '@/api'
import { applyFontSize, FONT_SIZE_MAP, FONT_SIZE_LABELS } from '@/utils/theme'

// ========== 界面风格（系统默认样式，从系统管理页迁移至此） ==========
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

// ========== 全局字体/字号 ==========
const fontSize = ref('standard')

// 从后端加载系统字号
const fetchFontSize = async () => {
  try {
    const response = await api.get('/config/font-size')
    if (response.data && response.data.fontSize) {
      fontSize.value = response.data.fontSize
    }
  } catch (error) {
    console.error('获取系统字体字号失败:', error)
  }
}

// 保存并立即应用
const handleFontSizeChange = async (val: string) => {
  applyFontSize(val)  // 立即生效
  try {
    await api.post('/config/font-size', { fontSize: val })
    ElMessage.success(`全局字体字号已保存为${FONT_SIZE_LABELS[val] || val}`)
  } catch (e) {
    console.error('保存系统字体字号失败:', e)
    ElMessage.error('保存系统字体字号失败')
  }
}

onMounted(() => {
  fetchSystemTheme()   // 从后端加载系统默认样式
  fetchFontSize()      // 从后端加载系统字号
})
</script>

<style scoped>
.other-settings { padding: 16px; }
.card { max-width: 900px; }
.card-title { display: flex; align-items: center; gap: 8px; font-weight: 600; font-size: 16px; }
.tip { width: 100%; color: #909399; font-size: 12px; line-height: 1.6; margin-top: 4px; }
</style>
