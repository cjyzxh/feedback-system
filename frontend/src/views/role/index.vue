<template>
  <div class="role-manage">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>角色权限管理</span>
          <el-button type="primary" @click="handleAdd">新增角色</el-button>
        </div>
      </template>

      <el-table :data="tableData" border stripe>
        <el-table-column prop="id" label="ID" width="60" />
        <el-table-column prop="name" label="角色名称" width="150" />
        <el-table-column prop="description" label="描述" />
        <el-table-column prop="viewOthers" label="查看非本人数据" width="120">
          <template #default="{ row }">
            <el-tag :type="row.viewOthers === 1 ? 'success' : 'info'">
              {{ row.viewOthers === 1 ? '允许' : '禁止' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="status" label="状态" width="80">
          <template #default="{ row }">
            <el-tag :type="row.status === 1 ? 'success' : 'danger'">
              {{ row.status === 1 ? '正常' : '禁用' }}
            </el-tag>
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

      <el-pagination
        v-model:current-page="queryForm.page"
        v-model:page-size="queryForm.pageSize"
        :total="total"
        :page-sizes="[10, 20, 50]"
        layout="total, sizes, prev, pager, next, jumper"
        @size-change="loadData"
        @current-change="loadData"
        style="margin-top: 15px"
      />
    </el-card>

    <el-dialog v-model="dialogVisible" :title="isEdit ? '编辑角色' : '新增角色'" width="700px">
      <el-form ref="formRef" :model="form" :rules="rules" label-width="100px">
        <el-form-item label="角色名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入角色名称" />
        </el-form-item>
        <el-form-item label="描述" prop="description">
          <el-input v-model="form.description" type="textarea" :rows="2" />
        </el-form-item>
        <el-form-item label="是否管理员" prop="isAdmin">
          <el-switch v-model="form.isAdmin" :active-value="1" :inactive-value="0" />
        </el-form-item>
        <el-form-item label="查看非本人数据" prop="viewOthers">
          <el-switch v-model="form.viewOthers" :active-value="1" :inactive-value="0" />
        </el-form-item>
        <el-form-item label="状态" prop="status">
          <el-radio-group v-model="form.status">
            <el-radio :value="1">正常</el-radio>
            <el-radio :value="0">禁用</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="页面权限">
          <el-table :data="permissionList" border size="small">
            <el-table-column prop="name" label="页面" width="120" />
            <el-table-column label="查看" width="70">
              <template #default="{ row }">
                <el-checkbox v-model="row.view" />
              </template>
            </el-table-column>
            <el-table-column label="新增" width="70">
              <template #default="{ row }">
                <el-checkbox v-model="row.add" />
              </template>
            </el-table-column>
            <el-table-column label="编辑" width="70">
              <template #default="{ row }">
                <el-checkbox v-model="row.edit" />
              </template>
            </el-table-column>
            <el-table-column label="删除" width="70">
              <template #default="{ row }">
                <el-checkbox v-model="row.delete" />
              </template>
            </el-table-column>
          </el-table>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="handleSubmit">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { roleApi } from '@/api'

const tableData = ref([])
const total = ref(0)
const dialogVisible = ref(false)
const isEdit = ref(false)
const formRef = ref()

const queryForm = reactive({
  page: 1,
  pageSize: 10
})

const permissionOptions = [
  { code: 'feedback', name: '问题反馈' },
  { code: 'test', name: '问题处理' },
  { code: 'testcheck', name: '问题测试' },
  { code: 'user', name: '用户管理' },
  { code: 'role', name: '角色管理' },
  { code: 'settings', name: '系统设置' }
]

const form = reactive({
  id: null,
  name: '',
  description: '',
  viewOthers: 0,
  isAdmin: 0,
  status: 1,
  permissions: []
})

const permissionList = ref(permissionOptions.map(p => ({ ...p, view: false, add: false, edit: false, delete: false })))

const rules = {
  name: [{ required: true, message: '请输入角色名称', trigger: 'blur' }]
}

const loadData = async () => {
  const res = await roleApi.getList(queryForm)
  tableData.value = res.data.data.list || []
  total.value = res.data.data.total || 0
}

const handleAdd = () => {
  form.id = null
  form.name = ''
  form.description = ''
  form.viewOthers = 0
  form.status = 1
  form.permissions = []
  permissionList.value = permissionOptions.map(p => ({ ...p, view: false, add: false, edit: false, delete: false }))
  isEdit.value = false
  dialogVisible.value = true
}

const handleEdit = async (row) => {
  const res = await roleApi.getById(row.id)
  const role = res.data
  form.id = role.id
  form.name = role.name
  form.description = role.description || ''
  form.viewOthers = role.viewOthers || 0
    form.isAdmin = role.isAdmin || 0
  form.status = role.status
  form.permissions = role.permissions || []
  
  const perms = role.permissions || []
  permissionList.value = permissionOptions.map(p => {
    const found = perms.find(x => x.page === p.code)
    return {
      ...p,
      view: found ? true : false,
      add: found ? (found.add || false) : false,
      edit: found ? (found.edit || false) : false,
      delete: found ? (found.delete || false) : false
    }
  })
  
  isEdit.value = true
  dialogVisible.value = true
}

const handleDelete = async (row) => {
  await ElMessageBox.confirm('确定删除该角色吗?', '提示', { type: 'warning' })
  await roleApi.delete(row.id)
  ElMessage.success('删除成功')
  loadData()
}

const handleSubmit = async () => {
  await formRef.value.validate()
  
  const permissions = permissionList.value
    .filter(p => p.view || p.add || p.edit || p.delete)
    .map(p => ({
      page: p.code,
      view: p.view,
      add: p.add,
      edit: p.edit,
      delete: p.delete
    }))
  
  const data = {
    name: form.name,
    description: form.description,
    viewOthers: form.viewOthers,
    isAdmin: form.isAdmin,
    status: form.status,
    permissions
  }
  
  if (isEdit.value) {
    await roleApi.update(form.id, data)
    ElMessage.success('更新成功')
  } else {
    await roleApi.create(data)
    ElMessage.success('创建成功')
  }
  dialogVisible.value = false
  loadData()
}

onMounted(() => {
  loadData()
})
</script>

<style scoped>
.role-manage {
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
