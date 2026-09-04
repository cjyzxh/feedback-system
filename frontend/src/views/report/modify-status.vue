<template>
  <div class="modify-report-container">
    <el-card>
      <template #header>
        <div class="card-header">
          <span><el-icon><DataAnalysis /></el-icon> 修改状态统计</span>
          <el-button @click="loadData"><el-icon><Refresh /></el-icon> 刷新</el-button>
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
          <el-button class="morandi-btn morandi-blue" @click="handleSearch"><el-icon><Search /></el-icon> 查询</el-button>
          <el-button class="btn-reset" @click="handleReset">重置</el-button>
        </el-form-item>
      </el-form>
      
      <!-- 工程师统计表格 -->
      <el-table 
        :data="engineerStats" 
        border 
        stripe 
        style="width: 100%; margin-bottom: 20px;"
        @row-dblclick="handleRowDblclick"
        :row-class-name="tableRowClassName"
      >
        <el-table-column prop="name" label="工程师" width="120" />
        <el-table-column prop="modified" label="已修改" width="100" align="center">
          <template #default="{ row }">
            <span style="color: #67c23a; font-weight: bold;">{{ row.modified }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="pending" label="待修改" width="100" align="center">
          <template #default="{ row }">
            <span style="color: #e6a23c; font-weight: bold;">{{ row.pending }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="testing" label="待测试" width="100" align="center">
          <template #default="{ row }">
            <span style="color: #409eff; font-weight: bold;">{{ row.testing }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="discuss" label="待讨论" width="100" align="center">
          <template #default="{ row }">
            <span style="color: #f56c6c; font-weight: bold;">{{ row.discuss }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="total" label="总数" width="80" align="center" />
        <el-table-column prop="rate" label="修改率" width="100" align="center">
          <template #default="{ row }">
            <el-progress :percentage="row.rate" :stroke-width="12" :color="getRateColor(row.rate)" />
          </template>
        </el-table-column>
        <el-table-column label="操作" width="120" align="center" fixed="right">
          <template #default="{ row }">
            <el-button class="morandi-btn morandi-blue" size="small" @click="viewEngineerProblems(row)">查看问题</el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <!-- 下方标签页 -->
      <el-tabs v-model="activeTab" type="border-card">
        <!-- 标签1：统计图表 -->
        <el-tab-pane label="统计图表" name="chart">
          <div ref="barChartRef" class="chart-container" style="height: 400px;"></div>
        </el-tab-pane>
        
        <!-- 标签2：问题列表 -->
        <el-tab-pane label="问题列表" name="list">
          <div v-if="selectedEngineer" style="margin-bottom: 15px;">
            <el-alert 
              :title="`当前显示工程师【${selectedEngineer}】的所有问题（共 ${problemList.length} 条）`" 
              type="info" 
              :closable="false" 
              show-icon 
            />
          </div>
          <el-table :data="problemList" border stripe style="width: 100%;" max-height="500">
            <el-table-column prop="id" label="问题ID" width="80" align="center" />
            <el-table-column prop="yiyuanmc" label="医院" width="150" show-overflow-tooltip />
            <el-table-column prop="mokuai" label="模块" width="120" show-overflow-tooltip />
            <el-table-column prop="wentism" label="问题说明" min-width="200" show-overflow-tooltip />
            <el-table-column prop="statusText" label="状态" width="100" align="center">
              <template #default="{ row }">
                <el-tag :type="getStatusTagType(row.statusText)" size="small">{{ row.statusText }}</el-tag>
              </template>
            </el-table-column>
            <el-table-column prop="lvrusj" label="录入时间" width="160" align="center">
              <template #default="{ row }">
                {{ formatDate(row.lvrusj) }}
              </template>
            </el-table-column>
            <el-table-column label="操作" width="100" align="center" fixed="right">
              <template #default="{ row }">
                <el-button class="morandi-btn morandi-blue" size="small" @click="viewProblemDetail(row)">问题详情</el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-tab-pane>
      </el-tabs>
    </el-card>
    
    <!-- 问题详情弹窗（复用问题列表的查看页样式） -->
    <el-dialog v-model="detailDialogVisible" title="问题详情" width="900px" top="5vh">
      <div v-if="detailData" class="detail-content">
        <el-descriptions :column="3" border>
          <el-descriptions-item label="问题ID号" :span="1">{{ detailData.id }}</el-descriptions-item>
          <el-descriptions-item label="录入时间" :span="1">{{ formatDate(detailData.lvrusj) }}</el-descriptions-item>
          <el-descriptions-item label="紧急程度" :span="1">
            <el-tag :type="detailData.jingjicd === '紧急' ? 'danger' : detailData.jingjicd === '重要' ? 'warning' : 'info'" size="small">{{ detailData.jingjicd || '一般' }}</el-tag>
          </el-descriptions-item>
          <el-descriptions-item label="软件版本" :span="1">{{ detailData.banben || '-' }}</el-descriptions-item>
          <el-descriptions-item label="医院名称" :span="1">{{ detailData.yiyuanmc || '-' }}</el-descriptions-item>
          <el-descriptions-item label="模块" :span="1">{{ detailData.mokuai || '-' }}</el-descriptions-item>
          <el-descriptions-item label="窗体" :span="1">{{ detailData.chuangtimc || '-' }}</el-descriptions-item>
          <el-descriptions-item label="跟进人员" :span="1">{{ detailData.shishiry || '-' }}</el-descriptions-item>
          <el-descriptions-item label="工程师" :span="1">{{ detailData.xggcs || '-' }}</el-descriptions-item>
          <el-descriptions-item label="问题说明" :span="3">
            <div style="white-space: pre-wrap; line-height: 1.6;">{{ detailData.wentism || '-' }}</div>
          </el-descriptions-item>
          <el-descriptions-item label="处理说明" :span="3">
            <div style="white-space: pre-wrap; line-height: 1.6; color: #67c23a;">{{ detailData.gongcscs || '-' }}</div>
          </el-descriptions-item>
          <el-descriptions-item label="测试意见" :span="3">
            <div style="white-space: pre-wrap; line-height: 1.6; color: #e6a23c;">{{ detailData.shouhoucs || '-' }}</div>
          </el-descriptions-item>
          <el-descriptions-item label="处理时间" :span="1">{{ formatDate(detailData.xgsj) }}</el-descriptions-item>
          <el-descriptions-item label="测试人员" :span="1">{{ detailData.shcsgcs || '-' }}</el-descriptions-item>
          <el-descriptions-item label="测试时间" :span="1">{{ formatDate(detailData.cssj) }}</el-descriptions-item>
        </el-descriptions>
        
        <!-- 问题截图 -->
        <div v-if="detailImages.length > 0" style="margin-top: 20px;">
          <div style="font-weight: bold; margin-bottom: 10px;">问题截图：</div>
          <div class="image-list">
            <div v-for="(img, idx) in detailImages" :key="idx" class="image-item" @click="previewImage(idx)">
              <img :src="getImageUrl(img)" style="width: 100%; height: 100%; object-fit: cover; border-radius: 4px;" />
            </div>
          </div>
        </div>
      </div>
      <template #footer>
        <el-button @click="detailDialogVisible = false">关闭</el-button>
      </template>
    </el-dialog>
    
    <!-- 图片预览弹窗 -->
    <el-dialog v-model="imagePreviewVisible" title="图片预览" width="800px" top="5vh" append-to-body>
      <div style="text-align: center;">
        <img :src="getImageUrl(currentPreviewImage)" style="max-width: 100%; max-height: 70vh;" />
      </div>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted, nextTick } from 'vue'
import { useRouter } from 'vue-router'
import { ElMessage } from 'element-plus'
import { DataAnalysis, Refresh, Search } from '@element-plus/icons-vue'
import axios from 'axios'
import * as echarts from 'echarts'

const router = useRouter()

// 查询条件
const searchForm = reactive({
  startDate: getDefaultDate(30),
  endDate: new Date().toISOString().split('T')[0]
})
const viewAll = ref(false)
const canViewOthers = computed(() => {
  return parseInt(localStorage.getItem('viewOthers') || '0') === 1
})

// 统计数据
const engineerStats = ref<any[]>([])
const allProblems = ref<any[]>([])

// 选中的工程师
const selectedEngineer = ref('')
const problemList = ref<any[]>([])

// 标签页
const activeTab = ref('chart')

// 图表
const barChartRef = ref<HTMLElement>()
let barChart: any = null

// 问题详情
const detailDialogVisible = ref(false)
const detailData = ref<any>(null)
const detailImages = ref<string[]>([])

// 图片预览
const imagePreviewVisible = ref(false)
const currentPreviewImage = ref('')

// 获取默认日期
function getDefaultDate(days: number) {
  const date = new Date()
  date.setDate(date.getDate() - days)
  return date.toISOString().split('T')[0]
}

// 获取当前登录者
function getCurrentUser() {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  return u.realName || u.username || localStorage.getItem('username') || ''
}

// 格式化日期
function formatDate(date: any) {
  if (!date) return '-'
  const d = new Date(date)
  if (isNaN(d.getTime())) return '-'
  const year = d.getFullYear()
  const month = String(d.getMonth() + 1).padStart(2, '0')
  const day = String(d.getDate()).padStart(2, '0')
  const hours = String(d.getHours()).padStart(2, '0')
  const minutes = String(d.getMinutes()).padStart(2, '0')
  const seconds = String(d.getSeconds()).padStart(2, '0')
  return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`
}

// 获取修改率颜色
function getRateColor(rate: number) {
  if (rate >= 80) return '#67c23a'
  if (rate >= 60) return '#409eff'
  if (rate >= 40) return '#e6a23c'
  return '#f56c6c'
}

// 获取状态标签类型
function getStatusTagType(status: string) {
  switch (status) {
    case '已修改': return 'success'
    case '待修改': return 'warning'
    case '待测试': return 'primary'
    case '待讨论': return 'danger'
    default: return 'info'
  }
}

// 获取问题状态文本
function getStatusText(item: any) {
  if (item.taolunbz === 'Y') return '待讨论'
  if (item.gongchengsbz === 'Y' && item.shouhoubz === 'Y') return '已修改'
  if (item.gongchengsbz === 'Y' && item.shouhoubz === 'N') return '待测试'
  return '待修改'
}

// 表格行样式（高亮选中的工程师）
function tableRowClassName({ row }: any) {
  return row.name === selectedEngineer.value ? 'selected-row' : ''
}

// 加载统计数据
const loadData = async () => {
  try {
    const currentUser = getCurrentUser()
    const baseParams: any = {
      page: 1,
      pageSize: 2000,
      startDate: searchForm.startDate || undefined,
      endDate: searchForm.endDate || undefined
    }
    
    let list: any[] = []
    
    if (viewAll.value) {
      // 勾选"查询所有人员"时，先找出类别包含"工程师"的操作员，然后按人循环查询
      // 1. 先查询人员列表，找出类别包含工程师的操作员
      const staffRes = await axios.get('/api/staff')
      const staffData = staffRes.data?.data || staffRes.data || {}
      const staffList = staffData?.list || staffData || []
      const engineerList = staffList.filter((s: any) => 
        s.category && s.category.includes('1') && s.xingming  // category='1'表示研发人员
      )
      const engineerNames = [...new Set(engineerList.map((s: any) => s.xingming))]
      
      // 2. 按人循环查询问题，合并结果
      const allResults = await Promise.all(
        engineerNames.map((name: string) => 
          axios.get('/api/feedback', { params: { ...baseParams, xggcs: name } })
        )
      )
      
      // 3. 合并所有结果并去重
      const merged: any[] = []
      allResults.forEach((res: any) => {
        const data = res.data?.data || res.data || res
        const itemList = data?.list || []
        merged.push(...itemList)
      })
      
      // 按id去重
      const uniqueMap: Record<string, any> = {}
      merged.forEach((item: any) => {
        if (!uniqueMap[item.id]) {
          uniqueMap[item.id] = item
        }
      })
      list = Object.values(uniqueMap)
    } else {
      // 不勾选时，只查询当前用户作为工程师的问题（不管是否有查看非本人数据权限）
      const res = await axios.get('/api/feedback', { params: { ...baseParams, xggcs: currentUser } })
      const data = res.data?.data || res.data || res
      list = data?.list || []
    }
    
    allProblems.value = list
    
    // 按工程师分组统计
    const engineerMap: Record<string, any> = {}
    list.forEach(item => {
      const name = item.xggcs || '未分配'
      if (!engineerMap[name]) {
        engineerMap[name] = {
          name,
          modified: 0,  // 已修改：gongchengsbz='Y' 且 shouhoubz='Y'
          pending: 0,   // 待修改：gongchengsbz='N' 且 taolunbz='N'
          testing: 0,   // 待测试：gongchengsbz='Y' 且 shouhoubz='N'
          discuss: 0,   // 待讨论：taolunbz='Y'
          total: 0,
          rate: 0
        }
      }
      
      const stat = engineerMap[name]
      stat.total++
      
      if (item.taolunbz === 'Y') {
        stat.discuss++
      } else if (item.gongchengsbz === 'Y' && item.shouhoubz === 'Y') {
        stat.modified++
      } else if (item.gongchengsbz === 'Y' && item.shouhoubz === 'N') {
        stat.testing++
      } else {
        stat.pending++
      }
    })
    
    // 计算修改率并转换为数组
    engineerStats.value = Object.values(engineerMap).map((stat: any) => {
      stat.rate = stat.total > 0 ? Math.round((stat.modified / stat.total) * 100) : 0
      return stat
    }).sort((a: any, b: any) => b.total - a.total)
    
    // 渲染图表
    await nextTick()
    renderChart()
    
  } catch (error) {
    console.error('加载统计数据失败:', error)
    ElMessage.error('加载统计数据失败')
  }
}

// 渲染图表
const renderChart = () => {
  if (!barChartRef.value) return
  
  if (!barChart) {
    barChart = echarts.init(barChartRef.value)
  }
  
  const names = engineerStats.value.map(item => item.name)
  const modifiedData = engineerStats.value.map(item => item.modified)
  const pendingData = engineerStats.value.map(item => item.pending)
  const testingData = engineerStats.value.map(item => item.testing)
  const discussData = engineerStats.value.map(item => item.discuss)
  
  const option = {
    tooltip: {
      trigger: 'axis',
      axisPointer: { type: 'shadow' }
    },
    legend: {
      data: ['已修改', '待修改', '待测试', '待讨论'],
      top: 0
    },
    grid: {
      left: '3%',
      right: '4%',
      bottom: '3%',
      containLabel: true
    },
    xAxis: {
      type: 'category',
      data: names,
      axisLabel: { interval: 0, rotate: names.length > 8 ? 30 : 0 }
    },
    yAxis: {
      type: 'value',
      name: '问题数量'
    },
    series: [
      {
        name: '已修改',
        type: 'bar',
        data: modifiedData,
        itemStyle: { color: '#67c23a', borderRadius: [4, 4, 0, 0] },
        barWidth: '15%',
        label: { show: true, position: 'top', fontSize: 11 }
      },
      {
        name: '待修改',
        type: 'bar',
        data: pendingData,
        itemStyle: { color: '#e6a23c', borderRadius: [4, 4, 0, 0] },
        barWidth: '15%',
        label: { show: true, position: 'top', fontSize: 11 }
      },
      {
        name: '待测试',
        type: 'bar',
        data: testingData,
        itemStyle: { color: '#409eff', borderRadius: [4, 4, 0, 0] },
        barWidth: '15%',
        label: { show: true, position: 'top', fontSize: 11 }
      },
      {
        name: '待讨论',
        type: 'bar',
        data: discussData,
        itemStyle: { color: '#f56c6c', borderRadius: [4, 4, 0, 0] },
        barWidth: '15%',
        label: { show: true, position: 'top', fontSize: 11 }
      }
    ]
  }
  
  barChart.setOption(option)
  
  // 点击图表柱子，显示对应工程师的问题
  barChart.off('click')
  barChart.on('click', (params: any) => {
    const engineerName = params.name
    const engineer = engineerStats.value.find(item => item.name === engineerName)
    if (engineer) {
      viewEngineerProblems(engineer)
    }
  })
}

// 双击表格行，查看该工程师的问题
const handleRowDblclick = (row: any) => {
  viewEngineerProblems(row)
}

// 查看工程师的问题
const viewEngineerProblems = (row: any) => {
  selectedEngineer.value = row.name
  problemList.value = allProblems.value
    .filter(item => (item.xggcs || '未分配') === row.name)
    .map(item => ({
      ...item,
      statusText: getStatusText(item)
    }))
    .sort((a: any, b: any) => new Date(b.lvrusj).getTime() - new Date(a.lvrusj).getTime())
  
  activeTab.value = 'list'
  ElMessage.success(`已加载工程师【${row.name}】的 ${problemList.value.length} 条问题`)
}

// 查看问题详情
const viewProblemDetail = async (row: any) => {
  try {
    const res = await axios.get(`/api/feedback/${row.id}`)
    detailData.value = res.data?.data || res.data
    detailImages.value = []
    detailDialogVisible.value = true
    
    // 加载图片
    try {
      const imgRes = await axios.get(`/api/feedback/images/${row.id}`)
      detailImages.value = imgRes.data || []
    } catch (e) {
      console.log('加载图片失败:', e)
    }
  } catch (error) {
    console.error('加载问题详情失败:', error)
    ElMessage.error('加载问题详情失败')
  }
}

// 获取图片URL
function getImageUrl(filename: string) {
  return `/api/feedback/uploads/${filename}`
}

// 预览图片
const previewImage = (idx: number) => {
  currentPreviewImage.value = detailImages.value[idx]
  imagePreviewVisible.value = true
}

// 查询
const handleSearch = () => {
  selectedEngineer.value = ''
  problemList.value = []
  loadData()
}

// 重置
const handleReset = () => {
  searchForm.startDate = getDefaultDate(30)
  searchForm.endDate = new Date().toISOString().split('T')[0]
  viewAll.value = false
  selectedEngineer.value = ''
  problemList.value = []
  loadData()
}

// 窗口大小变化时重绘图表
window.addEventListener('resize', () => {
  if (barChart) {
    barChart.resize()
  }
})

onMounted(() => {
  loadData()
})
</script>

<style scoped>
.modify-report-container { padding: 0; }
.card-header { display: flex; justify-content: space-between; align-items: center; }
.search-form { margin-bottom: 20px; }
.chart-container { width: 100%; }
.detail-content { padding: 10px 0; }
.image-list { display: flex; flex-wrap: wrap; gap: 10px; }
.image-item { width: 120px; height: 120px; border: 1px solid #e4e7ed; border-radius: 4px; cursor: pointer; overflow: hidden; transition: transform 0.2s; }
.image-item:hover { transform: scale(1.05); box-shadow: 0 2px 12px rgba(0,0,0,0.15); }

/* 选中行高亮 */
:deep(.selected-row) {
  background-color: #ecf5ff !important;
}
:deep(.selected-row td) {
  background-color: #ecf5ff !important;
}
</style>
