<template>
  <el-dialog :model-value="modelValue" width="900px" :close-on-click-modal="false" destroy-on-close
    class="view-problem-dialog" @close="handleClose" @update:model-value="handleClose">
    <template #header>
      <div style="display: flex; align-items: center; justify-content: space-between; padding-right: 24px;">
        <span style="font-size: 18px; font-weight: 600; color: var(--el-text-color-primary);">查看问题</span>
        <span :style="viewStatusStyle">{{ viewStatusText }}</span>
      </div>
    </template>

    <el-form :model="form" label-width="100px">
      <el-row :gutter="10">
        <el-col :span="5">
          <el-form-item label="问题ID号">
            <el-input :model-value="form.id" readonly />
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="录入时间">
            <el-input :model-value="formatDate(form.lvrusj)" readonly />
          </el-form-item>
        </el-col>
        <el-col :span="4">
          <el-form-item label="紧急程度">
            <el-tag :type="getJingjiType(form.jingjicd)">{{ form.jingjicd || '-' }}</el-tag>
          </el-form-item>
        </el-col>
        <el-col :span="7">
          <el-form-item label="售后到期日">
            <el-input :model-value="syq" readonly />
          </el-form-item>
        </el-col>
      </el-row>

      <el-row :gutter="10">
        <el-col :span="8">
          <el-form-item label="软件版本">
            <el-input :model-value="form.banben" readonly />
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="问题类型">
            <el-input :model-value="form.wentilx || '其它问题'" readonly />
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="医院名称">
            <el-input :model-value="form.yiyuanmc" readonly />
          </el-form-item>
        </el-col>
      </el-row>

      <el-row :gutter="10">
        <el-col :span="8">
          <el-form-item label="模块">
            <el-input :model-value="form.mokuai" readonly />
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="窗体">
            <el-input :model-value="form.chuangtimc" readonly />
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="跟进人员">
            <el-input :model-value="form.shishiry" readonly />
          </el-form-item>
        </el-col>
      </el-row>

      <el-row :gutter="10">
        <el-col :span="8">
          <el-form-item label="工程师">
            <el-input :model-value="form.xggcs" readonly />
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="反馈人">
            <el-input :model-value="form.szcsgcs" readonly />
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="反馈渠道">
            <el-input :model-value="form.FanKuiQD" readonly />
          </el-form-item>
        </el-col>
      </el-row>

      <el-form-item label="问题说明">
        <el-input :model-value="form.wentism" type="textarea" :rows="4" readonly />
      </el-form-item>

      <el-form-item label="工程师处理意见" v-if="form.gongcscs">
        <el-input :model-value="form.gongcscs" type="textarea" :rows="3" readonly />
      </el-form-item>

      <el-form-item label="测试意见" v-if="form.shouzhongcs">
        <el-input :model-value="form.shouzhongcs" type="textarea" :rows="3" readonly />
      </el-form-item>

      <!-- 处理信息 -->
      <el-divider v-if="form.xgsj" content-position="left">处理信息</el-divider>
      <el-row v-if="form.xgsj" :gutter="10">
        <el-col :span="8">
          <el-form-item label="处理人">
            <el-input :model-value="form.xggcs" readonly />
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="处理时间">
            <el-input :model-value="formatDate(form.xgsj)" readonly />
          </el-form-item>
        </el-col>
      </el-row>

      <!-- 测试返回信息 -->
      <el-divider v-if="form.fanhuisj" content-position="left">测试返回信息</el-divider>
      <el-row v-if="form.fanhuisj" :gutter="10">
        <el-col :span="8">
          <el-form-item label="测试人员">
            <el-input :model-value="form.shcsgcs" readonly />
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="返回时间">
            <el-input :model-value="formatDate(form.fanhuisj)" readonly />
          </el-form-item>
        </el-col>
      </el-row>
      <el-form-item v-if="form.shouhoucs" label="测试结果">
        <el-input :model-value="form.shouhoucs" type="textarea" :rows="2" readonly style="color: #f56c6c" />
      </el-form-item>

      <!-- 附件操作区：查看图片 / 下载文件（同问题测试页逻辑，有内容才可用） -->
      <el-form-item v-if="attachItems.length > 0 || fileAttachItems.length > 0">
        <div style="display: flex; gap: 8px;">
          <el-button class="morandi-btn morandi-blue" :disabled="!hasImages" @click="openImagesViewer">
            <el-icon><Picture /></el-icon> 查看图片
          </el-button>
          <el-button class="morandi-btn morandi-blue" :disabled="!hasFiles" @click="filesDialogVisible = true">
            <el-icon><FolderOpened /></el-icon> 下载文件
          </el-button>
        </div>
      </el-form-item>

      <div class="view-dialog-actions">
        <el-button class="morandi-btn btn-cancel" @click="handleClose">
          <el-icon><Back /></el-icon> 返回列表
        </el-button>
      </div>
    </el-form>

    <!-- 问题截图窗体（查看图片按钮打开，带上一张/下一张/查看原图） -->
    <el-dialog v-model="imagesDialogVisible" title="问题截图" width="960px" destroy-on-close class="preview-dialog">
      <div class="carousel-container">
        <div class="carousel-wrapper" v-if="attachImages.length > 0">
          <img :src="attachImages[viewerIndex].url" class="carousel-image" @click="openFullImage" style="cursor: zoom-in;" />
        </div>
        <el-empty v-else description="暂无图片" />
        <div class="carousel-controls" v-if="attachImages.length > 1">
          <el-button circle :disabled="viewerIndex === 0" @click="viewerIndex--"><el-icon><ArrowLeft /></el-icon></el-button>
          <span class="indicator">{{ viewerIndex + 1 }} / {{ attachImages.length }}</span>
          <el-button circle :disabled="viewerIndex === attachImages.length - 1" @click="viewerIndex++"><el-icon><ArrowRight /></el-icon></el-button>
        </div>
        <div class="carousel-actions" v-if="attachImages.length > 0" style="margin-top: 16px; text-align: center;">
          <el-button type="primary" @click="openFullImage">
            <el-icon><ZoomIn /></el-icon> 查看原图
          </el-button>
          <el-button type="info" plain @click="imagesDialogVisible = false">
            <el-icon><Back /></el-icon> 返回列表
          </el-button>
        </div>
      </div>
    </el-dialog>

    <!-- 全屏图片查看器 -->
    <el-image-viewer v-if="viewerVisible" :url-list="imageUrlList" :initial-index="viewerIndex" @close="viewerVisible = false" />

    <!-- 下载文件弹窗：列出全部文件（新增页视频/文档 + 处理页上传附件），查看/下载按钮跟在后面 -->
    <el-dialog v-model="filesDialogVisible" width="680px" top="12vh" :show-close="false">
      <template #header>
        <div style="display:flex; align-items:center; justify-content:space-between; width:100%; padding-right:4px;">
          <span>问题文件</span>
          <el-button class="morandi-btn morandi-blue" @click="filesDialogVisible = false">返回列表</el-button>
        </div>
      </template>
      <div class="view-attach-list">
        <div v-for="(item, index) in allFiles" :key="'af' + index" class="view-attach-item">
          <el-icon><Document /></el-icon>
          <span class="view-attach-name" :title="item.name">{{ item.name }}</span>
          <el-button link type="primary" @click="viewAttachItem(item)">查看</el-button>
          <el-button link type="success" @click="downloadAttachItem(item)">下载</el-button>
        </div>
        <el-empty v-if="allFiles.length === 0" description="暂无文件" :image-size="60" />
      </div>
    </el-dialog>
  </el-dialog>
</template>

<script setup lang="ts">
import { ref, reactive, computed, watch } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Back, Document, Picture, FolderOpened, ArrowLeft, ArrowRight, ZoomIn } from '@element-plus/icons-vue'
import axios from 'axios'
import { downloadWithSaveDialog } from '@/utils/saveFile'

// ============ 属性/事件（类比 VB6 窗体的属性与事件参数） ============
const props = defineProps<{
  modelValue: boolean       // 是否显示（v-model）
  problem: any              // 要查看的问题行数据
}>()
const emit = defineEmits<{ (e: 'update:modelValue', v: boolean): void }>()

const form = reactive<any>({})
const attachItems = ref<any[]>([])  // 附件列表（图片/视频/文件）
const viewerVisible = ref(false)    // 全屏图片查看器
const viewerIndex = ref(0)
const syq = ref('-')                // 售后到期日（按医院名称查 xt_ConfigServer.SYQ）

const handleClose = () => emit('update:modelValue', false)

// ============ 状态标签（右上角，莫兰迪四色） ============
// 状态推导：待讨论 > 已处理(工程师已改+测试完成) > 待测试(工程师已改未测试) > 待处理
const getProblemStatus = (row: any) => {
  if (row.taolunbz === 'Y') return '待讨论'
  if (row.gongchengsbz === 'Y' && row.shouhoubz === 'Y') return '已修改'
  if (row.gongchengsbz === 'Y' && row.shouhoubz === 'N') return '待测试'
  return '待修改'
}
const viewStatusText = computed(() => {
  const s = getProblemStatus(form)
  if (s === '待修改') return '待处理'
  if (s === '已修改') return '已处理'
  return s
})
const viewStatusStyle = computed(() => {
  const colors: Record<string, string> = {
    待处理: 'linear-gradient(135deg, #7B8FA1, #6A7E90)', // 莫兰迪蓝
    待测试: 'linear-gradient(135deg, #C9A87C, #B8976B)', // 莫兰迪橙
    已处理: 'linear-gradient(135deg, #8FAF8F, #7A9E7A)', // 莫兰迪绿（已处理固定绿色）
    待讨论: 'linear-gradient(135deg, #E08888, #D07070)', // 莫兰迪红
  }
  return {
    background: colors[viewStatusText.value] || '#909399',
    color: '#ffffff',
    fontSize: '18px',
    fontWeight: '600',
    padding: '6px 18px',
    borderRadius: '6px',
    boxShadow: '0 2px 8px rgba(0,0,0,0.12)',
    lineHeight: '1',
    whiteSpace: 'nowrap'
  }
})

// ============ 附件加载与预览 ============
const getAttachType = (name: string) => {
  if (/\.(jpg|jpeg|png|gif|bmp|webp|svg)$/i.test(name)) return 'image'
  if (/\.(mp4|webm|avi|mov|mkv|flv)$/i.test(name)) return 'video'
  return 'file'
}
const toAttachItem = (name: string) => {
  const url = `/api/feedback/uploads/${name}`
  return { url, type: getAttachType(name), name }
}
const fileAttachItems = ref<any[]>([])  // 问题处理页上传的文件附件（fileUploadPath 目录）

// 问题附件区拆成两类：图片保持小图预览，视频/文件走列表
const attachImages = computed(() => attachItems.value.filter(i => i.type === 'image'))
const attachFiles = computed(() => attachItems.value.filter(i => i.type !== 'image'))

// 查看页附件操作按钮状态：查看图片 / 下载文件
const hasImages = computed(() => attachImages.value.length > 0)
const allFiles = computed(() => [...attachFiles.value, ...fileAttachItems.value])
const hasFiles = computed(() => allFiles.value.length > 0)
const filesDialogVisible = ref(false)  // 下载文件弹窗
const imagesDialogVisible = ref(false)  // 问题截图窗体（查看图片按钮打开）

// 打开"问题截图"窗体
const openImagesViewer = () => {
  if (!hasImages.value) { ElMessage.warning('暂无图片'); return }
  viewerIndex.value = 0
  imagesDialogVisible.value = true
}

// 问题截图窗体里的"查看原图"：全屏查看器
const openFullImage = () => {
  viewerVisible.value = true
}
const loadDetail = async () => {
  if (!props.problem) return
  const rowCopy = JSON.parse(JSON.stringify(props.problem))
  rowCopy.yiyuanmc = rowCopy.yiyuanmc || rowCopy.hospital  // 字段名兼容
  rowCopy.mokuai = rowCopy.mokuai || rowCopy.module
  rowCopy.xggcs = rowCopy.xggcs || rowCopy.engineer
  rowCopy.wentilx = rowCopy.wentilx || '其它问题'  // 老数据没有问题类型的兜底
  Object.assign(form, rowCopy)
  attachItems.value = []
  fileAttachItems.value = []
  // 售后到期日：按医院名称查询（接口 /api/hospital/syq）
  syq.value = '-'
  if (form.yiyuanmc) {
    try {
      const syqRes = await axios.get('/api/hospital/syq', { params: { name: form.yiyuanmc } })
      syq.value = syqRes.data?.syq || '-'
    } catch (err) { console.error('查询售后到期日失败:', err) }
  }
  try {
    const res = await axios.get(`/api/feedback/images/${props.problem.id}`)
    const imgs = res.data
    if (imgs && imgs.length > 0) {
      // 兼容字符串数组和对象数组，统一转成附件项（图片/视频/文件）
      attachItems.value = imgs.map((img: any) => {
        const name = typeof img === 'string' ? img : (img.filename || img.name)
        return toAttachItem(name)
      })
    }
  } catch (err) { console.error('加载附件失败:', err) }
  // 加载问题文件附件（问题处理页上传，fileUploadPath 目录）
  try {
    const fRes = await axios.get(`/api/feedback/files/${props.problem.id}`)
    const fList = fRes.data
    if (fList && fList.length > 0) {
      fileAttachItems.value = fList.map((f: any) => {
        const name = f.name || f.filename
        return { url: `/api/feedback/file-uploads/${encodeURIComponent(f.filename || name)}`, type: getAttachType(name), name }
      })
    }
  } catch (err) { console.error('加载文件附件失败:', err) }
}
watch(() => props.modelValue, (v) => { if (v) loadDetail() })

// 图片：全屏查看
const imageUrlList = computed(() => attachItems.value.filter(i => i.type === 'image').map(i => i.url))
const openImageViewer = (url: string) => {
  viewerIndex.value = imageUrlList.value.indexOf(url)
  viewerVisible.value = true
}

// 文件（含视频）：浏览器可直接渲染的新窗口打开，其余提示下载
const canPreviewInBrowser = (name: string) => /\.(txt|md|html|htm|pdf)$/i.test(name || '')
const openFile = async (item: any) => {
  if (item.type === 'image' || item.type === 'video' || canPreviewInBrowser(item.name)) {
    window.open(item.url, '_blank')
    return
  }
  try {
    await ElMessageBox.confirm(
      `文件「${item.name}」无法在浏览器中直接预览，点击"下载打开"后选择保存位置，请使用 Word/Excel/WPS 等程序打开。`,
      '打开文件',
      { type: 'info', confirmButtonText: '下载打开', cancelButtonText: '取消' }
    )
    const ok = await downloadWithSaveDialog(item.url, item.name)
    if (ok === true) ElMessage.success('文件已保存')
  } catch (e) { /* 用户取消下载 */ }
}

// 附件"查看"按钮：图片全屏查看；视频/可直接预览的文件新窗口打开；其余提示下载
const viewAttachItem = async (item: any) => {
  if (item.type === 'image') {
    openImageViewer(item.url)
    return
  }
  if (item.type === 'video' || canPreviewInBrowser(item.name)) {
    window.open(item.url, '_blank')
    return
  }
  await openFile(item)
}

// 附件"下载"按钮：弹出"另存为"让用户选择保存位置
const downloadAttachItem = async (item: any) => {
  const ok = await downloadWithSaveDialog(item.url, item.name)
  if (ok === true) ElMessage.success('文件已保存')
}

// ============ 通用工具 ============
const getJingjiType = (level: string) => {
  if (level === '紧急') return 'danger'
  if (level === '急') return 'warning'
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
</script>

<style scoped>
.view-images { display: flex; flex-wrap: wrap; gap: 12px; }
.view-image { width: 120px; height: 120px; object-fit: cover; border-radius: 6px; border: 1px solid #dcdfe6; transition: all 0.3s; }
.view-image:hover { transform: scale(1.05); box-shadow: 0 4px 12px rgba(0,0,0,0.15); }
.view-file { display: flex; align-items: center; gap: 6px; width: 150px; height: 120px; border: 1px dashed #dcdfe6; border-radius: 6px; padding: 8px; cursor: pointer; color: var(--el-color-primary); font-size: 13px; word-break: break-all; background: #f8f9fa; transition: all 0.3s; }
.view-file:hover { border-color: var(--el-color-primary); box-shadow: 0 4px 12px rgba(0,0,0,0.12); }
/* 附件文件列表方式（查看/下载按钮跟在文件名后） */
.view-attach-list { display: flex; flex-direction: column; gap: 4px; width: 100%; }
/* 问题截图窗体（同问题测试页） */
.carousel-container { display: flex; flex-direction: column; align-items: center; gap: 16px; }
.carousel-wrapper { width: 100%; height: 560px; display: flex; justify-content: center; align-items: center; overflow: hidden; flex-shrink: 0; }
.carousel-image { max-width: 100%; max-height: 100%; width: auto; height: auto; object-fit: contain; }
.carousel-controls { display: flex; align-items: center; gap: 16px; flex-shrink: 0; }
.carousel-actions { display: flex; justify-content: center; gap: 1px; flex-shrink: 0; }
.view-attach-item { display: flex; align-items: center; gap: 8px; padding: 6px 8px; border: 1px solid #e4e7ed; border-radius: 6px; background: #fafafa; }
.view-attach-item .el-icon { color: var(--el-color-primary); flex-shrink: 0; }
.view-attach-name { flex: 1; min-width: 0; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; color: #303133; font-size: 13px; }
.view-attach-item .el-button { margin-left: 0; flex-shrink: 0; }
.view-dialog-actions { display: flex; justify-content: center; align-items: center; margin-top: 20px; width: 100%; text-align: center; }
</style>
