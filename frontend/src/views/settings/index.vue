<template>
  <div class="settings-manage">
    <div class="left-sidebar">
      <el-card>
        <template #header>
          <span>功能导航</span>
        </template>
        <el-menu :default-active="activeMenu" @select="handleMenuSelect">
          <el-menu-item index="staff">
            <el-icon><User /></el-icon>
            <span>人员维护</span>
          </el-menu-item>
          <el-menu-item index="user">
            <el-icon><UserFilled /></el-icon>
            <span>用户管理</span>
          </el-menu-item>
          <el-menu-item index="hospital">
            <el-icon><OfficeBuilding /></el-icon>
            <span>医院维护</span>
          </el-menu-item>
          <el-menu-item index="role">
            <el-icon><Position /></el-icon>
            <span>角色管理</span>
          </el-menu-item>
          <el-menu-item index="module">
            <el-icon><Grid /></el-icon>
            <span>模块维护</span>
          </el-menu-item>
          <el-menu-item index="form">
            <el-icon><Document /></el-icon>
            <span>窗体维护</span>
          </el-menu-item>
          <el-menu-item index="system">
            <el-icon><Setting /></el-icon>
            <span>系统设置</span>
          </el-menu-item>
        </el-menu>
      </el-card>
    </div>
    <div class="content-area">
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
import { reactive, computed, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { User, UserFilled, OfficeBuilding, Position, Grid, Document, Setting } from '@element-plus/icons-vue'
import api from '@/api'

const route = useRoute()
const router = useRouter()

const isSubRoute = computed(() => route.path !== '/settings')
const activeMenu = ref('system')

// 更新 activeMenu 当路由变化时
const updateActiveMenu = () => {
  const path = route.path
  if (path.includes('/staff')) activeMenu.value = 'staff'
  else if (path.includes('/user')) activeMenu.value = 'user'
  else if (path.includes('/hospital')) activeMenu.value = 'hospital'
  else if (path.includes('/role')) activeMenu.value = 'role'
  else if (path.includes('/module')) activeMenu.value = 'module'
  else if (path.includes('/form')) activeMenu.value = 'form'
  else activeMenu.value = 'system'
}

// 初始化 activeMenu
updateActiveMenu()

// 监听路由变化
import { watch } from 'vue'
watch(() => route.path, updateActiveMenu)
const currentView = ref('system')

const dbSettings = reactive({
  type: '',
  host: '',
  port: 3306,
  database: '',
  username: '',
  password: ''
})

const handleMenuSelect = (index: string) => {
  if (index === 'staff') {
    router.push('/settings/staff')
  } else if (index === 'user') {
    router.push('/settings/user')
  } else if (index === 'hospital') {
    router.push('/settings/hospital')
  } else if (index === 'role') {
    router.push('/settings/role')
  } else if (index === 'module') {
    router.push('/settings/module')
  } else if (index === 'form') {
    router.push('/settings/form')
  } else {
    router.push('/settings')
  }
}

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
  padding: 10px;
  height: 100%;
  min-height: calc(100vh - 100px);
  display: flex;
  align-items: flex-start;
  gap: 10px;
}

.settings-home { padding: 20px; }

.left-sidebar {
  width: 200px;
  margin: 0;
  padding: 0;
}

.left-sidebar .el-card {
  height: 100%;
  min-height: calc(100vh - 120px);
  margin: 0;
  border: 1px solid #ebeef5;
  border-radius: 4px;
  overflow: hidden;
  box-sizing: border-box;
}

.content-area {
  flex: 1;
  min-width: 0;
  margin: 0;
  padding: 0;
}

.content-area > * {
  width: 100%;
  height: 100%;
  min-height: calc(100vh - 120px);
}

.content-area .el-card {
  height: 100%;
  min-height: calc(100vh - 120px);
  min-height: calc(100vh - 120px);
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

.el-menu {
  border-right: none !important;
}
</style>