<template>
  <div class="discuss-container">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>问题讨论</span>
          <el-button @click="loadData"><el-icon><Refresh /></el-icon> 刷新</el-button>
        </div>
      </template>
      
      <el-form :inline="true" :model="searchForm">
        <el-form-item label="关键词">
          <el-input v-model="searchForm.keyword" placeholder="搜索问题" clearable @keyup.enter="handleSearch" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleSearch">搜索</el-button>
        </el-form-item>
      </el-form>
      
      <el-table :data="tableData" border v-loading="loading">
        <el-table-column prop="lsh" label="流水号" width="80" />
        <el-table-column prop="yiyuanmc" label="医院" width="150" />
        <el-table-column prop="mokuai" label="模块" width="100" />
        <el-table-column prop="jingjicd" label="紧急程度" width="80">
          <template #default="{ row }">
            <el-tag v-if="row.jingjicd === '紧急'" type="danger" size="small">紧急</el-tag>
            <el-tag v-else-if="row.jingjicd === '急'" type="warning" size="small">急</el-tag>
            <el-tag v-else type="info" size="small">一般</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="wentism" label="问题说明" min-width="200" show-overflow-tooltip />
        <el-table-column prop="xggcs" label="研发人员" width="100" />
        <el-table-column label="操作" width="180" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" size="small" @click="handleCancelDiscuss(row)">取消讨论</el-button>
            <el-button type="success" size="small" @click="handleReturn(row)">返回待处理</el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <el-pagination v-model:current-page="pagination.page" v-model:page-size="pagination.pageSize" :total="pagination.total" layout="total,prev,pager,next" @current-change="loadData" style="margin-top:20px;justify-content:flex-end;" />
    </el-card>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import api from '@/api'

const loading = ref(false)
const tableData = ref([])
const searchForm = reactive({ keyword: '' })
const pagination = reactive({ page: 1, pageSize: 20, total: 0 })

const loadData = async () => {
  loading.value = true
  try {
    const res = await api.get('/feedback/discuss/list', { params: { page: pagination.page, pageSize: pagination.pageSize, keyword: searchForm.keyword } })
    tableData.value = res.list || []
    pagination.total = res.total || 0
  } finally {
    loading.value = false
  }
}

const handleSearch = () => {
  pagination.page = 1
  loadData()
}

const handleCancelDiscuss = async (row) => {
  try {
    await api.put('/feedback/' + row.id + '/discuss', { discuss: false })
    ElMessage.success('已取消讨论')
    loadData()
  } catch (e) {
    ElMessage.error('操作失败')
  }
}

const handleReturn = async (row) => {
  try {
    await ElMessageBox.prompt('请填写意见', '返回待处理', { confirmButtonText: '确定', cancelButtonText: '取消' })
    await api.put('/feedback/' + row.id + '/return', { opinion: '' })
    ElMessage.success('已退回')
    loadData()
  } catch (e) {
    // cancel
  }
}

onMounted(() => {
  loadData()
})
</script>