<!-- Sat Mar 21 16:31:58 CST 2026 -->
<template>
  <div class="feedback-container">
    <el-card class="main-card" shadow="hover">
      <template #header>
        <div class="card-header">
          <span>问题反馈</span>
          <el-button type="primary" @click="loadData"><el-icon><Refresh /></el-icon> 刷新</el-button>
        </div>
      </template>
      
      <el-form :inline="true" :model="searchForm" class="search-form">
        <el-form-item label="医院">
          <el-input v-model="searchForm.yiyuanmc" placeholder="输入医院名称搜索" clearable @keyup.enter="handleSearch" />
        </el-form-item>
        <el-form-item label="模块">
          <el-input v-model="searchForm.mokuai" placeholder="输入模块搜索" clearable @keyup.enter="handleSearch" />
        </el-form-item>
        <el-form-item label="流水号">
          <el-input v-model="searchForm.lsh" placeholder="输入流水号" clearable @keyup.enter="handleSearch" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleSearch"><el-icon><Search /></el-icon> 搜索</el-button>
          <el-button @click="handleResetSearch">重置</el-button>
          <el-button type="success" @click="handleAdd"><el-icon><Plus /></el-icon> 新增问题</el-button>
        </el-form-item>
      </el-form>
      
      <el-table :data="tableData" border v-loading="loading" stripe>
        <el-table-column prop="lsh" label="流水号" width="80" />
        <el-table-column prop="banben" label="软件版本" width="100" />
        <el-table-column prop="yiyuanmc" label="医院名称" width="150" />
        <el-table-column prop="shishiry" label="实施人员" width="90" />
        <el-table-column prop="mokuai" label="模块" width="100" />
        <el-table-column prop="chuangtimc" label="窗体" width="100" />
        <el-table-column prop="xggcs" label="工程师" width="80" />
        <el-table-column prop="jingjicd" label="紧急程度" width="80">
          <template #default="{ row }">
            <el-tag v-if="row.jingjicd === '紧急'" type="danger" size="small">紧急</el-tag>
            <el-tag v-else-if="row.jingjicd === '急'" type="warning" size="small">急</el-tag>
            <el-tag v-else type="info" size="small">一般</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="wentism" label="问题说明" min-width="150" show-overflow-tooltip />
        <el-table-column label="图片" width="80">
          <template #default="{ row }">
            <el-button type="primary" link size="small" @click="viewImages(row)">查看</el-button>
          </template>
        </el-table-column>
        <el-table-column prop="lvrusj" label="录入时间" width="160" />
        <el-table-column label="操作" width="120" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link @click="handleEdit(row)">编辑</el-button>
            <el-button type="danger" link @click="handleDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <el-pagination v-model:current-page="pagination.page" v-model:page-size="pagination.pageSize" :total="pagination.total" :page-sizes="[10,20,50,100]" layout="total,sizes,prev,pager,next,jumper" @size-change="loadData" @current-change="loadData" style="margin-top:20px;justify-content:flex-end;" />
    </el-card>
    
    <!-- 新增/编辑对话框 -->
    <el-dialog v-model="dialogVisible" :title="isEdit ? '编辑问题' : '新增问题'" width="900px" :close-on-click-modal="false" destroy-on-close>
      <el-form :model="form" :rules="rules" ref="formRef" label-width="100px">
        <el-row :gutter="20">
          <el-col :span="6">
            <el-form-item label="流水号">
              <div class="lsh-box">
                <el-input v-model="form.lsh" disabled><template #prefix><el-icon><Tickets /></el-icon></template></el-input>
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="18">
            <el-form-item label="紧急程度" prop="jingjicd">
              <div class="priority-box">
                <el-button :type="form.jingjicd === '紧急' ? 'danger' : 'default'" @click="form.jingjicd = '紧急'" :class="{ active: form.jingjicd === '紧急'}">紧急</el-button>
                <el-button :type="form.jingjicd === '急' ? 'warning' : 'default'" @click="form.jingjicd = '急'" :class="{ active: form.jingjicd === '急'}">急</el-button>
                <el-button :type="form.jingjicd === '一般' ? 'info' : 'default'" @click="form.jingjicd = '一般'" :class="{ active: form.jingjicd === '一般'}">一般</el-button>
              </div>
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="软件版本" prop="banben">
              <el-select v-model="form.banben" placeholder="请选择" class="full-width">
                <el-option label="HIS问题" value="HIS问题" />
                <el-option label="医保接口" value="医保接口" />
                <el-option label="其它问题" value="其它问题" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="16">
            <el-form-item label="医院名称" prop="yiyuanmc">
              <el-select v-model="form.yiyuanmc" placeholder="请搜索选择" filterable :filter-method="filterHospital" class="full-width">
                <el-option v-for="h in hospitals" :key="h.id" :label="h.label" :value="h.value" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="模块" prop="mokuai">
              <el-select v-model="form.mokuai" placeholder="请选择" class="full-width" @change="onModuleChange">
                <el-option v-for="m in modules" :key="m.id" :label="m.mokuaimc || '未知模块'" :value="m.mokuaimc || '未知模块'" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="窗体" prop="chuangtimc">
              <el-select v-model="form.chuangtimc" placeholder="请选择" class="full-width" :disabled="!form.mokuai">
                <el-option v-for="f in forms" :key="f.id" :label="f.chuangtimc" :value="f.chuangtimc" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="实施人员" prop="shishiry">
              <el-select v-model="form.shishiry" placeholder="请选择" class="full-width">
                <el-option v-for="e in engineers" :key="e.id" :label="e.label" :value="e.value" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="工程师" prop="xggcs">
              <el-select v-model="form.xggcs" placeholder="请选择" class="full-width">
                <el-option v-for="e in engineers" :key="e.id" :label="e.xingming" :value="e.xingming" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-form-item label="问题说明" prop="wentism">
          <el-input v-model="form.wentism" type="textarea" :rows="4" placeholder="请详细描述问题..." />
        </el-form-item>
        
        <el-form-item label="测试意见" prop="shouzhongcs">
          <el-input v-model="form.shouzhongcs" type="textarea" :rows="3" placeholder="请填写测试人员意见..." />
        </el-form-item>
        
        <el-form-item label="问题截图">
          <div @paste="handlePaste" class="upload-area">
            <el-upload ref="uploadRef" v-model:file-list="uploadFileList" action="/api/feedback/upload" list-type="picture-card" :auto-upload="false" :on-preview="handlePreview" :on-remove="handleRemove" :limit="5" accept="image/*" drag multiple>
              <el-icon class="upload-icon"><Plus /></el-icon>
              <div class="upload-text">拖拽或点击选择<br/>Ctrl+V 粘贴图片</div>
            </el-upload>
          </div>
        </el-form-item>
      </el-form>
      
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="handleSubmit" :loading="submitting">保存</el-button>
      </template>
    </el-dialog>
    
    <!-- 图片预览 - 轮播形式 -->
    <el-dialog v-model="previewVisible" title="问题截图" width="750px" @close="currentIndex = 0">
      <div class="carousel-container">
        <div class="carousel-wrapper">
          <img 
            v-if="previewImages.length > 0" 
            :src="previewImages[currentIndex]" 
            alt="预览" 
            class="carousel-image"
          />
          <el-empty v-else description="暂无图片" />
        </div>
        <div class="carousel-controls" v-if="previewImages.length > 1">
          <el-button circle @click="prevImage" :disabled="currentIndex === 0">
            <el-icon><ArrowLeft /></el-icon>
          </el-button>
          <span class="carousel-indicator">{{ currentIndex + 1 }} / {{ previewImages.length }}</span>
          <el-button circle @click="nextImage" :disabled="currentIndex === previewImages.length - 1">
            <el-icon><ArrowRight /></el-icon>
          </el-button>
        </div>
        <div class="carousel-thumbnails" v-if="previewImages.length > 1">
          <div 
            v-for="(img, idx) in previewImages" 
            :key="idx"
            class="thumbnail"
            :class="{ active: idx === currentIndex }"
            @click="currentIndex = idx"
          >
            <img :src="img" />
          </div>
        </div>
        <div class="carousel-actions" v-if="previewImages.length > 0">
          <el-button type="danger" @click="deleteCurrentImage">
            <el-icon><Delete /></el-icon> 删除当前图片
          </el-button>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted, computed } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Search, Refresh, Plus, Tickets, Delete } from '@element-plus/icons-vue'
import api from '@/api'

const loading = ref(false)
const submitting = ref(false)
const dialogVisible = ref(false)
const previewVisible = ref(false)
const previewImages = ref<string[]>([])
const currentIndex = ref(0)
const isEdit = ref(false)

const prevImage = () => {
  if (currentIndex.value > 0) currentIndex.value--
}

const nextImage = () => {
  if (currentIndex.value < previewImages.value.length - 1) currentIndex.value++
}

const deleteCurrentImage = async () => {
  try {
    await ElMessageBox.confirm(`确定要删除第 ${currentIndex.value + 1} 张图片吗？`, '提示', { type: 'warning' })
    const filename = previewImages.value[currentIndex.value].split('/').pop()
    if (filename) {
      await api.delete(`/feedback/image/${filename}`)
    }
    previewImages.value.splice(currentIndex.value, 1)
    if (currentIndex.value >= previewImages.value.length && currentIndex.value > 0) {
      currentIndex.value = previewImages.value.length - 1
    }
    ElMessage.success('删除成功')
  } catch (e: any) {
    if (e !== 'cancel') ElMessage.error(e.message || '删除失败')
  }
}
const formRef = ref()
const uploadRef = ref()

const hospitals = ref<any[]>([])
const engineers = ref<any[]>([])
const modules = ref<any[]>([])
const forms = ref<any[]>([])
const tableData = ref<any[]>([])
const uploadFileList = ref<any[]>([])

const searchForm = reactive({ yiyuanmc: '', mokuai: '', lsh: '' })
const form = reactive({
  id: 0, lsh: '', banben: 'HIS问题', yiyuanmc: '', shishiry: '', mokuai: '', chuangtimc: '', xggcs: '', jingjicd: '一般', wentism: '', shouzhongcs: ''
})

const rules = {
  banben: [{ required: true, message: '请选择软件版本', trigger: 'change' }],
  yiyuanmc: [{ required: true, message: '请选择医院', trigger: 'change' }],
  shishiry: [{ required: true, message: '请选择实施人员', trigger: 'change' }],
  mokuai: [{ required: true, message: '请选择模块', trigger: 'change' }],
  chuangtimc: [{ required: true, message: '请选择窗体', trigger: 'change' }],
  xggcs: [{ required: true, message: '请选择工程师', trigger: 'change' }],
  jingjicd: [{ required: true, message: '请选择紧急程度', trigger: 'change' }],
  wentism: [{ required: true, message: '请填写问题说明', trigger: 'blur' }]
}

const pagination = reactive({ page: 1, pageSize: 10, total: 0 })

const loadDicts = async () => {
  try {
    console.log('开始加载字典数据')
    const [h, e, m] = await Promise.all([api.get('/dict/hospitals'), api.get('/dict/engineers'), api.get('/dict/modules')])
    console.log('医院数据:', h)
    console.log('工程师数据:', e)
    console.log('模块数据:', m)
    hospitals.value = h.data?.data || h.data || []
    engineers.value = e.data?.data || e.data || []
    // 处理模块数据，确保字段名正确
    modules.value = (m.data?.data || m.data || []).map((item: any) => ({
      id: item.id,
      mokuaimc: item.mokuaimc,
      mokuai: item.mokuaimc
    }))
    console.log('处理后的模块数据:', modules.value)
  } catch (err) { console.error('加载字典失败:', err, err?.response?.data); ElMessage.error('加载失败: ' + (err?.message || '未知错误')) }
}

const loadData = async () => {
  loading.value = true
  try {
    const res = await api.get('/feedback', { params: { page: pagination.page, pageSize: pagination.pageSize, yiyuanmc: searchForm.yiyuanmc || undefined, mokuai: searchForm.mokuai || undefined, lsh: searchForm.lsh || undefined } })
    tableData.value = res?.list || res?.data?.list || []
    pagination.total = res?.total || res?.data?.total || 0
  } catch (err) { console.error('加载列表失败:', err, err?.response?.data); ElMessage.error('加载失败: ' + (err?.message || '未知错误')) }
  finally { loading.value = false }
}

const handleSearch = () => { pagination.page = 1; loadData() }
const handleResetSearch = () => { searchForm.yiyuanmc = ''; searchForm.mokuai = ''; searchForm.lsh = ''; handleSearch() }

// 医院搜索方法，支持拼音码检索
const filterHospital = (query: string, option: any) => {
  if (!query) return true
  // 转换为小写进行比较
  const lowerQuery = query.toLowerCase()
  // 检查医院名称是否包含搜索词
  if (option.label.toLowerCase().includes(lowerQuery)) return true
  // 检查医院拼音码是否包含搜索词（假设医院数据中包含拼音码字段）
  if (option.pinyin && option.pinyin.toLowerCase().includes(lowerQuery)) return true
  return false
}

const onModuleChange = async (module: string) => {
  form.chuangtimc = ''
  forms.value = []
  if (!module) return
  try { 
    const res = await api.get(`/dict/forms?module=${module}`)
    // 处理后端返回的数据结构，确保字段名正确
    forms.value = (res?.data?.data || res?.data || res || []).map((item: any) => ({
      id: item.id,
      chuangtimc: item.chuangtimc || item.label
    }))
  } catch (err) { console.error('加载窗体失败:', err) }
}

const getLsh = async () => {
  try { const res = await api.get('/feedback/getLsh'); form.lsh = res?.lsh || res?.data?.lsh || Date.now().toString() } 
  catch (err) { form.lsh = Date.now().toString() }
}

const handleAdd = async () => {
  isEdit.value = false
  Object.assign(form, { id: 0, lsh: '', banben: 'HIS问题', yiyuanmc: '', shishiry: '', mokuai: '', chuangtimc: '', xggcs: '', jingjicd: '一般', wentism: '', shouzhongcs: '' })
  uploadFileList.value = []
  forms.value = []
  await getLsh()
  dialogVisible.value = true
}

const handleEdit = async (row: any) => {
  isEdit.value = true
  Object.assign(form, row)
  uploadFileList.value = []
  forms.value = []
  try {
    const imgs = await axios.get(`/feedback/images/${row.id}`)
    if (imgs && imgs.length > 0) {
      uploadFileList.value = imgs.map((name: string) => ({ name, url: `/api/feedback/uploads/${name}`, status: 'success' }))
    }
  } catch (err) { console.error('加载图片失败:', err) }
  if (form.mokuai) {
    try { 
      const res = await axios.get(`/dict/forms?module=${form.mokuai}`)
      // 处理后端返回的数据结构，确保字段名正确
      forms.value = (res?.data?.data || res?.data || res || []).map((item: any) => ({
        id: item.id,
        chuangtimc: item.chuangtimc || item.label
      }))
    } catch (err) { console.error('加载窗体失败:', err) }
  }
  dialogVisible.value = true
}

const handleDelete = async (row: any) => {
  try {
    await ElMessageBox.confirm('确定要删除该问题吗？', '提示', { type: 'warning' })
    await api.delete(`/feedback/${row.id}`)
    ElMessage.success('删除成功')
    loadData()
  } catch (err: any) { if (err !== 'cancel') ElMessage.error(err.message || '删除失败') }
}

// 编辑对话框中预览图片 - 使用轮播
const handlePreview = (file: any) => {
  previewImages.value = uploadFileList.value.map(f => f.url)
  currentIndex.value = previewImages.value.findIndex(url => url === file.url)
  previewVisible.value = true
}
// 编辑对话框中删除单张图片 - 带确认提示
const handleRemove = async (file: any, fileList: any) => {
  try {
    await ElMessageBox.confirm('确定要删除当前图片吗？', '提示', { type: 'warning' })
    // 如果文件已上传到服务器，调用后端删除接口
    if (file.url && file.name) {
      const filename = file.name || file.url.split('/').pop()
      if (filename) {
        await api.delete(`/feedback/image/${filename}`)
      }
    }
    // 从列表中移除
    const idx = uploadFileList.value.findIndex(f => f.url === file.url)
    if (idx > -1) uploadFileList.value.splice(idx, 1)
    ElMessage.success('删除成功')
  } catch (e: any) {
    if (e !== 'cancel') ElMessage.error(e.message || '删除失败')
  }
}

// 删除预览中的图片（带确认）
const deleteImageConfirm = async (idx: number) => {
  try {
    await ElMessageBox.confirm('确定要删除这张图片吗？', '提示', { type: 'warning' })
    previewImages.value.splice(idx, 1)
    ElMessage.success('删除成功')
  } catch (e) {}
}

// 粘贴图片
const handlePaste = (event: ClipboardEvent) => {
  const items = event.clipboardData?.items
  if (!items) return
  for (const item of items) {
    if (item.type.startsWith('image/')) {
      const file = item.getAsFile()
      if (file) {
        const url = URL.createObjectURL(file)
        uploadFileList.value.push({ name: file.name, url, raw: file, status: 'ready' })
      }
    }
  }
}

// 查看图片
const viewImages = async (row: any) => {
  try {
    const imgs = await axios.get(`/feedback/images/${row.id}`)
    if (imgs && imgs.length > 0) {
      previewImages.value = imgs.map((name: string) => `/api/feedback/uploads/${name}`)
    } else {
      previewImages.value = []
    }
  } catch (err) { 
    console.error('加载图片失败:', err)
    previewImages.value = []
  }
  previewVisible.value = true
}

const handleSubmit = async () => {
  try {
    await formRef.value.validate()
    submitting.value = true
    
    const data = { ...form }
    if (!isEdit.value) data.shouzhongbz = 'Y'
    
    let savedId = form.id
    if (isEdit.value) {
      await api.put(`/feedback/${form.id}`, data)
      // 编辑模式下只更新图片，不删除旧的（用户手动删除的图片已在handleRemove中删除）
    } else {
      const res = await axios.post('/feedback', data)
      savedId = res?.id || res?.data?.id || (res && typeof res === 'object' && 'id' in res ? res.id : form.id)
    }
    
    // 上传图片 - 修复：编辑模式下需要计算已有图片数量来确定序号起点
    const rawFiles = uploadFileList.value.filter(f => f.raw)
    // 编辑模式下，获取已有图片数量（非raw的，即已上传的）
    const existingImageCount = isEdit.value ? uploadFileList.value.filter(f => !f.raw).length : 0
    for (let i = 0; i < rawFiles.length; i++) {
      const formData = new FormData()
      formData.append('file', rawFiles[i].raw)
      // 序号 = 已有数量 + i + 1
      formData.append('feedbackId', `${savedId}-${existingImageCount + i + 1}`)
      try {
        await axios.post('/feedback/upload', formData, { headers: { 'Content-Type': 'multipart/form-data' } })
      } catch (err) { console.error('上传图片失败:', err) }
    }
    
    ElMessage.success(isEdit.value ? '更新成功' : '保存成功')
    dialogVisible.value = false
    loadData()
  } catch (err: any) {
    if (err !== 'cancel') ElMessage.error(err.message || '保存失败')
  } finally {
    submitting.value = false
  }
}

onMounted(() => { loadDicts(); loadData() })
</script>

<style scoped>
.feedback-container { padding: 20px; }
.card-header { display: flex; justify-content: space-between; align-items: center; }
.search-form { margin-bottom: 20px; }
.full-width { width: 100%; }
.lsh-box :deep(.el-input__wrapper) { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; }
.lsh-box :deep(.el-input__inner) { color: white; font-weight: bold; }
.priority-box { display: flex; gap: 10px; }
.priority-box .el-button { min-width: 80px; font-weight: bold; }
.priority-box .el-button.active { transform: scale(1.1); box-shadow: 0 4px 12px rgba(0,0,0,0.2); }
.upload-area { width: 100%; }
.upload-icon { font-size: 28px; color: #999; }
.upload-text { font-size: 12px; color: #999; margin-top: 8px; text-align: center; line-height: 1.6; }
.image-viewer-container { padding: 20px; }
.image-grid { display: flex; flex-wrap: wrap; gap: 20px; justify-content: center; }
.image-item { flex: 0 0 auto; max-width: 45%; }
.image-item .el-image { width: 100%; }

/* 轮播样式 */
.carousel-container { text-align: center; }
.carousel-wrapper { display: flex; align-items: center; justify-content: center; min-height: 450px; background: #f5f7fa; border-radius: 8px; overflow: hidden; }
.carousel-image { max-width: 100%; max-height: 500px; object-fit: contain; }
.carousel-controls { display: flex; align-items: center; justify-content: center; gap: 20px; margin: 20px 0; }
.carousel-indicator { font-size: 16px; font-weight: 600; color: #409eff; min-width: 60px; }
.carousel-thumbnails { display: flex; justify-content: center; gap: 10px; flex-wrap: wrap; margin-top: 15px; }
.thumbnail { width: 60px; height: 60px; border-radius: 6px; overflow: hidden; cursor: pointer; border: 2px solid transparent; transition: all 0.3s; }
.thumbnail:hover { border-color: #409eff; }
.thumbnail.active { border-color: #409eff; box-shadow: 0 0 8px rgba(64, 158, 255, 0.5); }
.thumbnail img { width: 100%; height: 100%; object-fit: cover; }
.carousel-actions { margin-top: 20px; }
</style>
rebuild