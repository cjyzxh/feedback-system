<template>
  <div class="check-page">
    <!-- 上部：测试问题表单 -->
    <el-card class="form-card">
      <div class="form-content">
        <!-- 第一行：基础信息（缩小显示，一行显示） -->
        <el-row :gutter="12" class="basic-info">
          <el-col :span="1">
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
          <el-col :span="1">
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
          <el-col :span="2">
            <div class="info-item small">
              <div class="info-label">处理人</div>
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
              <el-input 
                class="test-result-input"
                v-model="form.shouhoucs" 
                type="textarea" 
                :rows="5" 
                placeholder="请录入测试结果..." 
              />
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
            <el-button type="primary" size="default" @click="handleRefresh"><el-icon><Refresh /></el-icon> 刷新</el-button>
          </div>
          <div class="header-actions">
            <el-button class="morandi-btn morandi-green" @click="handleConfirm" :loading="submitting">
              <el-icon><Check /></el-icon> 确认测试问题
            </el-button>
            <el-button class="morandi-btn morandi-pink" @click="handleReset">
              <el-icon><RefreshLeft /></el-icon> 返回测试问题
            </el-button>
            <el-button class="morandi-btn morandi-yellow" @click="viewImages(form)" :disabled="!hasImages">
              <el-icon><Picture /></el-icon> 查看图片
            </el-button>
          </div>
        </div>
      </template>
      <el-table :data="list" @row-click="handleRowClick" highlight-current-row :row-class-name="getRowClass" stripe height="100%">
        <el-table-column prop="id" label="ID" width="60" align="center" />
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
        <el-table-column prop="jingjicd" label="紧急" width="65" align="center">
          <template #default="{ row }">
            <el-tag v-if="row.jingjicd === '紧急'" type="danger" size="small">紧急</el-tag>
            <el-tag v-else-if="row.jingjicd === '急'" type="warning" size="small">急</el-tag>
            <el-tag v-else type="info" size="small">一般</el-tag>
          </template>
        </el-table-column>
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
        <el-table-column label="图片" width="55" align="center">
          <template #default="{ row }">
            <el-button type="primary" link size="small" @click.stop="viewImages(row)"><el-icon><Picture /></el-icon></el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <!-- 图片预览弹窗 -->
    <el-dialog v-model="previewVisible" title="问题截图" width="750px" destroy-on-close>
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
          <el-button type="warning" plain @click="openImageViewer">
            <el-icon><ZoomIn /></el-icon> 查看原图（可缩放）
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
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { CircleCheck, Check, List, Refresh, Picture, ArrowLeft, ArrowRight, RefreshLeft, ZoomIn } from '@element-plus/icons-vue'
import axios from 'axios'

const list = ref<any[]>([])
const selected = ref<any>(null)
const submitting = ref(false)
const viewAll = ref(false)  // 查询所有待测试问题，默认false（只查自己的）

// 时间条件：默认开始日期为一年前，结束日期为当前日期
const getDefaultStartDate = () => {
  const date = new Date()
  date.setFullYear(date.getFullYear() - 1)
  return date.toISOString().split('T')[0]
}
const getDefaultEndDate = () => {
  return new Date().toISOString().split('T')[0]
}

const startDate = ref(getDefaultStartDate())
const endDate = ref(getDefaultEndDate())

// 判断当前用户是否有"查看非本人数据"权限
const canViewOthers = computed(() => {
  return parseInt(localStorage.getItem('viewOthers') || '0') === 1
})

const getRowClass = ({ row }: { row: any }) => selected.value?.id === row.id ? 'selected-row' : ''

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

const form = reactive({
  id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', gongcscs: '', shouhoucs: '', xggcs: '', shishiry: '', jingjicd: '一般', lvrusj: null as any, xgsj: null as any
})

const loadList = async () => {
  const userStr = localStorage.getItem('user')
  const user = userStr ? JSON.parse(userStr) : null
  const params: any = { gongchengsbz: 'Y', shouhoubz: 'N' }  // 处理=是，售后=否（待测试）
  
  // 时间范围条件（问题测试页按 xgsj 处理时间查询）
  if (startDate.value) params.startDate = startDate.value
  if (endDate.value) params.endDate = endDate.value
  params.dateField = 'xgsj'
  
  // 获取当前登录者名称
  const currentUserName = user?.realName || user?.username || localStorage.getItem('username') || ''
  
  // 不打勾：只查询跟进人员为当前登录者的待测试数据
  if (!viewAll.value && currentUserName) {
    params.shishiry = currentUserName
  }
  
  try {
    console.log('测试页查询参数:', params, 'viewAll:', viewAll.value)
    const res = await axios.get('/api/feedback', { params })
    console.log('测试页查询结果:', res.data)
    list.value = res?.data?.data?.list || res?.data?.list || []
  } catch (err) { console.error('加载列表失败', err) }
}

// 刷新：清空上面表单数据，重新加载列表
const handleRefresh = () => {
  selected.value = null
  Object.assign(form, { id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', shouzhongcs: '', gongcscs: '', shouhoucs: '', xggcs: '', shishiry: '', jingjicd: '一般', lvrusj: null, xgsj: null })
  hasImages.value = false
  loadList()
}

const handleRowClick = async (row: any) => {
  selected.value = row
  const rowCopy = JSON.parse(JSON.stringify(row))
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

const previewVisible = ref(false)
const previewImages = ref<string[]>([])
const currentIndex = ref(0)
const imageViewerVisible = ref(false)  // 全屏图片查看器状态
const hasImages = ref(false)  // 当前选中问题是否有图片

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

// 确认测试问题
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
    
    // 保存测试结果到shouhoucs，修改shouhoubz=Y，修改shcsgcs=当前操作员，保存cssj=当前时间
    const updateData: any = {
      shouhoucs: form.shouhoucs,
      shouhoubz: 'Y',
      shcsgcs: currentUserName,
      cssj: new Date()
    }
    
    await axios.put('/api/feedback/' + form.id, updateData)
    ElMessage.success('测试确认成功')
    handleReset()
    loadList()
  } catch (err) { ElMessage.error('提交失败') }
  finally { submitting.value = false }
}

// 返回测试问题（退回工程师重新处理）
const handleReset = async () => {
  if (submitting.value) return  // 防止重复点击
  if (!form.id) {
    // 没有选中记录，直接重置表单
    selected.value = null
    Object.assign(form, { id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', gongcscs: '', shouhoucs: '', xggcs: '', shishiry: '', jingjicd: '一般', lvrusj: null })
    return
  }
  
  submitting.value = true  // 立即设置提交状态，防止重复点击
  
  // 返回问题前必须填写测试结果
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
    
    // 返回测试问题：gongchengsbz=N（退回工程师），shouhoucs=测试结果（返回原因），shcsgcs=当前操作员，cssj=当前时间
    // 注意：shouzhongcs（测试说明）保留数据库中的值，只清空界面显示
    const updateData: any = {
      gongchengsbz: 'N',
      shouhoucs: form.shouhoucs || '',
      shcsgcs: currentUserName,
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

onMounted(() => { loadList() })
</script>

<style scoped>
.check-page { padding: 0; height: calc(100vh - 100px); display: flex; flex-direction: column; gap: 1px; overflow: hidden; }
.card-header { display: flex; justify-content: space-between; align-items: center; gap: 10px; flex-wrap: wrap; }
.form-header { display: flex; justify-content: flex-start; align-items: center; }
.header-buttons { display: flex; gap: 3px; }
.header-filters { display: flex; align-items: center; gap: 3px; margin-left: 10px; flex-wrap: wrap; }
.header-filters .el-checkbox { margin-right: 8px !important; }
.header-actions { display: flex; align-items: center; margin-left: auto; flex-shrink: 0; }
.header-actions .el-button { margin-left: 0 !important; margin-right: 4px !important; }
.header-right { display: flex; align-items: center; gap: 12px; }

/* 复选框样式：显眼的边框和背景 */
:deep(.el-checkbox__inner) {
  border: 2px solid #00b894 !important;
  background-color: #f0faf7 !important;
  width: 16px !important;
  height: 16px !important;
}
:deep(.el-checkbox__input.is-checked .el-checkbox__inner) {
  background-color: #00b894 !important;
  border-color: #00b894 !important;
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
  background: #dcdfe6 !important;
  color: #909399 !important;
  cursor: not-allowed;
  transform: none;
  box-shadow: none;
}

/* 确认测试问题 - 莫兰迪绿（柔和、沉稳，表示确认完成） */
.morandi-green {
  background: linear-gradient(135deg, #8FAF8F 0%, #7A9E7A 100%) !important;
}
.morandi-green:hover {
  background: linear-gradient(135deg, #9DBB9D 0%, #8FAF8F 100%) !important;
}

/* 返回测试问题 - 莫兰迪粉（柔和、温暖，表示退回返回） */
.morandi-pink {
  background: linear-gradient(135deg, #C9A9A6 0%, #B89895 100%) !important;
}
.morandi-pink:hover {
  background: linear-gradient(135deg, #D4B5B0 0%, #C9A9A6 100%) !important;
}

/* 查看图片 - 莫兰迪黄（柔和、温暖，表示查看浏览） */
.morandi-yellow {
  background: linear-gradient(135deg, #C9C08F 0%, #B8AF7E 100%) !important;
}
.morandi-yellow:hover {
  background: linear-gradient(135deg, #D4CC9E 0%, #C9C08F 100%) !important;
}

.header-right { display: flex; align-items: center; gap: 12px; }
.card-header span { display: flex; align-items: center; gap: 8px; font-weight: 600; }
.form-card { flex-shrink: 0; margin: 0; }
.form-card :deep(.el-card__body) { padding-top: 12px; padding-bottom: 1px; padding-left: 20px; padding-right: 20px; }
.form-content { display: flex; flex-direction: column; gap: 12px; }
.basic-info { margin-bottom: 8px; }
.info-item { background: #f8f9fa; padding: 8px 12px; border-radius: 6px; }
.info-item.small { padding: 6px 8px; }
.info-item.large { padding: 12px 16px; background: #fff; border: 1px solid #e4e7ed; height: 180px; display: flex; flex-direction: column; }
.info-label { font-size: 11px; color: #909399; margin-bottom: 4px; }
.info-label.big { font-size: 13px; font-weight: 600; color: #303133; }
.info-label.required::before { content: '*'; color: #f56c6c; margin-right: 4px; }
.info-value { font-size: 12px; color: #303133; font-weight: 500; }
.info-value.textarea { white-space: pre-wrap; word-break: break-all; flex: 1; overflow-y: auto; overflow-x: hidden; }
.large-text { font-size: 14px; line-height: 1.6; }
.test-result-input { flex: 1; display: flex; flex-direction: column; }
.test-result-input :deep(.el-textarea) { flex: 1; }
.test-result-input :deep(.el-textarea__inner) { height: 138px !important; min-height: 138px !important; max-height: 138px !important; overflow-y: auto; resize: none; }
.table-card { flex: 1; display: flex; flex-direction: column; overflow: hidden; margin: 0; }
.table-card :deep(.el-card__body) { flex: 1; overflow: hidden; padding: 0; }
.selected-row { background-color: #ecf5ff !important; }
.carousel-container { display: flex; flex-direction: column; align-items: center; gap: 16px; }
.carousel-wrapper { width: 100%; max-height: 500px; display: flex; justify-content: center; align-items: center; }
.carousel-image { max-width: 100%; max-height: 500px; object-fit: contain; }
.carousel-controls { display: flex; align-items: center; gap: 16px; }
.indicator { font-size: 14px; color: #606266; }
.viewer-tip { margin-top: 12px; padding: 8px 12px; background: #ecf5ff; color: #409eff; border-radius: 4px; font-size: 12px; text-align: center; }
</style>
