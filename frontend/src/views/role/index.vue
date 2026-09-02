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
        <el-table-column prop="isAdmin" label="是否管理员" width="100">
          <template #default="{ row }">
            <el-tag :type="row.isAdmin === 1 ? 'danger' : 'info'">
              {{ row.isAdmin === 1 ? '是' : '否' }}
            </el-tag>
          </template>
        </el-table-column>
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

    <el-dialog v-model="dialogVisible" :title="isEdit ? '编辑角色' : '新增角色'" width="600px">
      <el-form ref="formRef" :model="form" :rules="rules" label-width="120px">
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
        <el-form-item label="菜单权限" prop="menuPermissions">
          <el-tree
            ref="menuTreeRef"
            :data="menuTree"
            show-checkbox
            node-key="id"
            :default-checked-keys="checkedMenuKeys"
            :props="{ label: 'label', children: 'children' }"
            style="width: 100%; border: 1px solid #e4e7ed; border-radius: 4px; padding: 10px;"
          />
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
import { ref, reactive, onMounted, nextTick } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { roleApi } from '@/api'

const tableData = ref([])
const total = ref(0)
const dialogVisible = ref(false)
const isEdit = ref(false)
const formRef = ref()
const menuTreeRef = ref()
const checkedMenuKeys = ref([])

// 菜单权限树配置
const menuTree = [
  { id: '/feedback', label: '问题列表' },
  { id: '/test', label: '问题处理' },
  { id: '/testcheck', label: '问题测试' },
  {
    id: '/report',
    label: '数据统计',
    children: [
      { id: '/report', label: '通用统计' },
      { id: '/report/modify-status', label: '修改状态统计' }
    ]
  },
  {
    id: '/settings',
    label: '系统设置',
    children: [
      { id: '/settings', label: '系统管理' },
      { id: '/settings/staff', label: '人员维护' },
      { id: '/settings/user', label: '用户管理' },
      { id: '/settings/role', label: '角色管理' },
      { id: '/settings/module', label: '模块维护' },
      { id: '/settings/form', label: '窗体维护' }
    ]
  }
]

const queryForm = reactive({
  page: 1,
  pageSize: 10
})

const form = reactive({
  id: null,
  name: '',
  description: '',
  viewOthers: 0,
  isAdmin: 0,
  status: 1,
  menuPermissions: ''
})

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
  form.isAdmin = 0
  form.status = 1
  form.menuPermissions = ''
  checkedMenuKeys.value = []
  isEdit.value = false
  dialogVisible.value = true
  nextTick(() => {
    if (menuTreeRef.value) {
      menuTreeRef.value.setCheckedKeys([])
    }
  })
}

const handleEdit = async (row) => {
  const res = await roleApi.getById(row.id)
  const role = res.data.data
  form.id = role.id
  form.name = role.name
  form.description = role.description || ''
  form.viewOthers = role.viewOthers || 0
  form.isAdmin = role.isAdmin || 0
  form.status = role.status
  form.menuPermissions = role.menuPermissions || ''
  
  // 解析已保存的菜单权限
  let permissions = []
  try {
    permissions = role.menuPermissions ? JSON.parse(role.menuPermissions) : []
  } catch(e) {
    permissions = []
  }
  checkedMenuKeys.value = permissions
  
  isEdit.value = true
  dialogVisible.value = true
  
  nextTick(() => {
    if (menuTreeRef.value) {
      menuTreeRef.value.setCheckedKeys(permissions)
    }
  })
}

const handleDelete = async (row) => {
  await ElMessageBox.confirm('确定删除该角色吗?', '提示', { type: 'warning' })
  await roleApi.delete(row.id)
  ElMessage.success('删除成功')
  loadData()
}

const handleSubmit = async () => {
  await formRef.value.validate()
  
  // 获取选中的菜单权限
  const checkedKeys = menuTreeRef.value ? menuTreeRef.value.getCheckedKeys() : []
  const menuPermissionsStr = JSON.stringify(checkedKeys)
  
  const data = {
    name: form.name,
    description: form.description,
    viewOthers: form.viewOthers,
    isAdmin: form.isAdmin,
    status: form.status,
    menuPermissions: menuPermissionsStr
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
