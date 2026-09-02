<template>
  <div class="handle-page">
    <!-- 上部：处理问题表单 -->
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
          <el-col :span="3" v-if="form.cssj">
            <div class="info-item small test-return-info">
              <div class="info-label">测试时间</div>
              <div class="info-value">{{ formatDate(form.cssj) }}</div>
            </div>
          </el-col>
          <el-col :span="2" v-if="form.shcsgcs">
            <div class="info-item small test-return-info">
              <div class="info-label">测试人员</div>
              <div class="info-value">{{ form.shcsgcs || '-' }}</div>
            </div>
          </el-col>
        </el-row>
        <!-- 第二行：问题说明、测试说明、测试结果（测试返回时显示）和处理意见 -->
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
          <el-col :span="4" v-if="form.shouhoucs">
            <div class="info-item large test-result-box">
              <div class="info-label big">测试结果（返回原因）</div>
              <div class="info-value textarea large-text" style="color: #f56c6c; font-weight: 500;">{{ form.shouhoucs }}</div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="info-item large">
              <div class="info-label big required">处理意见</div>
              <el-input class="opinion-input" v-model="form.gongcscs" type="textarea" :rows="4" placeholder="请填写处理意见..." />
            </div>
          </el-col>
        </el-row>
      </div>
    </el-card>

    <!-- 下部：待处理问题列表 -->
    <el-card class="table-card">
      <template #header>
        <div class="card-header">
          <span><el-icon><List /></el-icon> 待处理问题列表</span>
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
            <el-checkbox v-if="canViewOthers" v-model="viewAll" @change="loadList">查询所有待修改问题</el-checkbox>
            <el-checkbox v-model="viewTaolun" @change="loadList">查询待讨论</el-checkbox>
            <el-button type="primary" size="default" @click="handleRefresh"><el-icon><Refresh /></el-icon> 刷新</el-button>
          </div>
          <div class="header-actions">
            <el-button class="morandi-btn morandi-green" @click="handleSubmit" :loading="submitting" :disabled="!selected">
              <el-icon><Check /></el-icon> 确认处理
            </el-button>
            <el-button class="morandi-btn morandi-yellow" @click="viewImages(form)" :disabled="!hasImages">
              <el-icon><Picture /></el-icon> 查看图片
            </el-button>
            <el-button class="morandi-btn morandi-blue" @click="handleAssign"><el-icon><User /></el-icon> 分配修改人</el-button>
            <el-button class="morandi-btn morandi-purple" @click="handleAssignFollower"><el-icon><User /></el-icon> 分配跟进人</el-button>
            <el-button class="morandi-btn morandi-orange" @click="handleDiscuss"><el-icon><ChatDotRound /></el-icon> 待讨论</el-button>
          </div>
        </div>
      </template>
      <el-table :data="list" @row-click="handleRowClick" highlight-current-row :row-class-name="getRowClass" stripe height="100%">
        <el-table-column prop="id" label="ID" width="60" align="center" />
        <el-table-column prop="yiyuanmc" label="医院名称" min-width="50" />
        <el-table-column prop="mokuai" label="模块" width="90" />
        <el-table-column prop="chuangtimc" label="窗体" width="90" />
        <el-table-column prop="shishiry" label="跟进人" width="70" />
        <el-table-column prop="xggcs" label="工程师" width="70" />
        <el-table-column prop="wentism" label="问题说明" min-width="40" />
        <el-table-column prop="shouzhongcs" label="测试说明" min-width="40">
          <template #default="{ row }">
            <span v-if="row.shouzhongcs">{{ row.shouzhongcs }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
        <el-table-column prop="shouhoucs" label="测试结果" min-width="40" v-if="!viewTaolun">
          <template #default="{ row }">
            <span v-if="row.shouhoucs" style="color: #f56c6c">{{ row.shouhoucs }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
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
        <el-table-column label="图片" width="55" align="center">
          <template #default="{ row }">
            <el-button type="primary" link  @click.stop="viewImages(row)"><el-icon><Picture /></el-icon></el-button>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="140" align="center" v-if="viewTaolun">
          <template #default="{ row }">
            <div class="action-buttons">
              <el-button type="success" size="small" @click.stop="handleReturnToPending(row)">返回</el-button>
              <el-button type="danger" size="small" @click.stop="handleDeleteProblem(row)">删除</el-button>
            </div>
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
    <el-dialog v-model="showDevSelect" title="分配修改人" width="320px">
      <el-select v-model="selectedDev" placeholder="请选择研发人员" style="width:100%">
        <el-option v-for="u in yanfaList" :key="u.id" :label="u.xingming" :value="u.xingming" />
      </el-select>
      <template #footer>
        <el-button @click="showDevSelect=false">取消</el-button>
        <el-button type="primary" @click="confirmAssign">确认</el-button>
      </template>
    </el-dialog>
    <!-- 分配跟进人弹窗 -->
    <el-dialog v-model="showFollowerSelect" title="分配跟进人" width="320px">
      <el-select v-model="selectedFollower" placeholder="请选择实施人员" style="width:100%">
        <el-option v-for="u in shishiList" :key="u.id" :label="u.xingming" :value="u.xingming" />
      </el-select>
      <template #footer>
        <el-button @click="showFollowerSelect=false">取消</el-button>
        <el-button type="primary" @click="confirmAssignFollower">确认</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Edit, Check, List, Refresh, Picture, ArrowLeft, ArrowRight, User, ChatDotRound, ZoomIn } from '@element-plus/icons-vue'
import axios from 'axios'

const list = ref<any[]>([])
const selected = ref<any>(null)
const submitting = ref(false)
const viewAll = ref(false)  // 查询所有待修改问题，默认false（只查自己的）
const viewTaolun = ref(false)  // 查询待讨论，默认false（查taolunbz=N）

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

// 格式化日期
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

// 行颜色：选中行蓝色，测试后返回的问题淡淡的红色
const getRowClass = ({ row }: { row: any }) => {
  if (selected.value?.id === row.id) return 'selected-row'
  // 测试后返回的问题：gongchengsbz='N' 且 cssj 不为空
  if (row.gongchengsbz === 'N' && row.cssj) return 'test-returned-row'
  return ''
}

const getJingjiType = (type: string) => {
  if (type === '紧急') return 'danger'
  if (type === '急') return 'warning'
  return 'info'
}

const form = reactive({
  id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', shouzhongcs: '', gongcscs: '', xggcs: '', shishiry: '', jingjicd: '一般', shouhoucs: '', shcsgcs: '', cssj: null as any, lvrusj: null as any
})

// 空表单模板，用于刷新时清空
const emptyForm = {
  id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', shouzhongcs: '', gongcscs: '', xggcs: '', shishiry: '', jingjicd: '一般', shouhoucs: '', shcsgcs: '', cssj: null, lvrusj: null
}

const loadList = async () => {
  const userStr = localStorage.getItem('user')
  const user = userStr ? JSON.parse(userStr) : null
  const params: any = { gongchengsbz: 'N' }
  
  // 待讨论查询条件：打勾查taolunbz='Y'，否则查taolunbz='N'
  params.taolunbz = viewTaolun.value ? 'Y' : 'N'
  
  // 时间范围条件（问题处理页按 lvrusj 录入时间查询）
  if (startDate.value) params.startDate = startDate.value
  if (endDate.value) params.endDate = endDate.value
  params.dateField = 'lvrusj'
  
  // 获取当前登录者名称（多种方式兜底）
  const currentUserName = user?.realName || user?.username || localStorage.getItem('username') || ''
  
  // 不打勾：只查询研发人员为当前登录者的数据
  if (!viewAll.value && currentUserName) {
    params.xggcs = currentUserName
  }
  
  try {
    console.log('查询参数:', params, 'viewAll:', viewAll.value, 'viewTaolun:', viewTaolun.value)
    const res = await axios.get('/api/feedback', { params })
    console.log('查询结果:', res.data)
    list.value = res?.data?.data?.list || res?.data?.list || []
  } catch (err) { console.error('加载列表失败', err) }
}

// 刷新：清空上面表单数据，重新加载列表
const handleRefresh = () => {
  selected.value = null
  Object.assign(form, emptyForm)
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
const hasImages = ref(false)  // 当前选中问题是否有图片


const userList = ref([])
const yanfaList = ref([])  // 研发人员列表
const shishiList = ref([])  // 实施人员列表
const showDevSelect = ref(false)
const selectedDev = ref('')
const showFollowerSelect = ref(false)  // 分配跟进人弹窗
const selectedFollower = ref('')  // 选中的跟进人

const loadUsers = async () => {
  try {
    const res = await axios.get('/api/staff')
    userList.value = res.data?.data?.list || []
    // category字段: 包含"1"=研发人员, 包含"0"=实施人员
    yanfaList.value = userList.value.filter((u: any) => String(u.category || '').includes('1'))
    shishiList.value = userList.value.filter((u: any) => String(u.category || '').includes('0'))
  } catch(e) { console.error(e) }
}

const handleAssign = async () => {
  if (!selected.value) { alert("请选择一个问题"); return; }
  if (yanfaList.value.length === 0) await loadUsers()
  selectedDev.value = selected.value.xggcs || ''
  showDevSelect.value = true
}

const confirmAssign = async () => {
  if (!selectedDev.value) { alert("请选择研发人员"); return; }
  axios.put("/api/feedback/" + selected.value.id + "/assign-dev", {xggcs: selectedDev.value})
    .then(() => { alert("分配成功"); showDevSelect.value = false; loadList(); })
    .catch(() => alert("分配失败"))
}

// 分配跟进人（完善功能）
const handleAssignFollower = async () => {
  if (!selected.value) { ElMessage.warning('请先选择一个问题'); return }
  if (shishiList.value.length === 0) await loadUsers()
  selectedFollower.value = selected.value.shishiry || ''
  showFollowerSelect.value = true
}

// 确认分配跟进人
const confirmAssignFollower = async () => {
  if (!selectedFollower.value) { alert("请选择实施人员"); return; }
  try {
    await axios.put("/api/feedback/" + selected.value.id, { shishiry: selectedFollower.value })
    ElMessage.success('分配跟进人成功')
    showFollowerSelect.value = false
    loadList()
  } catch (err) {
    ElMessage.error('分配跟进人失败')
  }
}


const previewImages = ref<string[]>([])
const currentIndex = ref(0)
const imageViewerVisible = ref(false)  // 全屏图片查看器状态

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

const handleSubmit = async () => {
  if (!form.gongcscs) { ElMessage.warning('请填写处理意见'); return }
  try {
    await ElMessageBox.confirm('确定要确认处理该问题吗？确认后问题将进入待测试状态。', '确认处理', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
  } catch {
    return  // 用户取消
  }
  submitting.value = true
  try {
    await axios.put('/api/feedback/' + form.id, { gongcscs: form.gongcscs, gongchengsbz: 'Y' })
    ElMessage.success('处理成功')
    form.gongcscs = ''
    selected.value = null
    hasImages.value = false
    // 重置表单
    Object.assign(form, { id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', gongcscs: '', xggcs: '', shishiry: '', jingjicd: '一般', shouhoucs: '', shcsgcs: '', cssj: null })
    loadList()
  } catch (err) { ElMessage.error('处理失败') }
  finally { submitting.value = false }
}

// 待讨论（确认后修改taolunbz为Y）
const handleDiscuss = () => {
  if (!selected.value) { ElMessage.warning('请先选择一个问题'); return }
  ElMessageBox.confirm('确定要把该问题放入待讨论中吗？', '待讨论确认', {
    confirmButtonText: '确定',
    cancelButtonText: '取消',
    type: 'warning'
  }).then(async () => {
    try {
      await axios.put('/api/feedback/' + selected.value.id, { taolunbz: 'Y' })
      ElMessage.success('已放入待讨论')
      loadList()
    } catch (err) {
      ElMessage.error('操作失败')
    }
  }).catch(() => {})
}

// 返回待处理：将 gongchengsbz 修改为 N，将 taolunbz 修改为 N
const handleReturnToPending = async (row: any) => {
  try {
    await ElMessageBox.confirm('确定要将该问题返回待处理吗？返回后工程师可以重新处理。', '返回待处理', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await axios.put('/api/feedback/' + row.id, { gongchengsbz: 'N', taolunbz: 'N' })
    ElMessage.success('已返回待处理')
    loadList()
  } catch (e: any) {
    if (e !== 'cancel') ElMessage.error('操作失败')
  }
}

// 删除问题
const handleDeleteProblem = async (row: any) => {
  try {
    await ElMessageBox.confirm(`确定要删除问题 ID=${row.id} 吗？删除后不可恢复。`, '删除确认', {
      confirmButtonText: '确定',
      cancelButtonText: '取消',
      type: 'warning'
    })
    await axios.delete('/api/feedback/' + row.id)
    ElMessage.success('删除成功')
    loadList()
  } catch (e: any) {
    if (e !== 'cancel') ElMessage.error('删除失败')
  }
}

onMounted(() => { loadList() })
</script>

<style scoped>
.handle-page { padding: 0; height: calc(100vh - 100px); display: flex; flex-direction: column; gap: 1px; overflow: hidden; }
.card-header { display: flex; justify-content: space-between; align-items: center; gap: 10px; flex-wrap: wrap; }
.form-header { display: flex; justify-content: flex-start; align-items: center; }
.header-filters { display: flex; align-items: center; gap: 3px; margin-left: 10px; flex-wrap: wrap; }
.header-filters .el-checkbox { margin-right: 8px !important; }
.header-actions { display: flex; align-items: center; margin-left: auto; flex-shrink: 0; }
.header-actions .el-button { margin-left: 0 !important; margin-right: 4px !important; }

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
.header-right { display: flex; align-items: center; gap: 16px; }
.button-group { display: flex; gap: 3px; }
.form-card { flex-shrink: 0; margin: 0; }
.form-card :deep(.el-card__body) { padding-top: 12px; padding-bottom: 1px; padding-left: 20px; padding-right: 20px; }
.table-card { flex: 1; min-height: 0; overflow: hidden; margin: 0; }

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

/* 确认处理 - 莫兰迪绿（柔和、沉稳，表示完成确认） */
.morandi-green {
  background: linear-gradient(135deg, #8FAF8F 0%, #7A9E7A 100%) !important;
}
.morandi-green:hover {
  background: linear-gradient(135deg, #9DBB9D 0%, #8FAF8F 100%) !important;
}

/* 查看图片 - 莫兰迪黄（柔和、温暖，表示查看浏览） */
.morandi-yellow {
  background: linear-gradient(135deg, #C9C08F 0%, #B8AF7E 100%) !important;
}
.morandi-yellow:hover {
  background: linear-gradient(135deg, #D4CC9E 0%, #C9C08F 100%) !important;
}

/* 分配修改人 - 莫兰迪蓝（沉稳、专业，表示分配任务） */
.morandi-blue {
  background: linear-gradient(135deg, #7B8FA1 0%, #6A7E90 100%) !important;
}
.morandi-blue:hover {
  background: linear-gradient(135deg, #8FA3B8 0%, #7B8FA1 100%) !important;
}

/* 分配跟进人 - 莫兰迪紫（优雅、协作，表示跟进配合） */
.morandi-purple {
  background: linear-gradient(135deg, #A69CAC 0%, #958B9B 100%) !important;
}
.morandi-purple:hover {
  background: linear-gradient(135deg, #B5A9B8 0%, #A69CAC 100%) !important;
}

/* 待讨论 - 莫兰迪橙（温暖、活跃，表示讨论待处理） */
.morandi-orange {
  background: linear-gradient(135deg, #C9A87C 0%, #B8976B 100%) !important;
}
.morandi-orange:hover {
  background: linear-gradient(135deg, #D4B58F 0%, #C9A87C 100%) !important;
}

.action-buttons { display: flex; gap: 6px; justify-content: center; flex-wrap: nowrap; white-space: nowrap; }
.action-buttons .el-button { flex-shrink: 0; }
.card-header span { display: flex; align-items: center; gap: 8px; font-weight: 600; }
.form-card { flex-shrink: 0; }
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
.info-value.textarea { white-space: pre-wrap; flex: 1; overflow-y: auto; overflow-x: hidden; }
.large-text { font-size: 14px; line-height: 1.6; }
.opinion-input { flex: 1; display: flex; flex-direction: column; }
.opinion-input :deep(.el-textarea) { flex: 1; }
.opinion-input :deep(.el-textarea__inner) { height: 138px !important; min-height: 138px !important; max-height: 138px !important; overflow-y: auto; resize: none; }

/* 测试返回信息样式 */
.test-return-info { background: #fef0f0 !important; border: 1px solid #fbc4c4; }
.test-result-row { margin-bottom: 8px; }
.test-result-box { background: #fef0f0 !important; border: 1px solid #fbc4c4; padding: 10px 14px; }

.table-card { flex: 1; min-height: 0; overflow: hidden; }
.table-card :deep(.el-card__body) { height: 100%; padding: 0; }
.table-card :deep(.el-table) { font-size: 13px; }

/* 选中行蓝色 */
:deep(.selected-row) { background: #ecf5ff !important; }

/* 测试后返回的问题行颜色：淡淡的红色 */
:deep(.test-returned-row) { background: #fef0f0 !important; }

:deep(.el-table__row:hover) { cursor: pointer; }
.carousel-container { text-align: center; }
.carousel-wrapper { min-height: 400px; display: flex; align-items: center; justify-content: center; background: #f5f7fa; border-radius: 8px; }
.carousel-image { max-width: 100%; max-height: 500px; object-fit: contain; }
.carousel-controls { display: flex; align-items: center; justify-content: center; gap: 20px; margin-top: 16px; }
.indicator { font-weight: 600; color: #409eff; min-width: 60px; }
.viewer-tip { margin-top: 12px; padding: 8px 12px; background: #ecf5ff; color: #409eff; border-radius: 4px; font-size: 12px; text-align: center; }
</style>
