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

      <!-- 问题附件（图片/视频/文件，三页统一） -->
      <el-form-item label="问题附件" v-if="attachItems.length > 0">
        <div class="view-images">
          <template v-for="(item, index) in attachItems" :key="index">
            <img v-if="item.type === 'image'" :src="item.url" class="view-image" @click="openImageViewer(item.url)" style="cursor: zoom-in;" />
            <div v-else class="view-file" @click="openFile(item)">
              <el-icon><Document /></el-icon>
              <span>{{ item.name }}</span>
            </div>
          </template>
        </div>
      </el-form-item>

      <div class="view-dialog-actions">
        <el-button class="morandi-btn btn-cancel" @click="handleClose">
          <el-icon><Back /></el-icon> 返回列表
        </el-button>
      </div>
    </el-form>

    <!-- 全屏图片查看器 -->
    <el-image-viewer v-if="viewerVisible" :url-list="imageUrlList" :initial-index="viewerIndex" @close="viewerVisible = false" />
  </el-dialog>
</template>

<script setup lang="ts">
import { ref, reactive, computed, watch } from 'vue'
import { ElMessageBox } from 'element-plus'
import { Back, Document } from '@element-plus/icons-vue'
import axios from 'axios'

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
const loadDetail = async () => {
  if (!props.problem) return
  const rowCopy = JSON.parse(JSON.stringify(props.problem))
  rowCopy.yiyuanmc = rowCopy.yiyuanmc || rowCopy.hospital  // 字段名兼容
  rowCopy.mokuai = rowCopy.mokuai || rowCopy.module
  rowCopy.xggcs = rowCopy.xggcs || rowCopy.engineer
  rowCopy.wentilx = rowCopy.wentilx || '其它问题'  // 老数据没有问题类型的兜底
  Object.assign(form, rowCopy)
  attachItems.value = []
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
  if (item.type === 'video' || canPreviewInBrowser(item.name)) {
    window.open(item.url, '_blank')
    return
  }
  try {
    await ElMessageBox.confirm(
      `文件「${item.name}」无法在浏览器中直接预览，点击"下载打开"后将下载到本地，请使用 Word/Excel/WPS 等程序打开。`,
      '打开文件',
      { type: 'info', confirmButtonText: '下载打开', cancelButtonText: '取消' }
    )
    window.open(item.url, '_blank')
  } catch (e) { /* 用户取消下载 */ }
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
.view-dialog-actions { display: flex; justify-content: center; align-items: center; margin-top: 20px; width: 100%; text-align: center; }
</style>
