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
        <el-menu-item index="/discuss">
          <el-icon><ChatLineSquare /></el-icon style="font-size:16px">
          <template #title>问题讨论</template>
        </el-menu-item>
        <el-menu-item index="/report">
          <el-icon><DataAnalysis /></el-icon style="font-size:16px">
          <template #title>时效报表</template>
        </el-menu-item>
        <el-menu-item index="/settings">
          <el-icon><Setting /></el-icon style="font-size:16px">
          <template #title>系统管理</template>
        </el-menu-item>
      </el-menu>
    </div>
    <div class="main-content">
      <div class="header">
        <div class="title">{{ route.meta?.title || '' }}</div>
        <div class="user-info">
          <span>{{ username }} ({{ roleName }})</span>
          <el-button type="danger" size="small" @click="logout">退出</el-button>
        </div>
      </div>
      <div class="content">
        <router-view />
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { ChatDotRound, Tools, CircleCheck, Setting, User, Key, HomeFilled } from '@element-plus/icons-vue'
import { authApi } from '@/api'

const router = useRouter()
const route = useRoute()
const username = computed(() => { const u = JSON.parse(localStorage.getItem('user') || '{}'); return u.realName || u.username || localStorage.getItem('username') || '' })
const roleName = computed(() => { const u = JSON.parse(localStorage.getItem('user') || '{}'); return u.roleName || localStorage.getItem('roleName') || '用户' })
const userPermissions = ref<any[]>([])

const activeMenu = computed(() => route.path)
const menuPermissions = computed(() => {
    const user = JSON.parse(localStorage.getItem('user') || '{}')
    const isAdmin = user.role === 'admin' || user.role === '管理员'
    const viewOthers = parseInt(localStorage.getItem('viewOthers') || '0')
    if (isAdmin || viewOthers === 1) {
      return { 
        feedback: { view: true, add: true, edit: true, delete: true }, 
        test: { view: true, add: true, edit: true, delete: true }, 
        testcheck: { view: true, add: true, edit: true, delete: true }, 
        user: { view: true, add: true, edit: true, delete: true }, 
        role: { view: true, add: true, edit: true, delete: true }, 
        settings: { view: true, add: true, edit: true, delete: true } 
      }
    }
    const permsStr = localStorage.getItem('permissions')
    const perms = permsStr && permsStr.startsWith('[') ? JSON.parse(permsStr) : []
    const result: any = {}
    perms.forEach((p: any) => { result[p.page] = p })
    return result
})
const showFeedback = computed(() => menuPermissions.value.feedback?.view)
const showTest = computed(() => menuPermissions.value.test?.view)
const showTestcheck = computed(() => menuPermissions.value.testcheck?.view)
const showUser = computed(() => menuPermissions.value.user?.view)
const showRole = computed(() => menuPermissions.value.role?.view)
const showSettings = computed(() => menuPermissions.value.settings?.view)
  const showStaff = computed(() => {
    const user = JSON.parse(localStorage.getItem('user') || '{}')
    return user.role === 'admin' || user.role === '管理员'
  })

// 检查是否有指定页面的查看权限


const loadUserInfo = async () => {
  try {
    const res = await authApi.getUserInfo()
    const userInfo = res.data
    if (userInfo) {
      username.value = userInfo.realName || userInfo.username
      roleName.value = userInfo.roleName || '普通用户'
      localStorage.setItem('username', username.value)
      localStorage.setItem('roleName', roleName.value)
      
      // 解析权限
      if (userInfo.permissions) {
        userPermissions.value = typeof userInfo.permissions === 'string' 
          ? JSON.parse(userInfo.permissions) 
          : userInfo.permissions
      }
    }
  } catch (e) {
    console.error(e)
  }
}

const handleMenuSelect = (index: string) => {
  router.push(index)
}

const logout = () => {
  localStorage.removeItem('token')
  localStorage.removeItem('username')
  localStorage.removeItem('roleName')
  router.push('/login')
}

onMounted(() => {
  loadUserInfo()
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
.content { flex: 1; padding: 20px; overflow-y: auto; background: #f0f2f5; }
.el-menu { border-right: none; background: #304156; }
.el-menu-item { color: #bfcbd9; }
.el-menu-item:hover, .el-menu-item.is-active { background: #263445; color: #409eff; }
</style>
