<template>
  <div class="user-manage">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>用户管理</span>
          <el-button class="morandi-btn morandi-blue" @click="handleAdd">新增用户</el-button>
        </div>
      </template>

      <el-form :inline="true" :model="queryForm" class="search-form">
        <el-form-item label="用户名">
          <el-input v-model="queryForm.username" placeholder="请输入用户名" clearable />
        </el-form-item>
        <el-form-item label="姓名">
          <el-input v-model="queryForm.realName" placeholder="请输入姓名" clearable />
        </el-form-item>
        <el-form-item label="角色">
          <el-select v-model="queryForm.role" placeholder="请选择" clearable>
            <el-option v-for="r in roleList" :key="r.id" :label="r.name" :value="r.name" />
          </el-select>
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="queryForm.status" placeholder="请选择" clearable>
            <el-option label="正常" :value="1" />
            <el-option label="禁用" :value="0" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button class="morandi-btn morandi-blue" @click="loadData">查询</el-button>
          <el-button class="btn-reset" @click="resetQuery">重置</el-button>
        </el-form-item>
      </el-form>

      <el-table :data="tableData" border stripe>
        <el-table-column prop="id" label="ID" width="60" />
        <el-table-column prop="username" label="用户名" width="100" />
        <el-table-column prop="realName" label="姓名" width="100" />
        <el-table-column prop="gender" label="性别" width="80" align="center">
          <template #default="{ row }">
            <el-tag v-if="row.gender === '男'" type="primary" size="small">男</el-tag>
            <el-tag v-else-if="row.gender === '女'" type="danger" size="small">女</el-tag>
            <span v-else style="color: #303133; font-size: 14px;">未设置</span>
          </template>
        </el-table-column>
        <el-table-column prop="birthDate" label="出生日期" width="110" />
        <el-table-column prop="phone" label="手机号" width="120" />
        <el-table-column prop="email" label="邮箱" width="180" />
        <el-table-column prop="role" label="角色" width="100">
          <template #default="{ row }">
            <el-tag :type="row.role === 'admin' ? 'danger' : 'success'">{{ row.role || '用户' }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="userType" label="用户类型" width="100">
          <template #default="{ row }">
            <el-tag :type="row.userType === '客户' ? 'warning' : 'primary'" size="small">{{ row.userType || '内部员工' }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="hospital" label="医院名称" min-width="150">
          <template #default="{ row }">
            <span v-if="row.hospital">{{ row.hospital }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
        <el-table-column prop="follower" label="跟进人员" width="100">
          <template #default="{ row }">
            <span v-if="row.follower">{{ row.follower }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
        <el-table-column prop="status" label="状态" width="80">
          <template #default="{ row }">
            <el-tag :type="row.status === 1 ? 'success' : 'danger'">{{ row.status === 1 ? '正常' : '禁用' }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="createTime" label="创建时间" width="170" />
        <el-table-column label="操作" width="180" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link @click="handleEdit(row)">编辑</el-button>
            <el-button type="danger" link @click="handleDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <el-pagination v-model:current-page="queryForm.page" v-model:page-size="queryForm.pageSize" :total="total" :page-sizes="[10,20,50]" layout="total,sizes,prev,pager,next,jumper" @size-change="loadData" @current-change="loadData" style="margin-top:15px" />
    </el-card>

    <el-dialog v-model="dialogVisible" :title="isEdit ? '编辑用户' : '新增用户'" width="500px" @opened="onDialogOpened">
      <el-form ref="formRef" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户名" prop="username">
          <el-input v-model="form.username" :disabled="isEdit" />
        </el-form-item>
        <el-form-item v-if="!isEdit" label="密码" prop="password">
          <el-input v-model="form.password" type="password" show-password />
        </el-form-item>
        <el-form-item v-if="isEdit" label="重置密码">
          <el-input v-model="form.password" type="password" show-password placeholder="留空则不修改密码" />
        </el-form-item>
        <el-form-item label="姓名" prop="realName">
          <el-input v-model="form.realName" />
        </el-form-item>
        <el-form-item label="性别" prop="gender">
          <el-radio-group v-model="form.gender">
            <el-radio value="男">男</el-radio>
            <el-radio value="女">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="出生日期" prop="birthDate">
          <el-date-picker v-model="form.birthDate" type="date" placeholder="选择出生日期" value-format="YYYY-MM-DD" style="width:100%" />
        </el-form-item>
        <el-form-item label="手机号" prop="phone">
          <el-input v-model="form.phone" />
        </el-form-item>
        <el-form-item label="邮箱" prop="email">
          <el-input v-model="form.email" />
        </el-form-item>
        <el-form-item label="角色" prop="role">
          <el-select v-model="form.role" placeholder="请选择角色">
            <el-option v-for="r in roleList" :key="r.id" :label="r.name" :value="r.name" />
          </el-select>
        </el-form-item>
        <el-form-item label="用户类型" prop="userType">
          <el-select v-model="form.userType" placeholder="请选择用户类型">
            <el-option label="内部员工" value="内部员工" />
            <el-option label="客户" value="客户" />
          </el-select>
        </el-form-item>
        <el-form-item v-if="form.userType === '内部员工'" label="人员属性">
          <el-checkbox v-model="form.isShishi" :true-value="1" :false-value="0">实施人员</el-checkbox>
          <el-checkbox v-model="form.isYanfa" :true-value="1" :false-value="0">研发人员</el-checkbox>
        </el-form-item>
        <el-form-item label="医院名称" prop="hospital">
          <el-select v-model="form.hospital" placeholder="请搜索选择医院（客户用户填写）" clearable filterable class="full-width" :filter-method="searchHospitals" @focus="loadHospitals" :loading="hospitalLoading">
            <el-option v-for="h in hospitalList" :key="h.label || h.value" :label="h.label || h.value" :value="h.label || h.value" />
          </el-select>
        </el-form-item>
        <el-form-item label="跟进人员" prop="follower">
          <el-select v-model="form.follower" placeholder="请选择跟进人员（客户用户填写）" clearable>
            <el-option v-for="s in shishiList" :key="s.value || s.label" :label="s.label || s.value" :value="s.value || s.label" />
          </el-select>
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio :value="1">正常</el-radio>
            <el-radio :value="0">禁用</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button class="btn-cancel" @click="dialogVisible = false">取消</el-button>
        <el-button class="morandi-btn morandi-blue" @click="handleSubmit">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted, nextTick } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import axios from 'axios'

const tableData = ref([])
const total = ref(0)
const dialogVisible = ref(false)
const isEdit = ref(false)
const formRef = ref(null)
const roleList = ref([])
const hospitalList = ref([])
const shishiList = ref([])
const hospitalLoading = ref(false)

const queryForm = reactive({ username: '', realName: '', role: '', status: undefined, page: 1, pageSize: 10 })
const form = reactive({ id: null, username: '', password: '', realName: '', gender: '', birthDate: '', phone: '', email: '', role: '', userType: '内部员工', hospital: '', follower: '', isShishi: 0, isYanfa: 0, status: 1 })

const rules = {
  username: [{ required: true, message: '请输入用户名', trigger: 'blur' }],
  password: [{ required: true, message: '请输入密码', trigger: 'blur' }],
  realName: [{ required: true, message: '请输入姓名', trigger: 'blur' }],
  phone: [{ required: true, message: '请输入手机号', trigger: 'blur' }]
}

const onDialogOpened = () => {
  // 对话框打开后，表单已经渲染，formRef 应该可用
  console.log('对话框已打开，formRef:', formRef.value)
}

const loadRoles = async () => {
  try {
    const res = await axios.get('/api/roles/list')
    roleList.value = res.data.data || []
  } catch (e) { console.error('加载角色失败', e) }
}

const loadHospitals = async () => {
  try {
    const res = await axios.get('/api/dict/hospitals')
    hospitalList.value = res.data.data || []
  } catch (e) { console.error('加载医院列表失败', e) }
}

const searchHospitals = async (query) => {
  if (!query) return
  hospitalLoading.value = true
  try {
    const res = await axios.get('/api/dict/hospitals?keyword=' + query)
    hospitalList.value = res.data.data || []
  } catch (e) { console.error('搜索医院失败', e) }
  finally { hospitalLoading.value = false }
}

const loadShishi = async () => {
  try {
    const res = await axios.get('/api/dict/shishi')
    shishiList.value = res.data.data || []
  } catch (e) { console.error('加载跟进人员列表失败', e) }
}

const loadData = async () => {
  try {
    const params = { ...queryForm }
    Object.keys(params).forEach(key => { if (params[key] === '' || params[key] === undefined) delete params[key] })
    const res = await axios.get('/api/user', { params })
    tableData.value = res.data?.data?.list || []
    total.value = res.data?.data?.total || 0
  } catch (err) { console.error('加载用户失败:', err) }
}

const resetQuery = () => { queryForm.username = ''; queryForm.realName = ''; queryForm.role = ''; queryForm.status = undefined; queryForm.page = 1; loadData() }

const handleAdd = () => {
  Object.assign(form, { id: null, username: '', password: '', realName: '', gender: '', birthDate: '', phone: '', email: '', role: '', userType: '内部员工', hospital: '', follower: '', isShishi: 0, isYanfa: 0, status: 1 })
  isEdit.value = false
  dialogVisible.value = true
}

const handleEdit = (row) => { 
  Object.assign(form, { ...row, password: '' })
  isEdit.value = true
  dialogVisible.value = true
}

const handleDelete = async (row) => {
  await ElMessageBox.confirm('确定删除该用户吗?', '提示', { type: 'warning' })
  await axios.delete('/api/user/' + row.id)
  ElMessage.success('删除成功')
  loadData()
}

const handleSubmit = async () => {
  console.log('handleSubmit 被调用，formRef:', formRef.value)
  
  // 如果 formRef 不可用，直接手动验证
  if (!formRef.value) {
    console.warn('formRef 不可用，使用手动验证')
    // 手动验证必填字段
    if (!form.username) { ElMessage.error('请输入用户名'); return }
    if (!isEdit.value && !form.password) { ElMessage.error('请输入密码'); return }
    if (!form.realName) { ElMessage.error('请输入姓名'); return }
    if (!form.phone) { ElMessage.error('请输入手机号'); return }
  } else {
    try {
      await formRef.value.validate()
    } catch (err) {
      console.error('表单验证失败:', err)
      return
    }
  }
  
  try {
    if (isEdit.value) {
      // 创建干净的普通对象，避免响应式代理问题
      const submitData = {
        realName: form.realName,
        gender: form.gender || '',
        birthDate: form.birthDate || '',
        phone: form.phone,
        email: form.email || '',
        role: form.role,
        userType: form.userType || '内部员工',
        hospital: form.hospital || '',
        follower: form.follower || '',
        isShishi: form.isShishi || 0,
        isYanfa: form.isYanfa || 0,
        status: form.status
      }
      // 编辑用户时，如果密码不为空，传递密码字段
      if (form.password) {
        submitData.password = form.password
      }
      await axios.put('/api/user/' + form.id, submitData)
      ElMessage.success('更新成功')
    }
    else { 
      // 创建干净的普通对象，避免响应式代理问题
      const submitData = {
        username: form.username,
        password: form.password,
        realName: form.realName,
        gender: form.gender || '',
        birthDate: form.birthDate || '',
        phone: form.phone,
        email: form.email || '',
        role: form.role,
        userType: form.userType || '内部员工',
        hospital: form.hospital || '',
        follower: form.follower || '',
        isShishi: form.isShishi || 0,
        isYanfa: form.isYanfa || 0,
        status: form.status
      }
      console.log('提交创建用户的数据:', submitData)
      await axios.post('/api/user', submitData)
      ElMessage.success('创建成功')
    }
    dialogVisible.value = false
    loadData()
  } catch (err) { 
    console.error('提交失败:', err)
    ElMessage.error(err.message || '操作失败') 
  }
}

onMounted(() => { loadRoles(); loadHospitals(); loadShishi(); loadData() })
</script>

<style scoped>
.user-manage {
  padding: 0;
  height: 100%;
  display: flex;
  flex-direction: column;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.search-form { margin-bottom: 15px; }

.el-card {
  height: 100%;
  margin-bottom: 0;
  display: flex;
  flex-direction: column;
}

.el-card__body {
  flex: 1;
  overflow: hidden;
  padding: 20px;
  display: flex;
  flex-direction: column;
}

.el-table {
  flex: 1;
  min-height: 0;
}

.el-table__body-wrapper {
  overflow: auto;
}
</style>
