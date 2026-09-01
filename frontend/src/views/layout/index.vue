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
import { ref, computed, onMounted, reactive } from 'vue'
import { useRouter, useRoute } from 'vue-router'
import { ElMessage } from 'element-plus'
import { ChatDotRound, Tools, CircleCheck, Setting, DataAnalysis, User, Key } from '@element-plus/icons-vue'
import { authApi } from '@/api'
import axios from 'axios'

const router = useRouter()
const route = useRoute()
const profileFormRef = ref()
const profileDialogVisible = ref(false)

const username = computed(() => { const u = JSON.parse(localStorage.getItem('user') || '{}'); return u.realName || u.username || localStorage.getItem('username') || '' })
const roleName = computed(() => { const u = JSON.parse(localStorage.getItem('user') || '{}'); return u.roleName || u.role || localStorage.getItem('roleName') || '用户' })

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
