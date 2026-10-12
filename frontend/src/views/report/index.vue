<template>
  <div class="report-container">
    <el-card>
      <template #header>
        <div class="card-header">
          <span><el-icon><DataAnalysis /></el-icon> 问题状态</span>
          <el-button size="large" class="morandi-btn morandi-blue" @click="loadData"><el-icon><Refresh /></el-icon> 刷新</el-button>
        </div>
      </template>
      
      <!-- 查询条件：只保留"查询所有人员" -->
      <el-form :inline="true" class="search-form">
        <el-form-item v-if="canViewOthers">
          <el-checkbox v-model="viewAll" @change="loadData">查询所有人员</el-checkbox>
          <span class="hint">（打勾后每个人员显示一个饼图）</span>
        </el-form-item>
      </el-form>
      
      <!-- 问题状态饼图组 -->
      <div class="pie-grid" v-loading="loading">
        <el-card v-for="(p, idx) in pieData" :key="p.code" shadow="hover" class="pie-card">
          <template #header>
            <span class="chart-title">{{ p.name }}（共 {{ p.total }} 条）</span>
          </template>
          <div :ref="(el) => setPieRef(el, idx)" class="pie-container"></div>        </el-card>
      </div>
      
      <!-- 空状态 -->
      <el-empty v-if="!loading && pieData.length === 0" description="暂无统计数据" />
    </el-card>
  </div>
</template>

<script setup>
import { ref, computed, onMounted, onBeforeUnmount, nextTick } from 'vue'
import { DataAnalysis, Refresh } from '@element-plus/icons-vue'
import axios from 'axios'
import * as echarts from 'echarts'

const loading = ref(false)
const pieData = ref([])      // [{ code, name, total, daichuli, daiceshi, yichuli, daitaolun }]
const pieEls = []            // 各饼图 DOM 容器
const pieCharts = []         // 各饼图 echarts 实例

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

const viewAll = ref(false)   // 查询所有人员（打勾时每人一个饼图）

// 计算问题状态：由三个标志位组合推导（与列表页口径一致）
function getStatus(item) {
  if (item.taolunbz === 'Y') return 'daitaolun'
  if (item.gongchengsbz === 'Y' && item.shouhoubz === 'Y') return 'yichuli'
  if (item.gongchengsbz === 'Y' && item.shouhoubz === 'N') return 'daiceshi'
  return 'daichuli'
}

// 收集饼图容器
const setPieRef = (el, idx) => {
  if (el) pieEls[idx] = el
}

// 加载数据：查询全部问题（无日期条件），按跟进人编码分组，每组一个饼图
const loadData = async () => {
  loading.value = true
  try {
    const currentUserCode = localStorage.getItem('userCode') || getCurrentUser()
    
    // 分页拉全量
    let all = []
    const pageSize = 5000
    let page = 1
    let total = null
    while (true) {
      const res = await axios.get('/api/feedback', { params: { page, pageSize } })
      const data = res.data?.data || res.data || res
      const list = data?.list || []
      all = all.concat(list)
      if (total === null) total = data?.total ?? list.length
      if (!list.length || page * pageSize >= total) break
      page++
    }
    
    // 不打勾：只统计当前登录者作为跟进人的问题；打勾：统计所有人
    let filtered = all
    if (!viewAll.value) {
      filtered = all.filter(item => (item.shishiryBM || '') === currentUserCode)
    }
    
    // 按跟进人编码分组
    const personMap = {}
    filtered.forEach(item => {
      const code = item.shishiryBM
      if (!code) return  // 未分配跟进人的不统计
      if (!personMap[code]) {
        personMap[code] = { code, name: item.shishiry || code, total: 0, daichuli: 0, daiceshi: 0, yichuli: 0, daitaolun: 0 }
      }
      const p = personMap[code]
      p.total++
      p[getStatus(item)]++
    })
    
    pieData.value = Object.values(personMap).sort((a, b) => b.total - a.total)
    
    await nextTick()
    renderPies()
    
  } catch (err) {
    console.error('加载统计数据失败:', err)
    pieData.value = []
  } finally {
    loading.value = false
  }
}

// 渲染饼图组
const renderPies = () => {
  // 清理旧实例
  pieCharts.forEach(chart => { if (chart) chart.dispose() })
  pieCharts.length = 0
    
  const colorMap = {
    daichuli: '#e6a23c',   // 待处理：橙
    daiceshi: '#409eff',   // 待测试：蓝
    yichuli: '#67c23a',    // 已处理：绿
    daitaolun: '#f56c6c'   // 待讨论：红
  }
  
  pieData.value.forEach((p, idx) => {
    const el = pieEls[idx]
    if (!el) return
    const chart = echarts.init(el)
    pieCharts[idx] = chart
    chart.setOption({
      tooltip: { trigger: 'item', formatter: '{b}: {c} ({d}%)' },
      legend: { bottom: 0, itemWidth: 14, itemHeight: 10 },
      series: [
        {
          name: '问题状态',
          type: 'pie',
          radius: ['40%', '68%'],
          center: ['50%', '45%'],
          avoidLabelOverlap: false,
          itemStyle: { borderRadius: 8, borderColor: '#fff', borderWidth: 2 },
          label: { show: true, formatter: '{b}\n{d}%', fontSize: 12 },
          emphasis: { label: { show: true, fontSize: 14, fontWeight: 'bold' } },
          data: [
            { value: p.daichuli, name: '待处理', itemStyle: { color: colorMap.daichuli } },
            { value: p.daiceshi, name: '待测试', itemStyle: { color: colorMap.daiceshi } },
            { value: p.yichuli, name: '已处理', itemStyle: { color: colorMap.yichuli } },
            { value: p.daitaolun, name: '待讨论', itemStyle: { color: colorMap.daitaolun } }
          ]
        }
      ]
    })
  })
}

// 窗口大小变化时重新渲染图表
window.addEventListener('resize', () => {
  pieCharts.forEach(chart => { if (chart) chart.resize() })
})

onMounted(() => {
  loadData()
})

// 组件卸载时释放 echarts 实例，避免切菜单/HMR 后实例指向已销毁的 DOM 导致图表空白
onBeforeUnmount(() => {
  pieCharts.forEach(chart => { if (chart) { chart.dispose(); } })
  pieCharts.length = 0
  pieEls.length = 0
})
</script>

<style scoped>
.report-container { padding: 0; }
.card-header { display: flex; justify-content: space-between; align-items: center; }
.card-header span { display: flex; align-items: center; gap: 8px; font-weight: 600; font-size: 16px; }
.search-form { margin-bottom: 10px; }
.hint { color: #909399; font-size: 13px; margin-left: 8px; }

.pie-grid { display: flex; flex-wrap: wrap; gap: 20px; }
.pie-card { width: 340px; }
.chart-title { font-weight: 600; color: #303133; }
.pie-container { width: 100%; height: 320px; }
</style>
