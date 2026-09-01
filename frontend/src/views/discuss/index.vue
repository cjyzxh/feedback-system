<template>
  <div class="discuss-container">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>问题讨论</span>
          <el-button @click="loadData"><el-icon><Refresh /></el-icon> 刷新</el-button>
        </div>
      </template>
      
      <el-form :inline="true" :model="searchForm" class="search-form">
        <el-form-item label="医院">
          <el-select v-model="searchForm.yiyuanmc" placeholder="请搜索选择" filterable clearable style="width:180px" :filter-method="searchHospitals" @focus="loadHospitals" :loading="hospitalLoading" @change="handleSearch">
            <el-option v-for="h in hospitals" :key="h.label" :label="h.label" :value="h.label" />
          </el-select>
        </el-form-item>
        <el-form-item label="模块">
          <el-select v-model="searchForm.mokuai" placeholder="请选择" clearable style="width:130px" @change="handleSearch">
            <el-option v-for="m in modules" :key="m.value" :label="m.label" :value="m.label" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleSearch"><el-icon><Search /></el-icon> 搜索</el-button>
          <el-button @click="handleResetSearch">重置</el-button>
        </el-form-item>
      </el-form>
      
      <el-table :data="tableData" border v-loading="loading" stripe>
        <el-table-column prop="id" label="问题ID号" width="90" />
        <el-table-column prop="yiyuanmc" label="医院名称" width="150" />
        <el-table-column prop="mokuai" label="模块" width="100" />
        <el-table-column prop="chuangtimc" label="窗体" width="100" />
        <el-table-column prop="jingjicd" label="紧急程度" width="80">
          <template #default="{ row }">
            <el-tag v-if="row.jingjicd === '紧急'" type="danger" size="small">紧急</el-tag>
            <el-tag v-else-if="row.jingjicd === '急'" type="warning" size="small">急</el-tag>
            <el-tag v-else type="info" size="small">一般</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="wentism" label="问题说明" min-width="200" show-overflow-tooltip />
        <el-table-column prop="xggcs" label="工程师" width="80" />
        <el-table-column prop="shishiry" label="跟进人" width="80" />
        <el-table-column prop="lvrusj" label="录入时间" width="160" />
        <el-table-column label="操作" width="200" fixed="right">
          <template #default="{ row }">
            <el-button type="success" size="small" @click="handleReturn(row)">返回待处理</el-button>
            <el-button type="danger" size="small" @click="handleDelete(row)">删除问题</el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <el-pagination v-model:current-page="pagination.page" v-model:page-size="pagination.pageSize" :total="pagination.total" :page-sizes="[10,20,50,100]" layout="total,sizes,prev,pager,next,jumper" @size-change="loadData" @current-change="loadData" style="margin-top:20px;justify-content:flex-end;" />
    </el-card>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Search, Refresh } from '@element-plus/icons-vue'
import axios from 'axios'

const loading = ref(false)
const tableData = ref([])
const hospitals = ref([])
const modules = ref([])
const hospitalLoading = ref(false)
const searchForm = reactive({ yiyuanmc: '', mokuai: '' })
const pagination = reactive({ page: 1, pageSize: 20, total: 0 })

// 搜索医院（支持拼音码检索）
const searchHospitals = async (query) => {
  if (!query) return
  hospitalLoading.value = true
  try {
    const res = await axios.get('/api/dict/hospitals?keyword=' + query)
    hospitals.value = res.data.data || []
  } catch (err) { console.error('搜索医院失败:', err) }
  finally { hospitalLoading.value = false }
}

// 加载医院列表
const loadHospitals = async () => {
  if (hospitals.value.length > 0) return
  try {
    const res = await axios.get('/api/dict/hospitals')
    hospitals.value = res.data.data || []
  } catch (err) { console.error('加载医院失败:', err) }
}

// 加载模块列表
const loadModules = async () => {
  try {
    const res = await axios.get('/api/dict/modules')
    modules.value = res.data.data || []
  } catch (err) { console.error('加载模块失败:', err) }
}

// 加载数据（查询 taolunbz='Y' 的待讨论问题）
const loadData = async () => {
  loading.value = true
  try {
    const params = {
      page: pagination.page,
      pageSize: pagination.pageSize,
      taolunbz: 'Y',  // 只查询待讨论的问题
      yiyuanmc: searchForm.yiyuanmc || undefined,
      mokuai: searchForm.mokuai || undefined
    }
    const res = await axios.get('/api/feedback', { params })
    const data = res.data?.data || res.data || res
    tableData.value = (data?.list || []).map((item) => ({
      ...item,
      yiyuanmc: item.yiyuanmc || item.hospital,
      mokuai: item.mokuai || item.module
    }))
    pagination.total = data?.total || 0
  } catch (err) { console.error('加载列表失败:', err) }
  finally { loading.value = false }
}

const handleSearch = () => {
  pagination.page = 1
  loadData()
}

const handleResetSearch = () => {
  searchForm.yiyuanmc = ''
  searchForm.mokuai = ''
  handleSearch()
}

// 返回待处理：将 gongchengsbz 修改为 N，将 taolunbz 修改为 N
const handleReturn = async (row) => {
  try {
    await ElMessageBox.confirm('确定要将该问题返回待处理吗？返回后工程师可以重新处理。', '返回待处理', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await axios.put('/api/feedback/' + row.id, { gongchengsbz: 'N', taolunbz: 'N' })
    ElMessage.success('已返回待处理')
    loadData()
  } catch (e) {
    if (e !== 'cancel') ElMessage.error('操作失败')
  }
}

// 删除问题
const handleDelete = async (row) => {
  try {
    await ElMessageBox.confirm(`确定要删除问题 ID=${row.id} 吗？删除后不可恢复。`, '删除确认', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await axios.delete('/api/feedback/' + row.id)
    ElMessage.success('删除成功')
    loadData()
  } catch (e) {
    if (e !== 'cancel') ElMessage.error('删除失败')
  }
}

onMounted(() => {
  loadHospitals()
  loadModules()
  loadData()
})
</script>

<style scoped>
.discuss-container { padding: 0; }
.card-header { display: flex; justify-content: space-between; align-items: center; }
.search-form { margin-bottom: 20px; }
</style>
