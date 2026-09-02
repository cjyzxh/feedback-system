<template>
  <div class="settings-manage">
    <div class="content-area-full">
      <el-card v-if="!isSubRoute">
        <template #header>
          <span>系统管理</span>
        </template>
        <el-form label-width="120px">
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
            <el-input v-model="dbSettings.username" placeholder="请输入数据库用户名" />
          </el-form-item>
          <el-form-item label="密码">
            <el-input v-model="dbSettings.password" type="password" placeholder="请输入数据库密码" show-password />
          </el-form-item>
          <el-form-item>
            <el-button type="primary" @click="handleSaveDbSettings">保存数据库配置</el-button>
            <el-button @click="testDbConnection">测试连接</el-button>
          </el-form-item>
        </el-form>
      </el-card>
      <router-view v-else />
    </div>
  </div>
</template>

<script setup lang="ts">
import { reactive, computed, ref, watch } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
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

const dbSettings = reactive({
  type: '',
  host: '',
  port: 3306,
  database: '',
  username: '',
  password: ''
})

const handleSaveDbSettings = async () => {
  try {
    const response = await api.post('/config/database/save', dbSettings)
    if (response.data.success) {
      ElMessage.success('数据库配置已保存')
    } else {
      ElMessage.error('保存数据库配置失败: ' + (response.data.message || '未知错误'))
    }
  } catch (error) {
    ElMessage.error('保存数据库配置失败')
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
const initDbSettings = async () => {
  try {
    const response = await api.get('/config/database')
    if (response.data) {
      Object.assign(dbSettings, response.data)
    }
  } catch (error) {
    console.error('获取数据库配置失败:', error)
  }
}

// 监听数据库类型变化，自动更新端口号
watch(() => dbSettings.type, (newType) => {
  if (newType === 'mysql') {
    dbSettings.port = 3306
  } else if (newType === 'mssql') {
    dbSettings.port = 1443
  }
})

// 初始化
initDbSettings()
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
</style>
