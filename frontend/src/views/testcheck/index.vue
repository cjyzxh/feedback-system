<template>
  <div class="check-page">
    <!-- 上部：测试问题表单 -->
    <el-card class="form-card">
      <div class="form-content">
        <!-- 第一行：基础信息（缩小显示，一行显示） -->
        <el-row :gutter="12" class="basic-info">
          <el-col :span="2">
            <div class="info-item small">
              <div class="info-label">问题ID号</div>
              <div class="info-value">{{ form.id || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="1">
            <div class="info-item small">
              <div class="info-label">紧急</div>
              <el-tag :type="getJingjiType(form.jingjicd)" size="small">{{ form.jingjicd || '-' }}</el-tag>
            </div>
          </el-col>
          <el-col :span="2">
            <div class="info-item small">
              <div class="info-label">版本</div>
              <div class="info-value">{{ form.banben || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="4">
            <div class="info-item small">
              <div class="info-label">医院</div>
              <div class="info-value" :title="form.yiyuanmc">{{ form.yiyuanmc || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="2">
            <div class="info-item small">
              <div class="info-label">模块</div>
              <div class="info-value">{{ form.mokuai || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="2">
            <div class="info-item small">
              <div class="info-label">窗体</div>
              <div class="info-value">{{ form.chuangtimc || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="1">
            <div class="info-item small">
              <div class="info-label">跟进人</div>
              <div class="info-value">{{ form.shishiry || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="1">
            <div class="info-item small">
              <div class="info-label">工程师</div>
              <div class="info-value">{{ form.xggcs || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="3">
            <div class="info-item small">
              <div class="info-label">录入时间</div>
              <div class="info-value">{{ formatDate(form.lvrusj) }}</div>
            </div>
          </el-col>
          <el-col :span="3">
            <div class="info-item small">
              <div class="info-label">处理时间</div>
              <div class="info-value">{{ formatDate(form.xgsj) }}</div>
            </div>
          </el-col>
        </el-row>
        <!-- 第二行：问题说明、测试说明、处理意见、测试结果（等高显示） -->
        <el-row :gutter="16">
          <el-col :span="6">
            <div class="info-item large">
              <div class="info-label big">问题说明</div>
              <div class="info-value textarea large-text">{{ form.wentism || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="6">
            <div class="info-item large">
              <div class="info-label big">测试说明</div>
              <div class="info-value textarea large-text">{{ form.shouzhongcs || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="6">
            <div class="info-item large">
              <div class="info-label big">处理意见</div>
              <div class="info-value textarea large-text">{{ form.gongcscs || '暂无' }}</div>
            </div>
          </el-col>
          <el-col :span="6">
            <div class="info-item large">
              <div class="info-label big required">测试结果</div>
              <div style="display:flex; align-items:flex-start; gap:6px; width:100%">
                <el-input
                class="test-result-input"
                v-model="form.shouhoucs"
                type="textarea"
                :rows="5"
                placeholder="请录入测试结果..."
                />
                <TemplatePicker :lx="'测试结果'" @select="appendShouhoucs" />
              </div>
            </div>
          </el-col>
        </el-row>
      </div>
    </el-card>

    <!-- 下部：待测试问题列表 -->
    <el-card class="table-card">
      <template #header>
        <div class="card-header">
          <span><el-icon><List /></el-icon> 待测试问题列表</span>
          <div class="header-filters">
            <el-date-picker
              v-model="startDate"
              type="date"
              placeholder="开始日期"
              format="YYYY-MM-DD"
              value-format="YYYY-MM-DD"
              @change="loadList"
              style="width: 140px"
            />
            <span style="color: #909399">至</span>
            <el-date-picker
              v-model="endDate"
              type="date"
              placeholder="结束日期"
              format="YYYY-MM-DD"
              value-format="YYYY-MM-DD"
              @change="loadList"
              style="width: 140px"
            />
            <el-checkbox v-if="canViewOthers" v-model="viewAll" @change="loadList">查询所有待测试问题</el-checkbox>
            <el-button class="morandi-btn morandi-blue" size="default" @click="handleRefresh"><el-icon><Refresh /></el-icon> 刷新列表</el-button>
          </div>
          <div class="header-actions">
            <el-button class="morandi-btn morandi-green" @click="handleConfirm" :loading="submitting">
              <el-icon><Check /></el-icon> 确认问题
            </el-button>
            <el-button class="morandi-btn morandi-red" @click="handleReset">
              <el-icon><RefreshLeft /></el-icon> 返回问题
            </el-button>
            <el-button class="morandi-btn morandi-yellow" @click="viewImages(form)" :disabled="!hasImages">
              <el-icon><Picture /></el-icon> 查看图片
            </el-button>
          </div>
        </div>
      </template>
      <el-table ref="tableRef" :data="list" @row-click="handleRowClick" @row-dblclick="handleView" highlight-current-row :row-class-name="getRowClass" stripe height="100%">
        <el-table-column prop="id" label="ID" width="60" align="center" />
        <el-table-column prop="jingjicd" label="紧急度" width="75" align="center">
          <template #default="{ row }">
            <el-tag v-if="row.jingjicd === '紧急'" type="danger" size="small">紧急</el-tag>
            <el-tag v-else-if="row.jingjicd === '急'" type="warning" size="small">急</el-tag>
            <el-tag v-else type="info" size="small">一般</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="wentilx" label="问题类型" width="90" align="center">
          <template #default="{ row }">{{ row.wentilx || '其它问题' }}</template>
        </el-table-column>
        <el-table-column prop="yiyuanmc" label="医院名称" min-width="50" />
        <el-table-column prop="mokuai" label="模块" width="90" />
        <el-table-column prop="chuangtimc" label="窗体" width="90" />
        <el-table-column prop="xggcs" label="工程师" width="70" />
        <el-table-column prop="shishiry" label="跟进人" width="70" />
        <el-table-column prop="wentism" label="问题说明" min-width="40" />
        <el-table-column prop="shouzhongcs" label="测试说明" min-width="40">
          <template #default="{ row }">
            <span v-if="row.shouzhongcs">{{ row.shouzhongcs }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
        <el-table-column prop="gongcscs" label="处理意见" min-width="40" />
        <el-table-column prop="lvrusj" label="录入时间" width="180">
          <template #default="{ row }">
            <span v-if="row.lvrusj">{{ formatDate(row.lvrusj) }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
        <el-table-column prop="xgsj" label="处理时间" width="180">
          <template #default="{ row }">
            <span v-if="row.xgsj">{{ formatDate(row.xgsj) }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
        <el-table-column label="图片" width="55" align="center" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link size="small" @click.stop="viewImages(row)"><el-icon><Picture /></el-icon></el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <!-- 查看问题（三页统一窗体） -->
    <ViewProblemDialog v-model="viewDialogVisible" :problem="viewProblem" />

    <!-- 图片预览弹窗 -->
    <el-dialog v-model="previewVisible" title="问题截图" width="960px" destroy-on-close class="preview-dialog">
      <div class="carousel-container">
        <div class="carousel-wrapper" v-if="previewImages.length > 0">
          <img :src="previewImages[currentIndex]" class="carousel-image" @click="openImageViewer" style="cursor: zoom-in;" />
        </div>
        <el-empty v-else description="暂无图片" />
        <div class="carousel-controls" v-if="previewImages.length > 1">
          <el-button circle :disabled="currentIndex === 0" @click="currentIndex--"><el-icon><ArrowLeft /></el-icon></el-button>
          <span class="indicator">{{ currentIndex + 1 }} / {{ previewImages.length }}</span>
          <el-button circle :disabled="currentIndex === previewImages.length - 1" @click="currentIndex++"><el-icon><ArrowRight /></el-icon></el-button>
        </div>
        <div class="carousel-actions" v-if="previewImages.length > 0" style="margin-top: 16px; text-align: center;">
          <el-button type="primary" @click="openImageViewer">
            <el-icon><ZoomIn /></el-icon> 查看原图
          </el-button>
          <el-button type="info" plain @click="previewVisible = false">
            <el-icon><Back /></el-icon> 返回列表
          </el-button>
        </div>
        <div class="viewer-tip" v-if="previewImages.length > 0">
          提示：点击图片或"查看原图"按钮可全屏查看，支持鼠标滚轮缩放、拖拽移动
        </div>
      </div>
    </el-dialog>
    
    <!-- 全屏图片查看器（支持鼠标滚轮缩放、拖拽、全屏） -->
    <el-image-viewer
      v-if="imageViewerVisible"
      :url-list="previewImages"
      :initial-index="currentIndex"
      :hide-on-click-modal="true"
      :z-index="9999"
      @close="imageViewerVisible = false"
    />
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted, nextTick, onUnmounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { CircleCheck, Check, List, Refresh, Picture, ArrowLeft, ArrowRight, RefreshLeft, ZoomIn, Back } from '@element-plus/icons-vue'
import axios from 'axios'
import TemplatePicker from '@/components/TemplatePicker.vue'
import ViewProblemDialog from '@/components/ViewProblemDialog.vue'

// ============ 页面状态变量 ============
const list = ref<any[]>([])      // 待测试问题列表
const selected = ref<any>(null)  // 当前选中的问题行
const submitting = ref(false)    // 提交中（防重复点击）
const viewAll = ref(false)  // "查看所有问题"复选框：默认false（只查自己跟进负责测试的）

// 时间条件：默认查最近一年（测试页按处理时间 xgsj 过滤）
const getDefaultStartDate = () => {
  const date = new Date()
  date.setFullYear(date.getFullYear() - 1)
  return date.toISOString().split('T')[0]  // 去年今天
}
const getDefaultEndDate = () => {
  return new Date().toISOString().split('T')[0]  // 今天
}

const startDate = ref(getDefaultStartDate())
const endDate = ref(getDefaultEndDate())

// 判断当前用户是否有"查看非本人数据"权限（角色表 viewOthers）
const canViewOthers = computed(() => {
  return parseInt(localStorage.getItem('viewOthers') || '0') === 1
})

// 选中行高亮（淡蓝）
const getRowClass = ({ row }: { row: any }) => selected.value?.id === row.id ? 'selected-row' : ''

// 紧急程度 -> 标签颜色（danger=红，warning=橙，info=灰）
const getJingjiType = (type: string) => {
  if (type === '紧急') return 'danger'
  if (type === '急') return 'warning'
  return 'info'
}

const formatDate = (date: any) => {
  if (!date) return '-'
  const d = new Date(date)
  const year = d.getFullYear()
  const month = String(d.getMonth() + 1).padStart(2, '0')
  const day = String(d.getDate()).padStart(2, '0')
  const hours = String(d.getHours()).padStart(2, '0')
  const minutes = String(d.getMinutes()).padStart(2, '0')
  const seconds = String(d.getSeconds()).padStart(2, '0')
  return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`
}

// ============ 上方详情表单（点击列表行后填充） ============
// shouhoucs = 测试结果（测试员填写：通过内容 或 返回原因）
const form = reactive({
  id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', gongcscs: '', shouhoucs: '', xggcs: '', shishiry: '', jingjicd: '一般', lvrusj: null as any, xgsj: null as any
})

// ============ 核心：加载待测试问题列表 ============
// 本页显示"待测试"的问题：工程师已处理完(gongchengsbz='Y') 但还没测试(shouhoubz='N')
const loadList = async () => {
  const userStr = localStorage.getItem('user')
  const user = userStr ? JSON.parse(userStr) : null
  const params: any = { gongchengsbz: 'Y', shouhoubz: 'N' }  // 固定条件：处理=是，售后=否
  
  // 时间范围条件（问题测试页按 xgsj 修改/处理时间查询，与处理页的 lvrusj 不同）
  if (startDate.value) params.startDate = startDate.value
  if (endDate.value) params.endDate = endDate.value
  params.dateField = 'xgsj'
  
  // 获取当前登录者名称
  const currentUserName = user?.realName || user?.username || localStorage.getItem('username') || ''
  
  // 不打勾"查看所有"：只查跟进人员（shishiry）=当前登录者的待测试数据
  // 按编码过滤：跟进人编码(shishiryBM)=当前登录人编码
  const currentUserCode = localStorage.getItem('userCode') || ''
  if (!viewAll.value && (currentUserName || currentUserCode)) {
    params.shishiryBM = currentUserCode
  }
  
  try {
    console.log('测试页查询参数:', params, 'viewAll:', viewAll.value)
    const res = await axios.get('/api/feedback', { params })
    console.log('测试页查询结果:', res.data)
    list.value = res?.data?.data?.list || res?.data?.list || []
  } catch (err) { console.error('加载列表失败', err) }
}

// 刷新：清空上方表单（只清界面文本，不动数据库）并重新加载列表
const handleRefresh = () => {
  selected.value = null
  Object.assign(form, { id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', shouzhongcs: '', gongcscs: '', shouhoucs: '', xggcs: '', shishiry: '', jingjicd: '一般', lvrusj: null, xgsj: null })
  hasImages.value = false
  loadList()
}

// 点击列表行 -> 把问题数据填到上方表单，并查有无图片
const handleRowClick = async (row: any) => {
  selected.value = row
  const rowCopy = JSON.parse(JSON.stringify(row))  // 深拷贝
  Object.assign(form, rowCopy)
  // 查询该问题是否有图片
  try {
    const res = await axios.get("/api/feedback/images/" + row.id)
    const imgs = res.data
    hasImages.value = imgs && imgs.length > 0
  } catch (err) { 
    console.error("查询图片失败", err)
    hasImages.value = false
  }
}

// ============ 图片查看 ============
const previewVisible = ref(false)
const viewDialogVisible = ref(false)  // 查看对话框是否显示
const viewProblem = ref<any>(null)        // 当前查看的问题行数据（传给统一查看窗体）
const detailImages = ref<string[]>([])  // 查看详情图片列表
  // 轮播预览窗口是否显示
const previewImages = ref<string[]>([])  // 轮播图片数组
const currentIndex = ref(0)        // 当前第几张
const imageViewerVisible = ref(false)  // 全屏图片查看器状态
const hasImages = ref(false)  // 当前选中问题是否有图片（控制查看图片按钮可用性）

// 打开全屏图片查看器（支持鼠标滚轮缩放、拖拽、全屏）
const openImageViewer = () => {
  if (previewImages.value.length > 0) {
    imageViewerVisible.value = true
  }
}

const viewImages = async (row: any) => {
  try {
    const res = await axios.get("/api/feedback/images/" + row.id)
    const imgs = res.data
    if (imgs && imgs.length > 0) {
      previewImages.value = imgs.map((name: string) => "/api/feedback/uploads/" + name)
      currentIndex.value = 0
      previewVisible.value = true
    } else { ElMessage.warning("暂无图片") }
  } catch (err) { console.error("加载图片失败", err) }
}
// 查看问题：把行数据传给统一窗体（组件内部自动加载详情/附件/售后到期日）
const handleView = (row: any) => {
  viewProblem.value = row
  viewDialogVisible.value = true
}

const handleViewImage = (url: string) => {
  previewImages.value = detailImages.value
  currentIndex.value = previewImages.value.findIndex(u => u === url)
  previewVisible.value = true
}



// ============ 核心：确认测试（测试通过） ============
// 成功后：shouhoubz='Y'（测试完成）=> 问题状态变为"已修改"，从本页消失
const handleConfirm = async () => {
  if (submitting.value) return  // 防止重复点击
  if (!form.id) { ElMessage.warning('请先从下方列表选择一条记录'); return }
  if (!form.shouhoucs || !form.shouhoucs.trim()) { ElMessage.warning('请录入测试结果'); return }
  
  submitting.value = true  // 立即设置提交状态，防止重复点击
  try {
    await ElMessageBox.confirm('确定要确认该问题的测试结果吗？', '确认测试', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
  } catch {
    submitting.value = false  // 用户取消，重置状态
    return
  }
  
  try {
    // 获取当前登录者
    const userStr = localStorage.getItem('user')
    const user = userStr ? JSON.parse(userStr) : null
    const currentUserName = user?.realName || user?.username || localStorage.getItem('username') || ''
    
    // 保存的内容：测试结果=shouhoucs、测试完成标志=shouhoubz='Y'、
    //           测试人=shcsgcs（当前操作员）、测试时间=cssj（当前时间）
    const updateData: any = {
      shouhoucs: form.shouhoucs,
      shouhoubz: 'Y',
      shcsgcs: currentUserName,
      shcsgcsBM: localStorage.getItem('userCode') || '',
      cssj: new Date()
    }
    
    await axios.put('/api/feedback/' + form.id, updateData)
    ElMessage.success('测试确认成功')
    handleReset()  // 清空表单
    loadList()
  } catch (err) { ElMessage.error('提交失败') }
  finally { submitting.value = false }
}

// ============ 核心：返回测试（测试不过，退回工程师） ============
// 关键：只改 gongchengsbz='N' 让问题回到"待修改"；shouzhongcs（测试说明）保留数据库原值
const handleReset = async () => {
  if (submitting.value) return  // 防止重复点击
  if (!form.id) {
    // 没有选中记录：本函数兼当"清空表单"用（确认测试成功后也调它）
    selected.value = null
    Object.assign(form, { id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', gongcscs: '', shouhoucs: '', xggcs: '', shishiry: '', jingjicd: '一般', lvrusj: null })
    return
  }
  
  submitting.value = true  // 立即设置提交状态，防止重复点击
  
  // 返回问题前必须填写测试结果（也就是返回原因，方便工程师看到为什么被打回）
  if (!form.shouhoucs || !form.shouhoucs.trim()) {
    ElMessage.warning('请先填写测试结果（返回原因）')
    submitting.value = false
    return
  }
  
  try {
    await ElMessageBox.confirm('确定要将该问题退回工程师重新处理吗？', '返回测试问题', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
  } catch {
    submitting.value = false  // 用户取消，重置状态
    return
  }
  
  try {
    // 获取当前登录者
    const userStr = localStorage.getItem('user')
    const user = userStr ? JSON.parse(userStr) : null
    const currentUserName = user?.realName || user?.username || localStorage.getItem('username') || ''
    
    // 返回：gongchengsbz='N'（问题回到工程师待处理）、shouhoucs=返回原因、
    //       shcsgcs=当前操作员、cssj=当前时间（记录这次测试打回）
    // 注意：shouzhongcs（测试说明）数据库值不动，只清界面显示
    const updateData: any = {
      gongchengsbz: 'N',
      shouhoucs: form.shouhoucs || '',
      shcsgcs: currentUserName,
      shcsgcsBM: localStorage.getItem('userCode') || '',
      cssj: new Date()
    }
    
    await axios.put('/api/feedback/' + form.id, updateData)
    ElMessage.success('已退回工程师重新处理')
    selected.value = null
    Object.assign(form, { id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', shouzhongcs: '', gongcscs: '', shouhoucs: '', xggcs: '', shishiry: '', jingjicd: '一般', lvrusj: null })
    loadList()
  } catch (err) { ElMessage.error('操作失败') }
  finally { submitting.value = false }
}

// ============ 模板按钮追加（测试结果） ============
const appendShouhoucs = (text: string) => {
  form.shouhoucs = form.shouhoucs ? form.shouhoucs + '\n' + text : text
}

onMounted(() => { loadList() })

// ========== 表格固定列重排（缩放应用后由 layout 通知 doLayout） ==========
const tableRef = ref<any>()
const relayoutTable = () => {
  nextTick(() => {
    try { tableRef.value?.doLayout?.() } catch (e) { /* 忽略布局异常 */ }
  })
}
onMounted(() => {
  window.addEventListener('page-scale-applied', relayoutTable)
  // 等 layout 完成缩放后再布局一次（路由切换回来时固定列可能错位）
  nextTick(() => setTimeout(relayoutTable, 350))
})
onUnmounted(() => window.removeEventListener('page-scale-applied', relayoutTable))

</script>

<style scoped>
.check-page { padding: 0; height: calc(100vh - 100px); display: flex; flex-direction: column; gap: 1px; overflow: hidden; }
.card-header { display: flex; justify-content: flex-start; align-items: center; gap: var(--qgap); flex-wrap: wrap; }
.form-header { display: flex; justify-content: flex-start; align-items: center; }
.header-buttons { display: flex; gap: 3px; }
.header-filters { display: flex; align-items: center; gap: var(--qgap); margin-left: 10px; flex-wrap: wrap; }
.header-filters .el-checkbox { margin-right: 8px !important; }
.header-actions { display: flex; align-items: center; flex-shrink: 0; }
.header-actions .el-button { margin-left: 0 !important; margin-right: var(--qgap) !important; }
.header-right { display: flex; align-items: center; gap: 12px; }

/* 复选框样式：显眼的边框和背景 */
:deep(.el-checkbox__inner) {
  border: 2px solid var(--el-color-primary) !important;
  background-color: var(--el-color-primary-light-9) !important;
  width: 16px !important;
  height: 16px !important;
}
:deep(.el-checkbox__input.is-checked .el-checkbox__inner) {
  background-color: var(--el-color-primary) !important;
  border-color: var(--el-color-primary) !important;
}
:deep(.el-checkbox__input.is-checked .el-checkbox__inner::after) {
  border-color: #ffffff !important;
}

/* 表格内容不换行，超出显示省略号 */
:deep(.el-table .cell) {
  white-space: nowrap !important;
  overflow: hidden !important;
  text-overflow: ellipsis !important;
}

/* ========== 莫兰迪色系按钮 - 低饱和度、柔和、高级 ========== */
.morandi-btn {
  border: none !important;
  color: #ffffff !important;
  font-weight: 500;
  border-radius: 6px !important;
  padding: 8px 16px !important;
  transition: all 0.3s ease;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.08);
}
.morandi-btn:hover {
  transform: translateY(-1px);
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.12);
  color: #ffffff !important;
}
.morandi-btn:active {
  transform: translateY(0);
}
.morandi-btn:disabled,
.morandi-btn.is-disabled {
  background: #909399 !important;
  color: #ffffff !important;
  cursor: not-allowed;
  transform: none;
  box-shadow: none;
}

/* 确认测试问题 - 莫兰迪绿（柔和、沉稳，表示确认完成） */
/* 返回测试问题 - 莫兰迪粉（柔和、温暖，表示退回返回） */
/* 查看图片 - 莫兰迪黄（柔和、温暖，表示查看浏览） */
.header-right { display: flex; align-items: center; gap: 12px; }
.card-header span { display: flex; align-items: center; gap: 8px; font-weight: 600; }
.form-card { flex-shrink: 0; margin: 0; }
.form-card :deep(.el-card__body) { padding-top: 12px; padding-bottom: 1px; padding-left: 20px; padding-right: 20px; }
.form-content { display: flex; flex-direction: column; gap: 12px; }
.basic-info { margin-bottom: 8px; }
.info-item { background: #f8f9fa; padding: 8px 12px; border-radius: 6px; }
.info-item.small { padding: 6px 8px; }
.info-item.large { padding: 12px 16px; background: #fff; border: 1px solid #e4e7ed; height: 180px; display: flex; flex-direction: column; }
.info-label { font-size: calc(var(--el-font-size-base) - 3px); color: #909399; margin-bottom: 4px; }
.info-label.big { font-size: calc(var(--el-font-size-base) - 1px); font-weight: 600; color: #303133; }
.info-label.required::before { content: '*'; color: #f56c6c; margin-right: 4px; }
.info-value { font-size: calc(var(--el-font-size-base) - 2px); color: #303133; font-weight: 500; }
.info-value.textarea { white-space: pre-wrap; word-break: break-all; flex: 1; overflow-y: auto; overflow-x: hidden; }
.large-text { font-size: var(--el-font-size-base); line-height: 1.6; }
.test-result-input { flex: 1; display: flex; flex-direction: column; }
.test-result-input :deep(.el-textarea) { flex: 1; }
.test-result-input :deep(.el-textarea__inner) { height: 138px !important; min-height: 138px !important; max-height: 138px !important; overflow-y: auto; resize: none; }
.table-card { flex: 1; display: flex; flex-direction: column; overflow: hidden; margin: 0; }
.table-card :deep(.el-card__body) { flex: 1; overflow: hidden; padding: 0; }
:deep(.selected-row) {
  background-color: var(--el-color-primary-light-9) !important;
}
:deep(.selected-row td) {
  font-weight: 600 !important;
}
.carousel-container { display: flex; flex-direction: column; align-items: center; gap: 16px; }
.carousel-wrapper { width: 100%; height: 560px; display: flex; justify-content: center; align-items: center; overflow: hidden; flex-shrink: 0; }
.carousel-image { max-width: 100%; max-height: 100%; width: auto; height: auto; object-fit: contain; }
.carousel-controls { display: flex; align-items: center; gap: 16px; flex-shrink: 0; }
.indicator { font-size: 14px; color: #606266; }
.viewer-tip { margin-top: 12px; padding: 8px 12px; background: #ecf5ff; color: var(--el-color-primary); border-radius: 4px; font-size: 12px; text-align: center; flex-shrink: 0; }
.carousel-actions { display: flex; justify-content: center; gap: 1px; flex-shrink: 0; }

/* 图片预览对话框：固定尺寸 */
.preview-dialog :deep(.el-dialog) { width: 960px !important; height: 760px !important; display: flex; flex-direction: column; }
.preview-dialog :deep(.el-dialog__body) { flex: 1; overflow: auto; display: flex; flex-direction: column; }

.view-dialog-actions { display: flex; justify-content: center; align-items: center; margin-top: 20px; width: 100%; text-align: center; }
.view-dialog-actions .el-button { padding: 11px 36px !important; font-size: 14px !important; height: auto; line-height: 1.5; }
.view-images { display: flex; flex-wrap: wrap; gap: 12px; }
.view-image { width: 120px; height: 120px; object-fit: cover; border-radius: 6px; border: 1px solid #dcdfe6; transition: all 0.3s; }
.view-image:hover { transform: scale(1.05); box-shadow: 0 4px 12px rgba(0,0,0,0.15); }
</style>
