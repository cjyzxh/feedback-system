<template>
  <div class="template-maintenance">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>模板维护</span>
        </div>
      </template>

      <div class="main-body">
        <!-- 左侧树形结构：模板类型 -->
        <div class="tree-panel">
          <el-tree
            ref="treeRef"
            :data="treeData"
            :props="{ label: 'label', children: 'children' }"
            node-key="id"
            highlight-current
            :default-expanded-keys="['all']"
            :expand-on-click-node="false"
            @node-click="handleNodeClick"
            class="dict-tree"
          />
        </div>

        <!-- 右侧：编辑区 + 列表 -->
        <div class="table-panel">
          <!-- 编辑区 -->
          <div class="edit-panel">
            <div class="edit-row">
              <el-radio-group v-model="form.fw" size="large">
                <el-radio-button value="个人">个人</el-radio-button>
                <el-radio-button value="公用">公用</el-radio-button>
              </el-radio-group>
              <span class="edit-tip">{{ editingId ? '正在编辑：' + form.lx + '（' + form.fw + '）' : '新增模板：' + form.lx }}</span>
            </div>
            <div class="edit-row">
              <el-input
                v-model="form.nr"
                type="textarea"
                :rows="3"
                :placeholder="'请输入' + form.lx + '模板内容...'"
              />
            </div>
            <div class="edit-row">
              <el-button size="large" class="morandi-btn morandi-blue" @click="handleSave"><el-icon><Check /></el-icon>{{ editingId ? '更新' : '保存' }}</el-button>
              <el-button size="large" class="morandi-btn morandi-red" @click="handleClear"><el-icon><Delete /></el-icon>清空</el-button>
            </div>
          </div>

          <!-- 列表 -->
          <el-table v-loading="loading" :data="list" style="width: 100%" max-height="520">
            <el-table-column prop="moBanNR" label="模板内容" min-width="220" />
            <el-table-column prop="moBanFW" label="范围" width="70" />
            <el-table-column prop="createUserName" label="创建人" width="110">
              <template #default="scope">
                {{ scope.row.createUserName || scope.row.createUser }}
              </template>
            </el-table-column>
            <el-table-column prop="createTime" label="创建时间" width="160">
              <template #default="scope">
                {{ formatTime(scope.row.createTime) }}
              </template>
            </el-table-column>
            <el-table-column label="操作" width="130" fixed="right">
              <template #default="scope">
                <template v-if="canEdit(scope.row)">
                  <el-button size="small" @click="handleEdit(scope.row)">编辑</el-button>
                  <el-button size="small" type="danger" @click="handleDelete(scope.row.id)">删除</el-button>
                </template>
              </template>
            </el-table-column>
          </el-table>

          <div class="pagination-container" v-if="total > 0">
            <el-pagination
              v-model:current-page="currentPage"
              v-model:page-size="pageSize"
              :page-sizes="[10, 20, 50, 100]"
              layout="total, sizes, prev, pager, next, jumper"
              :total="total"
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
            />
          </div>
        </div>
      </div>
    </el-card>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import axios from 'axios'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Check, Delete } from '@element-plus/icons-vue'

const loading = ref(false)
const list = ref<any[]>([])
const total = ref(0)
const currentPage = ref(1)
const pageSize = ref(10)

const treeRef = ref<any>(null)
const treeData = ref<any[]>([
  { id: 'all', label: '全部模板', children: [
    { id: '测试意见', label: '测试意见' },
    { id: '处理意见', label: '处理意见' },
    { id: '测试结果', label: '测试结果' },
  ]}
])

const form = reactive({
  lx: '测试意见',
  fw: '个人',
  nr: ''
})
const editingId = ref<number | null>(null)

// 当前登录用户编码与管理员状态
let userCode = localStorage.getItem('userCode') || ''
if (!userCode) {
  try { userCode = JSON.parse(localStorage.getItem('user') || '{}').username || '' } catch (e) { userCode = '' }
}
const loginName = localStorage.getItem('username') || ''
let isAdmin = false
try {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  isAdmin = u.isAdmin === 1 || localStorage.getItem('isSuperAdmin') === '1' || userCode === 'admin'
} catch (e) {
  isAdmin = localStorage.getItem('isSuperAdmin') === '1' || userCode === 'admin'
}

// 节点点击：切换类型并加载列表
const handleNodeClick = (node: any) => {
  if (node.id !== 'all' && !node.children) {
    form.lx = node.id
    editingId.value = null
    form.nr = ''
    currentPage.value = 1
    loadList()
  }
}

// 加载列表（显示当前类型下全部模板：公用 + 个人）
const loadList = async () => {
  loading.value = true
  try {
    const res: any = await axios.get('/api/template', {
      params: { lx: form.lx, currentUser: userCode }
    })
    const data = res.data?.data || res.data || []
    // 前端分页
    total.value = data.length
    const start = (currentPage.value - 1) * pageSize.value
    list.value = data.slice(start, start + pageSize.value)
  } catch (e) {
    ElMessage.error('加载模板列表失败')
  } finally {
    loading.value = false
  }
}

// 保存/更新
const handleSave = async () => {
  if (!form.nr.trim()) {
    ElMessage.warning('请输入模板内容')
    return
  }
  try {
    if (editingId.value) {
      await axios.put('/api/template/' + editingId.value, { nr: form.nr, currentUser: userCode })
      ElMessage.success('模板已更新')
    } else {
      await axios.post('/api/template', { lx: form.lx, fw: form.fw, nr: form.nr, currentUser: userCode, currentUserName: loginName })
      ElMessage.success('模板已保存')
    }
    editingId.value = null
    form.nr = ''
    loadList()
  } catch (e: any) {
    ElMessage.error(e?.response?.data?.message || '保存失败')
  }
}

// 清空
const handleClear = () => {
  editingId.value = null
  form.nr = ''
}

// 编辑（本人或管理员）
const handleEdit = (row: any) => {
  editingId.value = row.id
  form.lx = row.moBanLX
  form.fw = row.moBanFW
  form.nr = row.moBanNR
}

// 删除（本人或管理员）
const handleDelete = async (id: number) => {
  try {
    await ElMessageBox.confirm('确定删除该模板吗？', '提示', { type: 'warning' })
  } catch (e) {
    return
  }
  try {
    await axios.delete('/api/template/' + id, { params: { currentUser: userCode } })
    ElMessage.success('模板已删除')
    loadList()
  } catch (e: any) {
    ElMessage.error(e?.response?.data?.message || '删除失败')
  }
}

// 是否可编辑/删除：本人 或 管理员
const canEdit = (row: any) => {
  return row.createUser === userCode || isAdmin
}

const formatTime = (t: string) => {
  if (!t) return ''
  const d = new Date(t)
  const p = (n: number) => String(n).padStart(2, '0')
  return d.getFullYear() + '-' + p(d.getMonth() + 1) + '-' + p(d.getDate()) + ' ' + p(d.getHours()) + ':' + p(d.getMinutes()) + ':' + p(d.getSeconds())
}

const handleSizeChange = (v: number) => { pageSize.value = v; currentPage.value = 1; loadList() }
const handleCurrentChange = (v: number) => { currentPage.value = v; loadList() }

onMounted(() => {
  loadList()
})
</script>

<style scoped>
.template-maintenance .main-body {
  display: flex;
  gap: 12px;
  align-items: flex-start;
}
.template-maintenance .tree-panel {
  width: 160px;
  flex-shrink: 0;
  border: 1px solid var(--el-border-color);
  border-radius: 6px;
  padding: 8px;
  min-height: 400px;
}
.template-maintenance .table-panel {
  flex: 1;
  min-width: 0;
  overflow-x: hidden;
}
.template-maintenance .edit-panel {
  margin-bottom: 12px;
  padding: 12px;
  border: 1px solid var(--el-border-color);
  border-radius: 6px;
}
.template-maintenance .edit-row {
  display: flex;
  align-items: center;
  gap: var(--qgap);
  margin-bottom: 8px;
}
.template-maintenance .edit-row:last-child {
  margin-bottom: 0;
}
.template-maintenance .edit-row .el-button {
  min-width: 110px;
  margin-left: 0 !important;
  margin-right: var(--qgap) !important;
}
.template-maintenance .edit-tip {
  font-size: 13px;
  color: var(--el-text-color-secondary);
}
.template-maintenance .pagination-container {
  margin-top: 10px;
  display: flex;
  justify-content: flex-end;
}
</style>
