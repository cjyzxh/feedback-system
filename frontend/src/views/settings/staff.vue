<template>
  <div class="staff-manage">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>人员维护</span>
          <el-checkbox-group v-model="categoryList" @change="loadData">
            <el-checkbox label="实施人员" value="0" />
            <el-checkbox label="研发人员" value="1" />
          </el-checkbox-group>
        </div>
      </template>
      
      <el-button type="primary" @click="handleAdd" style="margin-bottom: 15px">
        新增人员
      </el-button>
      
      <el-table :data="tableData" border stripe>
        <el-table-column prop="id" label="ID" width="60" />
        <el-table-column prop="xingming" label="姓名" width="100" />
        <el-table-column prop="gender" label="性别" width="60">
          <template #default="{ row }">
            {{ row.gender === '男' ? '男' : row.gender === '女' ? '女' : '-' }}
          </template>
        </el-table-column>
        <el-table-column prop="birthDate" label="出生日期" width="120" />
        <el-table-column prop="phone" label="手机号" width="120" />
        <el-table-column prop="email" label="邮箱" width="150" />
        <el-table-column prop="zhiwu" label="职务" width="100" />
        <el-table-column prop="zhuangtai" label="状态" width="80">
          <template #default="{ row }">
            <el-tag :type="row.zhuangtai === 1 ? 'success' : 'danger'">
              {{ row.zhuangtai === 1 ? '正常' : '禁用' }}
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="150" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link @click="handleEdit(row)">编辑</el-button>
            <el-button type="danger" link @click="handleDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    
    <el-dialog v-model="dialogVisible" :title="isEdit ? '编辑人员' : '新增人员'" width="500px">
      <el-form :model="form" :rules="rules" ref="formRef" label-width="80px">
        <el-form-item label="姓名" prop="xingming">
          <el-input v-model="form.xingming" />
        </el-form-item>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="性别" prop="gender">
              <el-select v-model="form.gender" placeholder="请选择">
                <el-option label="男" value="男" />
                <el-option label="女" value="女" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="出生日期" prop="birthDate">
              <el-date-picker v-model="form.birthDate" type="date" placeholder="选择日期" value-format="YYYY-MM-DD" style="width: 100%" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-row :gutter="20">
          <el-col :span="12">
            <el-form-item label="手机号" prop="phone">
              <el-input v-model="form.phone" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="邮箱" prop="email">
              <el-input v-model="form.email" />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item label="类别" prop="category">
          <el-checkbox-group v-model="form.category">
            <el-checkbox label="实施人员" value="0" />
            <el-checkbox label="研发人员" value="1" />
          </el-checkbox-group>
        </el-form-item>
        <el-form-item label="职务" prop="zhiwu">
          <el-input v-model="form.zhiwu" />
        </el-form-item>
        <el-form-item label="状态" prop="zhuangtai">
          <el-radio-group v-model="form.zhuangtai">
            <el-radio :label="1">正常</el-radio>
            <el-radio :label="0">禁用</el-radio>
          </el-radio-group>
        </el-form-item>
      </el-form>
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="handleSubmit">确定</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import axios from 'axios'

const categoryList = ref<string[]>([])
const tableData = ref([])
const dialogVisible = ref(false)
const isEdit = ref(false)
const formRef = ref()

const form = reactive({
  id: null as number | null,
  xingming: '',
  gender: '',
  birthDate: '',
  phone: '',
  email: '',
  zhiwu: '',
  zhuangtai: 1,
  category: [] as string[]
})

const rules = {
  xingming: [{ required: true, message: '请输入姓名', trigger: 'blur' }]
}

const loadData = async () => {
  try {
    const catStr = categoryList.value.join(',')
    const res = await axios.get('/api/staff', { params: { category: catStr } })
    tableData.value = res.data?.list || []
  } catch (err) { console.error('加载失败', err) }
}

const handleAdd = () => {
  Object.assign(form, { id: null, xingming: '', gender: '', birthDate: '', phone: '', email: '', zhiwu: '', zhuangtai: 1, category: [] })
  isEdit.value = false
  dialogVisible.value = true
}

const handleEdit = (row: any) => {
  // Convert category string to array
  const c = row.category || ''
  if (c === '0,1' || c === '1,0') {
    row.category = ['0', '1']
  } else if (c === '0') {
    row.category = ['0']
  } else if (c === '1') {
    row.category = ['1']
  } else {
    row.category = []
  }
  Object.assign(form, row)
  isEdit.value = true
  dialogVisible.value = true
}

const handleDelete = async (row: any) => {
  await ElMessageBox.confirm('确定删除该人员吗?', '提示', { type: 'warning' })
  await axios.delete('/api/staff/' + row.id)
  ElMessage.success('删除成功')
  loadData()
}

const handleSubmit = async () => {
  await formRef.value.validate()
  // Convert category array to string
  const cats = form.category || []
  let catStr = ''
  if (cats.includes('0') && cats.includes('1')) catStr = '0,1'
  else if (cats.includes('0')) catStr = '0'
  else if (cats.includes('1')) catStr = '1'
  
  const data = { ...form, category: catStr }
  if (isEdit.value) {
    await axios.put('/api/staff/' + form.id, data)
    ElMessage.success('更新成功')
  } else {
    await axios.post('/api/staff', data)
    ElMessage.success('创建成功')
  }
  dialogVisible.value = false
  loadData()
}

onMounted(() => { loadData() })
</script>

<style scoped>
.staff-manage {
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
