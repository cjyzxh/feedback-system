<template>
  <div class="report-container">
    <el-card>
      <template #header>
        <div class="card-header">
          <span><el-icon><DataAnalysis /></el-icon> 数据统计</span>
          <el-button size="large" class="morandi-btn morandi-blue" @click="loadData"><el-icon><Refresh /></el-icon> 刷新</el-button>
        </div>
      </template>
      
      <!-- 查询条件 -->
      <el-form :inline="true" :model="searchForm" class="search-form">
        <el-form-item label="开始日期">
          <el-date-picker v-model="searchForm.startDate" type="date" placeholder="选择开始日期" value-format="YYYY-MM-DD" style="width:150px" />
        </el-form-item>
        <el-form-item label="结束日期">
          <el-date-picker v-model="searchForm.endDate" type="date" placeholder="选择结束日期" value-format="YYYY-MM-DD" style="width:150px" />
        </el-form-item>
        <el-form-item v-if="canViewOthers">
          <el-checkbox v-model="viewAll">查询所有人员</el-checkbox>
        </el-form-item>
        <el-form-item>
          <el-button size="large" class="morandi-btn morandi-blue" @click="handleSearch"><el-icon><Search /></el-icon> 查询</el-button>
          <el-button size="large" class="morandi-btn morandi-red" @click="handleReset"><el-icon><RefreshLeft /></el-icon> 重置</el-button>
        </el-form-item>
      </el-form>
      
      <!-- 统计概览卡片 -->
      <el-row :gutter="20" class="stat-cards" v-if="statsData.total > 0">
        <el-col :span="6">
          <el-card shadow="hover" class="stat-card total">
            <div class="stat-icon"><el-icon><Document /></el-icon></div>
            <div class="stat-info">
              <div class="stat-num">{{ statsData.total }}</div>
              <div class="stat-label">问题总数</div>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="hover" class="stat-card processed">
            <div class="stat-icon"><el-icon><CircleCheck /></el-icon></div>
            <div class="stat-info">
              <div class="stat-num">{{ statsData.processed }}</div>
              <div class="stat-label">已处理</div>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="hover" class="stat-card pending">
            <div class="stat-icon"><el-icon><Clock /></el-icon></div>
            <div class="stat-info">
              <div class="stat-num">{{ statsData.pending }}</div>
              <div class="stat-label">待处理</div>
            </div>
          </el-card>
        </el-col>
        <el-col :span="6">
          <el-card shadow="hover" class="stat-card rate">
            <div class="stat-icon"><el-icon><TrendCharts /></el-icon></div>
            <div class="stat-info">
              <div class="stat-num">{{ statsData.total ? ((statsData.processed / statsData.total) * 100).toFixed(1) : 0 }}%</div>
              <div class="stat-label">处理率</div>
            </div>
          </el-card>
        </el-col>
      </el-row>
      
      <!-- 图表区域 -->
      <el-row :gutter="20" class="chart-row" v-if="statsData.total > 0">
        <el-col :span="12">
          <el-card shadow="hover">
            <template #header>
              <span class="chart-title">人员问题处理统计</span>
            </template>
            <div ref="barChartRef" class="chart-container"></div>
          </el-card>
        </el-col>
        <el-col :span="12">
          <el-card shadow="hover">
            <template #header>
              <span class="chart-title">问题状态分布</span>
            </template>
            <div ref="pieChartRef" class="chart-container"></div>
          </el-card>
        </el-col>
      </el-row>
      
      <!-- 人员统计表格 -->
      <el-card shadow="hover" class="table-card" v-if="personStats.length > 0">
        <template #header>
          <span class="chart-title">人员处理明细</span>
        </template>
        <el-table :data="personStats" border stripe>
          <el-table-column prop="name" label="姓名" width="100" />
          <el-table-column prop="total" label="问题总数" width="100" align="center" />
          <el-table-column prop="processed" label="已处理" width="100" align="center">
            <template #default="{ row }">
              <el-tag type="success" size="small">{{ row.processed }}</el-tag>
            </template>
          </el-table-column>
          <el-table-column prop="pending" label="待处理" width="100" align="center">
            <template #default="{ row }">
              <el-tag type="warning" size="small">{{ row.pending }}</el-tag>
            </template>
          </el-table-column>
          <el-table-column prop="rate" label="处理率" width="120" align="center">
            <template #default="{ row }">
              <el-progress :percentage="row.rate" :stroke-width="8" />
            </template>
          </el-table-column>
          <el-table-column prop="avgHours" label="平均处理时长(小时)" width="180" align="center" />
        </el-table>
      </el-card>
      
      <!-- 空状态 -->
      <el-empty v-if="!loading && statsData.total === 0" description="暂无统计数据，请调整查询条件后重试" />
    </el-card>
  </div>
</template>

<script setup>
import { ref, reactive, computed, onMounted, nextTick, watch } from 'vue'
import { ElMessage } from 'element-plus'
import { DataAnalysis, Refresh, Search, Document, CircleCheck, Clock, TrendCharts, RefreshLeft } from '@element-plus/icons-vue'
import axios from 'axios'
import * as echarts from 'echarts'

const loading = ref(false)
const barChartRef = ref(null)
const pieChartRef = ref(null)
let barChart = null
let pieChart = null

// 获取当前登录者
const getCurrentUser = () => {
  const userStr = localStorage.getItem('user')
  const user = userStr ? JSON.parse(userStr) : {}
  return user?.realName || user?.username || localStorage.getItem('username') || ''
}

// 判断当前用户是否有"查看非本人数据"权限
const canViewOthers = computed(() => {
  return parseInt(localStorage.getItem('viewOthers') || '0') === 1
})

// 默认日期：最近30天
const getDefaultDate = (days) => {
  const date = new Date()
  date.setDate(date.getDate() - days)
  return date.toISOString().split('T')[0]
}

const searchForm = reactive({
  startDate: getDefaultDate(30),
  endDate: new Date().toISOString().split('T')[0]
})
const viewAll = ref(false)

// 统计数据
const statsData = reactive({
  total: 0,
  processed: 0,
  pending: 0
})

// 人员统计数据
const personStats = ref([])

// 加载数据
const loadData = async () => {
  loading.value = true
  try {
    const currentUser = getCurrentUser()
    const currentUserCode = localStorage.getItem('userCode') || currentUser
    const baseParams = {
      page: 1,
      pageSize: 1000,  // 取足够多的数据进行统计
      startDate: searchForm.startDate || undefined,
      endDate: searchForm.endDate || undefined
    }
    
    let list = []
    
    if (viewAll.value) {
      // 勾选"查询所有人员"时，先找出研发人员（isYanfa=1），再按编码循环查询
      // 1. 从系统人员字典（sys_user）获取研发人员列表（返回 {value:姓名, username:编码}）
      const staffRes = await axios.get('/api/dict/yanfa')
      const staffData = staffRes.data?.data || staffRes.data || {}
      const staffList = staffData?.list || staffData || []
      const engineerList = staffList.filter((s) => s.username)  // 有编码才算有效人员
      const engineerCodes = [...new Set(engineerList.map((s) => s.username))]
      
      // 2. 按人编码循环查询问题，合并结果
      const allResults = await Promise.all(
        engineerCodes.map((code) => 
          axios.get('/api/feedback', { params: { ...baseParams, xggcsBM: code } })
        )
      )
      
      // 3. 合并所有结果并去重
      const merged = []
      allResults.forEach(res => {
        const data = res.data?.data || res.data || res
        const itemList = data?.list || []
        merged.push(...itemList)
      })
      
      // 按id去重
      const uniqueMap = {}
      merged.forEach(item => {
        if (!uniqueMap[item.id]) {
          uniqueMap[item.id] = item
        }
      })
      list = Object.values(uniqueMap)
    } else {
      // 不勾选时，只查询工程师(xggcsBM)为当前用户的问题（这个报表是查研发人员的）
      // 如果当前登录者不是研发人员，就查不到数据
      const res = await axios.get('/api/feedback', { params: { ...baseParams, xggcsBM: currentUserCode } })
      const data = res.data?.data || res.data || res
      list = data?.list || []
    }
    
    // 统计总数据
    statsData.total = list.length
    statsData.processed = list.filter(item => item.gongchengsbz === 'Y').length
    statsData.pending = list.filter(item => item.gongchengsbz === 'N').length
    
    // 按人员统计
    const personMap = {}
    list.forEach(item => {
      const name = item.xggcs || '未分配'
      if (!personMap[name]) {
        personMap[name] = { name, total: 0, processed: 0, pending: 0, hours: [] }
      }
      personMap[name].total++
      if (item.gongchengsbz === 'Y') {
        personMap[name].processed++
        // 计算处理时长（如果有录入时间和修改时间）
        if (item.lvrusj && item.xgsj) {
          const start = new Date(item.lvrusj).getTime()
          const end = new Date(item.xgsj).getTime()
          const hours = (end - start) / (1000 * 60 * 60)
          if (hours > 0 && hours < 720) {  // 排除异常值
            personMap[name].hours.push(hours)
          }
        }
      } else {
        personMap[name].pending++
      }
    })
    
    // 转换为数组并计算处理率和平均时长
    personStats.value = Object.values(personMap).map(p => {
      const avgHours = p.hours.length > 0 
        ? (p.hours.reduce((a, b) => a + b, 0) / p.hours.length).toFixed(1)
        : '-'
      return {
        name: p.name,
        total: p.total,
        processed: p.processed,
        pending: p.pending,
        rate: p.total ? Math.round((p.processed / p.total) * 100) : 0,
        avgHours
      }
    }).sort((a, b) => b.total - a.total)
    
    // 渲染图表
    await nextTick()
    renderCharts()
    
  } catch (err) {
    console.error('加载统计数据失败:', err)
    ElMessage.error('加载统计数据失败')
  } finally {
    loading.value = false
  }
}

// 渲染图表
const renderCharts = () => {
  // 柱状图：人员问题处理统计
  if (barChartRef.value) {
    if (!barChart) {
      barChart = echarts.init(barChartRef.value)
    }
    const names = personStats.value.map(p => p.name)
    const processedData = personStats.value.map(p => p.processed)
    const pendingData = personStats.value.map(p => p.pending)
    
    barChart.setOption({
      tooltip: { trigger: 'axis', axisPointer: { type: 'shadow' } },
      legend: { data: ['已处理', '待处理'], bottom: 0 },
      grid: { left: '3%', right: '4%', bottom: '15%', containLabel: true },
      xAxis: { type: 'category', data: names, axisLabel: { rotate: 30 } },
      yAxis: { type: 'value', name: '问题数' },
      series: [
        {
          name: '已处理',
          type: 'bar',
          data: processedData,
          itemStyle: { color: '#67c23a', borderRadius: [4, 4, 0, 0] },
          barWidth: '30%'
        },
        {
          name: '待处理',
          type: 'bar',
          data: pendingData,
          itemStyle: { color: '#e6a23c', borderRadius: [4, 4, 0, 0] },
          barWidth: '30%'
        }
      ]
    })
  }
  
  // 饼图：问题状态分布
  if (pieChartRef.value) {
    if (!pieChart) {
      pieChart = echarts.init(pieChartRef.value)
    }
    
    pieChart.setOption({
      tooltip: { trigger: 'item', formatter: '{b}: {c} ({d}%)' },
      legend: { bottom: 0 },
      series: [
        {
          name: '问题状态',
          type: 'pie',
          radius: ['40%', '70%'],
          avoidLabelOverlap: false,
          itemStyle: { borderRadius: 10, borderColor: '#fff', borderWidth: 2 },
          label: { show: true, formatter: '{b}\n{d}%' },
          emphasis: { label: { show: true, fontSize: 16, fontWeight: 'bold' } },
          data: [
            { value: statsData.processed, name: '已处理', itemStyle: { color: '#67c23a' } },
            { value: statsData.pending, name: '待处理', itemStyle: { color: '#e6a23c' } }
          ]
        }
      ]
    })
  }
}

// 窗口大小变化时重新渲染图表
window.addEventListener('resize', () => {
  if (barChart) barChart.resize()
  if (pieChart) pieChart.resize()
})

const handleSearch = () => {
  if (!searchForm.startDate || !searchForm.endDate) {
    ElMessage.warning('请选择开始日期和结束日期')
    return
  }
  if (searchForm.startDate > searchForm.endDate) {
    ElMessage.warning('开始日期不能大于结束日期')
    return
  }
  loadData()
}

const handleReset = () => {
  searchForm.startDate = getDefaultDate(30)
  searchForm.endDate = new Date().toISOString().split('T')[0]
  viewAll.value = false
  loadData()
}

onMounted(() => {
  loadData()
})
</script>

<style scoped>
.report-container { padding: 0; }
.card-header { display: flex; justify-content: space-between; align-items: center; }
.card-header span { display: flex; align-items: center; gap: 8px; font-weight: 600; font-size: 16px; }
.search-form { margin-bottom: 20px; }

.stat-cards { margin-bottom: 20px; }
.stat-card { display: flex; align-items: center; padding: 10px; }
.stat-card .stat-icon {
  width: 50px; height: 50px; border-radius: 10px;
  display: flex; align-items: center; justify-content: center;
  font-size: 24px; color: #fff; margin-right: 15px;
}
.stat-card.total .stat-icon { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); }
.stat-card.processed .stat-icon { background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%); }
.stat-card.pending .stat-icon { background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%); }
.stat-card.rate .stat-icon { background: linear-gradient(135deg, #4facfe 0%, #00f2fe 100%); }
.stat-info { flex: 1; }
.stat-num { font-size: 28px; font-weight: bold; color: #303133; }
.stat-label { font-size: 13px; color: #909399; margin-top: 4px; }

.chart-row { margin-bottom: 20px; }
.chart-title { font-weight: 600; color: #303133; }
.chart-container { width: 100%; height: 350px; }

.table-card { margin-top: 0; }
</style>
