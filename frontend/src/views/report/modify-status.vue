<template>
  <div class="modify-report-container">
    <el-card>
      <template #header>
        <div class="card-header">
          <span><el-icon><DataAnalysis /></el-icon> 问题分析</span>
          <el-button size="large" class="morandi-btn morandi-blue" @click="loadData"><el-icon><Refresh /></el-icon> 刷新</el-button>
        </div>
      </template>
      
      <!-- 查询条件：人员类别 + 查询所有人员（无日期，默认全部问题） -->
      <el-form :inline="true" class="search-form">
        <el-form-item label="人员类别">
          <el-select v-model="category" style="width: 140px;">
            <el-option v-for="c in categories" :key="c.value" :label="c.label" :value="c.value" />
          </el-select>
        </el-form-item>
        <el-form-item v-if="canViewOthers">
          <el-checkbox v-model="viewAll">查询所有人员</el-checkbox>
        </el-form-item>
        <el-form-item>
          <el-button size="large" class="morandi-btn morandi-blue" @click="handleSearch"><el-icon><Search /></el-icon> 查询</el-button>
          <el-button size="large" class="morandi-btn morandi-red" @click="handleReset"><el-icon><RefreshLeft /></el-icon> 重置</el-button>
        </el-form-item>
      </el-form>
      
      <!-- 人员统计表格（列名随类别动态变化） -->
      <el-table 
        :data="personStats" 
        border 
        stripe 
        style="width: 100%; margin-bottom: 20px;"
        @row-click="handleRowClick"
        @row-dblclick="handleRowDblclick"
        :row-class-name="tableRowClassName"
      >
        <el-table-column :label="categoryLabel" width="120">
          <template #default="{ row }">{{ row.name }}</template>
        </el-table-column>
        <el-table-column prop="modified" label="已完成" width="100" align="center">
          <template #default="{ row }">
            <span style="color: #67c23a; font-weight: bold;">{{ row.modified }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="pending" label="待处理" width="100" align="center">
          <template #default="{ row }">
            <span style="color: #e6a23c; font-weight: bold;">{{ row.pending }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="yifanhui" label="已返回" width="100" align="center">
          <template #default="{ row }">
            <span style="color: #909399; font-weight: bold;">{{ row.yifanhui }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="queeren" label="待确认" width="100" align="center">
          <template #default="{ row }">
            <span style="color: #9c27b0; font-weight: bold;">{{ row.queeren }}</span>
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
        <el-table-column :label="rateLabel" width="100" align="center">
          <template #default="{ row }">
            <el-progress :percentage="row.rate" :stroke-width="12" :color="getRateColor(row.rate)" />
          </template>
        </el-table-column>
        <el-table-column :label="avgLabel" width="150" align="center">
          <template #default="{ row }">
            <span v-if="row.avgHours !== '-'">{{ row.avgHours }} h</span>
            <span v-else>-</span>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="120" align="center" fixed="right">
          <template #default="{ row }">
            <el-button class="morandi-btn morandi-blue" size="small" @click="viewPersonProblems(row)">查看问题</el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <!-- 下方标签页 -->
      <el-tabs v-model="activeTab" type="border-card" @tab-click="handleTabClick">
        <!-- 标签1：统计图表 -->
        <el-tab-pane label="统计图表" name="chart">
          <div ref="barChartRef" class="chart-container" style="height: 400px;"></div>
        </el-tab-pane>
        
        <!-- 标签2：问题列表 -->
        <el-tab-pane label="问题列表" name="list">
          <div v-if="selectedName" style="margin-bottom: 15px;">
            <el-alert 
              :title="`当前显示${categoryLabel}【${selectedName}】的所有问题（共 ${problemList.length} 条）`" 
              type="info" 
              :closable="false" 
              show-icon 
            />
          </div>
          <el-table :data="problemList" border stripe style="width: 100%;" max-height="500">
            <el-table-column prop="id" label="问题ID" width="80" align="center" />
            <el-table-column prop="yiyuanmc" label="医院" width="300" />
            <el-table-column prop="mokuai" label="模块" width="120" />
            <el-table-column prop="wentism" label="问题说明" min-width="100" />
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
        <el-button size="large" class="morandi-btn morandi-red" @click="detailDialogVisible = false"><el-icon><Close /></el-icon> 关闭</el-button>
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
import { ref, reactive, computed, onMounted, onBeforeUnmount, nextTick } from 'vue'
import { ElMessage } from 'element-plus'
import { DataAnalysis, Refresh, Search, RefreshLeft, Close } from '@element-plus/icons-vue'
import axios from 'axios'
import * as echarts from 'echarts'

// 人员类别配置：编码字段 / 姓名字段 / 率列名 / 平均时长列名与口径
const categories = [
  { value: 'gengjin', label: '跟进人', codeField: 'shishiryBM', nameField: 'shishiry', rateLabel: '处理率', avgLabel: '平均处理时长' },
  { value: 'chuli',   label: '处理人', codeField: 'xggcsBM',   nameField: 'xggcs',   rateLabel: '修改率', avgLabel: '平均修改时长' },
  { value: 'ceshi',   label: '测试人', codeField: 'szcsgcsBM', nameField: 'szcsgcs', rateLabel: '测试率', avgLabel: '平均测试时长' },
  { value: 'fanhui',  label: '返回人', codeField: 'shcsgcsBM', nameField: 'shcsgcs', rateLabel: '返回率', avgLabel: '平均返回时长', filter: (i: any) => i.fanhuisj != null && i.shouhoubz === 'N' }
]

const category = ref('chuli')
const curCat = computed(() => categories.find(c => c.value === category.value) || categories[1])
const categoryLabel = computed(() => curCat.value.label)
const rateLabel = computed(() => curCat.value.rateLabel)
const avgLabel = computed(() => curCat.value.avgLabel)

const viewAll = ref(false)
const canViewOthers = computed(() => {
  return parseInt(localStorage.getItem('viewOthers') || '0') === 1
})

// 统计数据
const personStats = ref<any[]>([])
const allProblems = ref<any[]>([])

// 选中的人员
const selectedName = ref('')
const selectedCode = ref('')       // 单击选中的人员编码（图表只显示该行）
const selectedPerson = ref<any>(null)   // 单击/双击记录的完整人员行对象（点问题列表标签时直接加载）
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

// 获取率颜色
function getRateColor(rate: number) {
  if (rate >= 80) return '#67c23a'
  if (rate >= 60) return '#409eff'
  if (rate >= 40) return '#e6a23c'
  return '#f56c6c'
}

// 获取状态标签类型
function getStatusTagType(status: string) {
  switch (status) {
    case '已完成': return 'success'
    case '待处理': return 'warning'
    case '待测试': return 'primary'
    case '待讨论': return 'danger'
    default: return 'info'
  }
}

// 获取问题状态文本
function getStatusText(item: any) {
  if (item.taolunbz === 'Y') return '待讨论'
  if (item.gongchengsbz === 'Y' && item.shouhoubz === 'Y') return '已完成'
  if (item.gongchengsbz === 'Y' && item.shouhoubz === 'N') return '待测试'
  return '待处理'
}

// 表格行样式（高亮选中的行：单击选中的行 或 双击查看问题的行）
function tableRowClassName({ row }: any) {
  return (row.name === selectedName.value || row.code === selectedCode.value) ? 'selected-row' : ''
}

// 计算单条问题的平均时长（按类别口径），无效返回 null
function calcHours(cfg: any, item: any): number | null {
  let start: any, end: any
  if (cfg.value === 'gengjin') { start = item.lvrusj; end = item.cssj }
  else if (cfg.value === 'chuli') { start = item.lvrusj; end = item.xgsj }
  else if (cfg.value === 'ceshi') { start = item.xgsj; end = item.cssj }
  else if (cfg.value === 'fanhui') { start = item.xgsj; end = item.fanhuisj }
  if (!start || !end) return null
  const h = (new Date(end).getTime() - new Date(start).getTime()) / 3600000
  return (h > 0 && h < 720) ? h : null
}

// 判断状态所属列：处理人视角 gongchengsbz=Y&shouhoubz=N 为"待确认"，其余视角为"待测试"
function getStateKey(cfg: any, item: any): string {
  if (item.taolunbz === 'Y') return 'discuss'
  if (item.gongchengsbz === 'Y' && item.shouhoubz === 'Y') return 'modified'
  if (item.gongchengsbz === 'Y' && item.shouhoubz === 'N') return cfg.value === 'chuli' ? 'queeren' : 'testing'
  if (item.gongchengsbz === 'N' && item.fanhuisj != null) return 'yifanhui'
  return 'pending'
}

// 加载统计数据（默认全部问题，无日期条件）
const loadData = async () => {
  try {
    const cfg = curCat.value
    const currentUserCode = localStorage.getItem('userCode') || getCurrentUser()
    
    // 一次拉全量（无日期/无人员过滤），前端按类别分组统计
    const res = await axios.get('/api/feedback', { params: { page: 1, pageSize: 5000 } })
    const data = res.data?.data || res.data || res
    const all = data?.list || []
    allProblems.value = all
    
    // 类别过滤（如返回人只统计 fanhuisj 非空且 shouhoubz='N'）
    let items = cfg.filter ? all.filter(cfg.filter) : all
    
    // 不勾"查询所有人员"时只统计当前登录者
    if (!viewAll.value) {
      items = items.filter(i => (i[cfg.codeField] || '') === currentUserCode)
    }
    
    // 按人员编码分组统计
    const personMap: Record<string, any> = {}
    items.forEach(item => {
      const code = item[cfg.codeField]
      if (!code) return
      if (!personMap[code]) {
        personMap[code] = {
          code,
          name: item[cfg.nameField] || code,
          modified: 0,
          pending: 0,
          yifanhui: 0,
          queeren: 0,
          testing: 0,
          discuss: 0,
          total: 0,
          rate: 0,
          hours: [] as number[]
        }
      }
      const stat = personMap[code]
      stat[getStateKey(cfg, item)]++
      const h = calcHours(cfg, item)
      if (h !== null) stat.hours.push(h)
    })
    
    // 计算总数、率、平均时长
    personStats.value = Object.values(personMap)
      .filter((stat: any) => stat.name)
      .map((stat: any) => {
        stat.total = stat.modified + stat.pending + stat.yifanhui + stat.queeren + stat.testing + stat.discuss
        const denom = stat.modified + stat.pending + stat.yifanhui + stat.queeren + stat.testing
        stat.rate = denom > 0 ? Math.round(((stat.modified + stat.queeren) / denom) * 100) : 0
        stat.avgHours = stat.hours.length > 0
          ? (stat.hours.reduce((a: number, b: number) => a + b, 0) / stat.hours.length).toFixed(1)
          : '-'
        return stat
      })
      .sort((a: any, b: any) => b.total - a.total)
    
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
  
  // 单击选中某行时，图表只显示该行人员的统计
  const displayStats = selectedCode.value
    ? personStats.value.filter((item: any) => item.code === selectedCode.value)
    : personStats.value
  
  const names = displayStats.map((item: any) => item.name)
  const seriesMap: any = {
    modified: '已完成',
    pending: '待处理',
    yifanhui: '已返回',
    queeren: '待确认',
    testing: '待测试',
    discuss: '待讨论'
  }
  const colorMap: any = {
    modified: '#67c23a',
    pending: '#e6a23c',
    yifanhui: '#909399',
    queeren: '#9c27b0',
    testing: '#409eff',
    discuss: '#f56c6c'
  }

  barChart.setOption({
    tooltip: { trigger: 'axis', axisPointer: { type: 'shadow' } },
    legend: { data: Object.values(seriesMap), top: 0 },
    grid: { left: '3%', right: '4%', bottom: '3%', containLabel: true },
    xAxis: { type: 'category', data: names, axisLabel: { interval: 0, rotate: names.length > 8 ? 30 : 0 } },
    yAxis: { type: 'value', name: '问题数量' },
    series: Object.keys(seriesMap).map(key => ({
      name: seriesMap[key],
      type: 'bar',
      data: displayStats.map((item: any) => item[key]),
      itemStyle: { color: colorMap[key], borderRadius: [4, 4, 0, 0] },
      barWidth: '12%',
      label: { show: true, position: 'top', fontSize: 11 }
    }))
  }, true)
  
  // 点击图表柱子，显示对应人员的问题
  barChart.off('click')
  barChart.on('click', (params: any) => {
    const p = displayStats.find((item: any) => item.name === params.name)
    if (p) viewPersonProblems(p)
  })
}

// 单击表格行：记录人员编码并让图表只显示该行统计，再次单击同一行取消恢复全部
const handleRowClick = (row: any) => {
  selectedCode.value = selectedCode.value === row.code ? '' : row.code
  selectedPerson.value = selectedCode.value ? row : null
  renderChart()
}

// 双击表格行：先记录人员编码，再查看该人员的问题
const handleRowDblclick = (row: any) => {
  selectedCode.value = row.code
  selectedPerson.value = row
  viewPersonProblems(row)
}

// 点击"问题列表"标签：如果有已选中的人员编码，直接加载该人员的问题（无需双击）
const handleTabClick = (pane: any) => {
  if (pane?.paneName === 'list' && selectedPerson.value) {
    viewPersonProblems(selectedPerson.value)
  }
}

// 查看某人员的问题（按当前类别过滤）
const viewPersonProblems = (row: any) => {
  const cfg = curCat.value
  selectedName.value = row.name
  problemList.value = allProblems.value
    .filter(item => (item[cfg.codeField] || '') === row.code)
    .filter(item => cfg.filter ? cfg.filter(item) : true)
    .map(item => ({ ...item, statusText: getStatusText(item) }))
    .sort((a: any, b: any) => new Date(b.lvrusj).getTime() - new Date(a.lvrusj).getTime())
  
  activeTab.value = 'list'
  ElMessage.success(`已加载${categoryLabel.value}【${row.name}】的 ${problemList.value.length} 条问题`)
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
  selectedName.value = ''
  selectedCode.value = ''
  selectedPerson.value = null
  problemList.value = []
  loadData()
}

// 重置
const handleReset = () => {
  category.value = 'chuli'
  viewAll.value = false
  selectedName.value = ''
  selectedCode.value = ''
  selectedPerson.value = null
  problemList.value = []
  loadData()
}

// 窗口大小变化时重绘图表
window.addEventListener('resize', () => {
  if (barChart) barChart.resize()
})

onMounted(() => {
  loadData()
})

// 组件卸载时释放 echarts 实例，避免切菜单/HMR 后图表空白
onBeforeUnmount(() => {
  if (barChart) { barChart.dispose(); barChart = null }
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
