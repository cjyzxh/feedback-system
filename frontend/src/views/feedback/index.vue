<template>
  <div class="feedback-container">
    <el-card class="main-card" shadow="hover">
      <template #header>
        <div class="card-header">
          <span>问题反馈</span>
        </div>
      </template>
      
      <el-form :inline="true" :model="searchForm" class="search-form">
        <el-form-item label="问题ID号">
          <el-input v-model="searchForm.id" placeholder="输入ID号搜索" clearable @keyup.enter="handleSearch" style="width:120px" />
        </el-form-item>
        <el-form-item label="医院" v-if="!isCustomerUser">
          <el-select v-model="searchForm.yiyuanmc" placeholder="请搜索选择" filterable clearable style="width:252px" :filter-method="searchHospitals" @focus="loadHospitals" :loading="hospitalLoading" @change="handleSearch">
            <el-option v-for="h in hospitals" :key="h.label" :label="h.label" :value="h.label" />
          </el-select>
        </el-form-item>
        <el-form-item label="模块">
          <el-select v-model="searchForm.mokuai" placeholder="请选择" clearable style="width:156px" @change="handleSearch">
            <el-option v-for="m in modules" :key="m.value" :label="m.label" :value="m.label" />
          </el-select>
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="searchForm.zhuangtai" placeholder="全部状态" clearable @change="handleSearch" style="width:130px">
            <el-option label="未完成" value="weiwan" />
            <el-option label="已完成" value="yiwan" />
            <el-option label="待讨论" value="daitaolun" />
          </el-select>
        </el-form-item>
        <el-form-item v-if="canViewOthers && viewAll && !isCustomerUser">
          <el-select v-model="selectedShishiry" placeholder="跟进人员" clearable style="width:130px" @change="handleSearch">
            <el-option v-for="s in shishiList" :key="s.value || s.xingming" :label="s.label || s.xingming" :value="s.username || s.value || s.xingming" />
          </el-select>
        </el-form-item>
        <!-- 第一行末尾：查询问题 + 重置条件 + 新增问题（以查询问题为基准统一宽高） -->
        <div class="btn-group-1">
          <el-button class="morandi-btn morandi-blue btn-search" @click="handleSearch"><el-icon><Search /></el-icon> 查询问题</el-button>
          <el-button class="morandi-btn morandi-gray btn-reset" @click="handleResetSearch"><el-icon><RefreshLeft /></el-icon> 重置条件</el-button>
          <el-button class="morandi-btn morandi-blue btn-add" @click="handleAdd"><el-icon><Plus /></el-icon> 新增问题</el-button>
        </div>
        <!-- 第二行：问题说明 → 录入日期 → 查询/重置（问题说明左对齐第一行问题ID号） -->
        <div class="search-row-2">
          <el-form-item label="问题说明" class="wentism-item" :style="{ width: wentismWidth }">
            <el-input v-model="searchForm.wentism" placeholder="输入问题说明关键词，支持模糊检索" clearable @keyup.enter="handleSearch" style="width:100%" />
          </el-form-item>
          <el-form-item label="录入日期" class="date-item" :style="{ width: dateItemWidth }">
            <el-date-picker
              v-model="dateRange"
              type="daterange"
              range-separator="至"
              start-placeholder="开始日期"
              end-placeholder="结束日期"
              value-format="YYYY-MM-DD"
              @change="handleDateChange"
              style="width:100%"
            />
          </el-form-item>
          <div class="btn-group-2">
            <el-form-item v-if="canViewOthers && !isCustomerUser" class="check-item">
              <el-checkbox v-model="viewAll" @change="handleSearch">查看所有问题</el-checkbox>
              <el-checkbox v-model="myRelated" @change="handleSearch">与我有关</el-checkbox>
            </el-form-item>
          </div>
        </div>
      </el-form>
      
      <el-table ref="tableRef" :data="tableData" border v-loading="loading" stripe :row-class-name="getTableRowClassName" @row-click="handleSelectRow" @row-dblclick="handleView">
        <el-table-column prop="id" label="ID" width="60" align="center" />
        <el-table-column prop="jingjicd" label="紧急度" width="75" align="center">
          <template #default="{ row }">
            <el-tag v-if="row.jingjicd === '紧急'" type="danger" size="small">紧急</el-tag>
            <el-tag v-else-if="row.jingjicd === '急'" type="warning" size="small">急</el-tag>
            <el-tag v-else type="info" size="small">一般</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="wentilx" label="问题类型" width="90" align="center">
          <template #default="{ row }">
            <span>{{ row.wentilx || '其它问题' }}</span>
          </template>
        </el-table-column>
        <el-table-column prop="banben" label="软件版本" width="100" />
        <el-table-column label="状态" width="90">
          <template #default="{ row }">
            <el-tag :type="getStatusType(getProblemStatus(row))" size="small">{{ getProblemStatus(row) }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="yiyuanmc" label="医院名称" width="150" />
        <el-table-column prop="shishiry" label="实施人员" width="90" />
        <el-table-column prop="mokuai" label="模块" width="110" />
        <el-table-column prop="chuangtimc" label="窗体" width="110" />
        <el-table-column prop="xggcs" label="工程师" width="80" />
        <el-table-column prop="szcsgcs" label="反馈人" width="160" />
        <el-table-column prop="FanKuiQD" label="反馈渠道" width="100" />
        <el-table-column prop="wentism" label="问题说明" min-width="150" />
        <el-table-column prop="shouhoucs" label="测试结果" min-width="120">
          <template #default="{ row }">
            <span v-if="row.shouhoucs" style="color: #f56c6c">{{ row.shouhoucs }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
        <!-- 隐藏测试人员和测试返回时间列，以保证图片和操作列不超页面范围
        <el-table-column prop="shcsgcs" label="测试人员" width="90">
          <template #default="{ row }">
            <span v-if="row.shcsgcs">{{ row.shcsgcs }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
        <el-table-column prop="fanhuisj" label="测试返回时间" width="160">
          <template #default="{ row }">
            <span v-if="row.fanhuisj">{{ formatDate(row.fanhuisj) }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
        -->
        <el-table-column prop="lvrusj" label="录入时间" width="170">
          <template #default="{ row }">
            <span v-if="row.lvrusj">{{ formatDate(row.lvrusj) }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
        <el-table-column label="图片" width="45" align="center" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link @click.stop="viewImages(row)"><el-icon><Picture /></el-icon></el-button>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="180" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link @click="handleView(row)">查看</el-button>
            <el-button v-if="canEdit(row)" type="primary" link @click="handleEdit(row)">编辑</el-button>
            <el-button v-if="canDelete(row)" type="danger" link @click="handleDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <el-pagination v-model:current-page="pagination.page" v-model:page-size="pagination.pageSize" :total="pagination.total" :page-sizes="[10,20,50,100]" layout="total,sizes,prev,pager,next,jumper" @size-change="loadData" @current-change="loadData" style="margin-top:20px;justify-content:flex-end;" />
    </el-card>
    
    <!-- 新增/编辑对话框 -->
    <el-dialog v-model="dialogVisible" :title="isEdit ? '编辑问题' : '新增问题'" width="900px" :close-on-click-modal="false" destroy-on-close>
      <el-form :model="form" :rules="rules" ref="formRef" label-width="100px">
        <el-row :gutter="6">
          <el-col :span="6" v-if="isEdit">
            <el-form-item label="问题ID号">
              <div class="lsh-box">
                <el-input v-model="form.id" disabled><template #prefix><el-icon><Tickets /></el-icon></template></el-input>
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="24">
            <el-form-item label="紧急程度" prop="jingjicd">
              <div class="priority-content">
                <div class="priority-box">
                  <el-button :class="['priority-btn', { active: form.jingjicd === '紧急', danger: form.jingjicd === '紧急'}]" @click="form.jingjicd = '紧急'">紧急</el-button>
                  <el-button :class="['priority-btn', { active: form.jingjicd === '急', warning: form.jingjicd === '急'}]" @click="form.jingjicd = '急'">急</el-button>
                  <el-button :class="['priority-btn', { active: form.jingjicd === '一般', info: form.jingjicd === '一般'}]" @click="form.jingjicd = '一般'">一般</el-button>
                </div>
                <div class="shouhou-right" v-if="shouhouDaoqiRi">
                  <span class="shouhou-title">售后到期日:</span>
                  <div class="shouhou-date" :class="isShouhouExpired ? 'expired' : 'valid'">
                    <el-icon><Calendar /></el-icon>
                    <span>{{ shouhouDaoqiRi }}</span>
                  </div>
                </div>
              </div>
            </el-form-item>
          </el-col>
          <el-col :span="6" v-if="isEdit">
            <el-form-item label="录入时间">
              <el-input :model-value="formatDate(form.lvrusj)" disabled />
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row :gutter="6">
          <el-col :span="6">
            <el-form-item label="软件版本" prop="banben">
              <el-select v-model="form.banben" placeholder="请选择" style="width:100%" @change="onVersionChange">
                <el-option label="HIS问题" value="HIS问题" />
                <el-option label="医保接口" value="医保接口" />
                <el-option label="其它问题" value="其它问题" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="问题类型" prop="wentilx">
              <el-select v-model="form.wentilx" placeholder="请选择" style="width:100%">
                <el-option label="软件BUG" value="软件BUG" />
                <el-option label="业务逻辑" value="业务逻辑" />
                <el-option label="个性化" value="个性化" />
                <el-option label="其它问题" value="其它问题" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="医院名称" prop="yiyuanmc">
              <el-select v-model="form.yiyuanmc" placeholder="请搜索选择" filterable style="width:100%" :filter-method="searchHospitals" @focus="loadHospitals" :loading="hospitalLoading" :disabled="isCustomerUser" @change="onHospitalChange">
                <el-option v-for="h in hospitals" :key="h.label" :label="h.label" :value="h.label" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row :gutter="6">
          <el-col :span="6">
            <el-form-item label="模块" prop="mokuai">
              <el-select v-model="form.mokuai" placeholder="请选择" style="width:100%" @change="(val) => onModuleChange(val)">
                <el-option v-for="m in modules" :key="m.value" :label="m.label" :value="m.label" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="窗体" prop="chuangtimc">
              <el-select 
                v-model="form.chuangtimc" 
                placeholder="请选择或输入" 
                style="width:100%" 
                :disabled="!form.mokuai"
                filterable
                allow-create
                default-first-option
                @keyup.enter="handleFormChange"
              >
                <el-option v-for="f in forms" :key="f.id" :label="f.label" :value="f.label" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="跟进人员" prop="shishiry">
              <el-select v-model="form.shishiry" placeholder="请选择" style="width:100%" :disabled="isCustomerUser">
                <el-option v-for="e in shishiList" :key="e.value" :label="e.label" :value="e.value" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="6">
            <el-form-item label="工程师" prop="xggcs">
              <el-select v-model="form.xggcs" placeholder="请选择" style="width:100%" :disabled="isCustomerUser">
                <el-option v-for="e in yanfaList" :key="e.value" :label="e.label" :value="e.value" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-form-item label="问题说明" prop="wentism">
          <el-input v-model="form.wentism" type="textarea" :rows="4" placeholder="请详细描述问题..." />
        </el-form-item>
        
        <el-form-item label="测试意见" prop="shouzhongcs">
          <div style="display:flex; align-items:flex-start; gap:6px; width:100%">
            <el-input v-model="form.shouzhongcs" type="textarea" :rows="3" placeholder="请填写测试人员意见..." style="flex:1; min-width:0" />
            <TemplatePicker :lx="'测试意见'" @select="appendShouzhongcs" />
          </div>
        </el-form-item>
        
        <!-- 处理信息（编辑时显示，只读） -->
        <el-divider v-if="isEdit && form.xgsj" content-position="left">处理信息</el-divider>
        <el-row v-if="isEdit && form.xgsj" :gutter="6">
          <el-col :span="8">
            <el-form-item label="处理人">
              <el-input v-model="form.xggcs" disabled />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="处理时间">
              <el-input :model-value="formatDate(form.xgsj)" disabled />
            </el-form-item>
          </el-col>
        </el-row>
        
        <!-- 测试信息（编辑时显示，只读） -->
        <el-divider v-if="isEdit && form.fanhuisj" content-position="left">测试返回信息</el-divider>
        <el-row v-if="isEdit && form.fanhuisj" :gutter="6">
          <el-col :span="8">
            <el-form-item label="测试人员">
              <el-input v-model="form.shcsgcs" disabled />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="返回时间">
              <el-input :model-value="formatDate(form.fanhuisj)" disabled />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item v-if="isEdit && form.shouhoucs" label="测试结果">
          <el-input v-model="form.shouhoucs" type="textarea" :rows="2" disabled style="color: #f56c6c" />
        </el-form-item>
        
        <el-form-item label="问题附件">
          <div @paste.capture.stop="handlePaste" class="upload-area">
            <el-upload ref="uploadRef" v-model:file-list="uploadFileList" action="/api/feedback/upload" list-type="picture-card" :auto-upload="false" :on-change="handleFileChange" :on-remove="handleRemove" :limit="5" accept="image/*,video/*,.pdf,.txt,.html,.doc,.docx,.xls,.xlsx,.zip" drag multiple>
              <el-icon class="upload-icon"><Plus /></el-icon>
              <div class="upload-text">拖拽或点击选择<br/>支持图片/视频/文档（单个≤50MB）<br/>图片/视频存图片库，文档存附件库，自动分类<br/>Ctrl+V 粘贴图片或文件</div>
              <template #file="{ file }">
                <div class="file-card" @click="handlePreview(file)">
                  <img v-if="getAttachType(file.name) === 'image'" :src="file.url" class="file-thumb" alt="" />
                  <div v-else class="file-icon">
                    <el-icon><Document /></el-icon>
                    <span class="file-name">{{ file.name }}</span>
                  </div>
                  <div class="file-card-del" @click.stop="handleRemove(file, uploadFileList)">
                    <el-icon><Close /></el-icon>
                  </div>
                </div>
              </template>
            </el-upload>
          </div>
        </el-form-item>
        
        <el-form-item label-width="0" style="margin: 0; padding: 0;">
          <div style="display: flex !important; justify-content: center !important; align-items: center !important; gap: 3px; width: 100%; text-align: center;">
            <el-button class="morandi-btn morandi-green" style="min-width: 110px; height: 42px; padding: 0 20px;" @click="handleSubmit" :loading="submitting">
              <el-icon><Check /></el-icon> {{ isEdit ? '更新问题' : '保存问题' }}
            </el-button>
            <el-button class="morandi-btn morandi-gray btn-cancel" style="min-width: 110px; height: 42px; padding: 0 20px;" @click="dialogVisible = false">返回列表</el-button>
          </div>
        </el-form-item>
      </el-form>
    </el-dialog>
    
    <!-- 查看问题（三页统一窗体） -->
    <ViewProblemDialog v-model="viewDialogVisible" :problem="viewProblem" />

    
    <!-- 附件预览弹窗 -->
    <el-dialog v-model="previewVisible" title="问题附件" width="960px" destroy-on-close class="preview-dialog">
      <div class="carousel-container">
        <div class="carousel-wrapper" v-if="previewItems.length > 0">
          <img v-if="currentItem.type === 'image'" :src="currentItem.url" class="carousel-image" @click="openImageViewer" style="cursor: zoom-in;" />
          <template v-else-if="currentItem.type === 'video'">
            <video :src="currentItem.url" class="carousel-video" controls @error="handleVideoError" @loadedmetadata="handleVideoMeta"></video>
            <div v-if="videoPlayError" class="video-error-tip">
              此视频编码浏览器不支持画面（只能听到声音），多为 MPEG-4 或 H.265 格式。<br/>
              请点击下方"下载文件"保存后，用格式工厂等工具转码为 H.264（如"MP4 H.264"）再上传。
            </div>
          </template>
          <div v-else class="carousel-file">
            <el-icon class="carousel-file-icon"><Document /></el-icon>
            <div class="carousel-file-name">{{ currentItem.name }}</div>
            <el-button type="primary" @click="openExternalFile">
              <el-icon><Download /></el-icon> {{ canPreviewInBrowser(currentItem.name) ? '打开文件' : '下载打开' }}
            </el-button>
          </div>
        </div>
        <el-empty v-else description="暂无附件" />
        <div class="carousel-controls" v-if="previewItems.length > 1">
          <el-button circle :disabled="currentIndex === 0" @click="prevImage"><el-icon><ArrowLeft /></el-icon></el-button>
          <span class="carousel-indicator">{{ currentIndex + 1 }} / {{ previewItems.length }}</span>
          <el-button circle :disabled="currentIndex === previewItems.length - 1" @click="nextImage"><el-icon><ArrowRight /></el-icon></el-button>
        </div>
        <div class="carousel-actions" v-if="previewItems.length > 0">
          <el-button v-if="currentItem.type === 'image'" type="primary" @click="openImageViewer">
            <el-icon><ZoomIn /></el-icon> 查看原图
          </el-button>
          <a v-else :href="currentItem.url" target="_blank">
            <el-button type="primary"><el-icon><Download /></el-icon> 下载文件</el-button>
          </a>
          <el-button type="danger" @click="deleteCurrentImage">
            <el-icon><Delete /></el-icon> 删除当前附件
          </el-button>
          <el-button type="info" plain @click="previewVisible = false">
            <el-icon><Back /></el-icon> 返回列表
          </el-button>
        </div>
        <div class="viewer-tip" v-if="previewItems.length > 0">
          提示：图片点击可全屏缩放；视频可直接播放；其他文件点击"打开文件"新窗口查看
        </div>
      </div>
    </el-dialog>
    
    <!-- 全屏图片查看器（支持鼠标滚轮缩放、拖拽、全屏） -->
    <el-image-viewer
      v-if="imageViewerVisible"
      :url-list="viewerUrlList"
      :initial-index="currentIndex"
      :hide-on-click-modal="true"
      :z-index="9999"
      @close="imageViewerVisible = false"
    />
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted, computed, nextTick, watch , onUnmounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Search, Refresh, RefreshLeft, Plus, Tickets, Delete, Check, ArrowLeft, ArrowRight, ZoomIn, Picture, Close, Calendar, Back, Document, Download } from '@element-plus/icons-vue'
import axios from 'axios'
import TemplatePicker from '@/components/TemplatePicker.vue'
import ViewProblemDialog from '@/components/ViewProblemDialog.vue'

// ============ 页面状态变量（类比 VB6 的窗体级变量） ============
const loading = ref(false)          // 列表加载中（控制转圈动画）
const submitting = ref(false)       // 保存提交中（防止连点两次重复提交）
const dialogVisible = ref(false)    // 新增/编辑 对话框是否显示
const viewDialogVisible = ref(false)// 查看 对话框是否显示
const viewProblem = ref<any>(null)        // 当前查看的问题行数据（传给统一查看窗体）
const detailItems = ref<any[]>([])      // 查看详情附件列表（含类型/文件名）
const previewVisible = ref(false)   // 附件轮播预览窗口是否显示
const previewItems = ref<any[]>([]) // 轮播预览的附件数组 [{url, type, name}]
const currentIndex = ref(0)         // 轮播当前是第几个（0 起）
const isEdit = ref(false)           // true=编辑模式，false=新增模式
const imageViewerVisible = ref(false)  // 全屏图片查看器状态（Element Plus 自带查看器）
const viewerUrlList = ref<string[]>([]) // 全屏查看器只放图片URL（视频/文件不走它）

// 附件类型判断（按扩展名）：image=图片 / video=视频 / other=其他文件
const getAttachType = (name: string) => {
  const n = (name || '').toLowerCase()
  if (/\.(jpg|jpeg|png|gif|bmp|webp|svg)$/.test(n)) return 'image'
  if (/\.(mp4|avi|mov|wmv|mkv|flv|webm)$/.test(n)) return 'video'
  return 'other'
}
// 把文件名转成附件项 {url, type, name}
const toAttachItem = (name: string) => {
  const url = `/api/feedback/uploads/${name}`
  return { url, type: getAttachType(name), name }
}
// 自动分类：图片/视频走图片渠道，其余文档走附件渠道
const isMediaFile = (f: any) => {
  const t = (f?.type || '').toLowerCase()
  if (t.startsWith('image/') || t.startsWith('video/')) return true
  const n = (f?.name || '').toLowerCase()
  return /\.(jpg|jpeg|png|gif|bmp|webp|svg|ico|mp4|mov|avi|mkv|webm|flv|m4v|wmv|3gp)$/.test(n)
}
// 当前正在预览的附件（用于模板里按类型渲染）
const currentItem = computed(() => previewItems.value[currentIndex.value] || { url: '', type: 'image', name: '' })

// 视频画面解码失败提示（如 MPEG-4/H.265 编码浏览器无画面，只有声音）
const videoPlayError = ref(false)
const handleVideoError = () => { videoPlayError.value = true }
const handleVideoMeta = (e: any) => {
  // loadedmetadata 后宽高为 0 说明视频轨道无法解码（没有画面）
  const v = e.target
  if (v && typeof v.videoWidth === 'number' && v.videoWidth === 0) {
    videoPlayError.value = true
  }
}
// 切换预览项时重置视频错误提示
watch(currentItem, () => { videoPlayError.value = false })

// 浏览器可直接渲染的文件类型（txt/html/pdf 等）：新窗口直接打开
const canPreviewInBrowser = (name: string) => /\.(txt|md|html|htm|pdf)$/i.test(name || '')
// 打开非图片非视频文件：可预览的直接新窗口打开；Office/压缩包等先提示再下载
const openExternalFile = async () => {
  const name = currentItem.value.name || ''
  if (canPreviewInBrowser(name)) {
    window.open(currentItem.value.url, '_blank')
    return
  }
  try {
    await ElMessageBox.confirm(
      `文件「${name}」无法在浏览器中直接预览，点击"下载打开"后将下载到本地，请使用 Word/Excel/WPS 等程序打开。`,
      '打开文件',
      { type: 'info', confirmButtonText: '下载打开', cancelButtonText: '取消' }
    )
    window.open(currentItem.value.url, '_blank')
  } catch (e) { /* 用户取消下载 */ }
}

// 轮播：上一个 / 下一个（类比 VB6 里改数组下标后重画 PictureBox）
const prevImage = () => {
  if (currentIndex.value > 0) currentIndex.value--
}

const nextImage = () => {
  if (currentIndex.value < previewItems.value.length - 1) currentIndex.value++
}

// 打开全屏图片查看器（仅图片类型可用，支持鼠标滚轮缩放、拖拽、全屏）
const openImageViewer = () => {
  const images = previewItems.value.filter(i => i.type === 'image')
  if (images.length === 0) return
  viewerUrlList.value = images.map(i => i.url)
  const cur = previewItems.value[currentIndex.value]
  currentIndex.value = Math.max(0, images.findIndex(i => i.url === cur.url))
  imageViewerVisible.value = true
}

const deleteCurrentImage = async () => {
  try {
    await ElMessageBox.confirm(`确定要删除第 ${currentIndex.value + 1} 个附件吗？`, '提示', { type: 'warning' })
    const filename = previewItems.value[currentIndex.value].url.split('/').pop()
    if (filename) {
      await axios.delete(`/api/feedback/image/${filename}`)
    }
    previewItems.value.splice(currentIndex.value, 1)
    if (currentIndex.value >= previewItems.value.length && currentIndex.value > 0) {
      currentIndex.value = previewItems.value.length - 1
    }
    ElMessage.success('删除成功')
  } catch (e: any) {
    if (e !== 'cancel') ElMessage.error(e.message || '删除失败')
  }
}
// formRef = 新增/编辑表单的引用（调用 .validate() 做必填校验）
// uploadRef = 上传组件的引用
const formRef = ref()
const uploadRef = ref()

// ============ 下拉字典数据（从后端 /api/dict 加载） ============
const hospitals = ref<any[]>([])   // 医院列表（拼音码可搜索）
const engineers = ref<any[]>([])   // 工程师列表（字典里的工程师）
const shishiList = ref<any[]>([])  // 实施人员列表
const yanfaList = ref<any[]>([])   // 研发人员列表
const modules = ref<any[]>([])     // 模块列表（随版本联动）
const forms = ref<any[]>([])       // 窗体列表（随版本+模块联动）
const hospitalLoading = ref(false) // 医院下拉加载中
const tableData = ref<any[]>([])   // 列表表格数据
const uploadFileList = ref<any[]>([]) // 图片上传列表（含已存在+待上传）


// ============ 当前登录者信息（登录成功后存在 localStorage，这里读出来用） ============
// localStorage 类比 VB6 的 SaveSetting 注册表保存：浏览器关闭再打开仍在
const currentUserName = ref('')  // 当前登录者姓名
const currentUserCode = ref('')  // 当前登录者编码
const isAdmin = ref(false)       // 是否管理员

// 从 localStorage 的 user 对象里解析出姓名/编码和管理员标志
const initCurrentUser = () => {
  const userStr = localStorage.getItem('user')
  if (userStr) {
    try {
      const user = JSON.parse(userStr)
      currentUserName.value = user?.realName || user?.username || localStorage.getItem('username') || ''
      currentUserCode.value = user?.username || localStorage.getItem('userCode') || ''
      isAdmin.value = parseInt(user?.isAdmin || '0') === 1
    } catch (e) {
      currentUserName.value = localStorage.getItem('username') || ''
      currentUserCode.value = localStorage.getItem('userCode') || ''
      isAdmin.value = false
    }
  } else {
    currentUserName.value = localStorage.getItem('username') || ''
    currentUserCode.value = localStorage.getItem('userCode') || ''
    isAdmin.value = false
  }
}

// 权限判断（类比 VB6 里按钮 .Enabled = False 的控制）
// 可以编辑的条件：问题还在"待修改"状态（三个处理标志都还没被置 Y）
// gongchengsbz=工程师处理标志，shouhoubz=售后/测试完成标志，taolunbz=待讨论标志
const canEdit = (row: any) => {
  return row.gongchengsbz !== 'Y' && row.shouhoubz !== 'Y' && row.taolunbz !== 'Y'
}

// 判断是否可以删除：
// 1. 只有待修改状态可以删除
// 2. 必须是反馈人本人(szcsgcsBM为当前登录者编码)，或者当前登录者是管理员
const canDelete = (row: any) => {
  // 只有待修改状态可以删除
  if (row.gongchengsbz === 'Y' || row.shouhoubz === 'Y' || row.taolunbz === 'Y') {
    return false
  }
  // 必须是反馈人本人（按编码）或者管理员
  return isAdmin.value || row.szcsgcsBM === currentUserCode.value
}

// 查询条件：默认查最近一年的数据（今天是 end，一年前是 start）
const getDefaultDateRange = () => {
  const end = new Date()
  const start = new Date()
  start.setFullYear(start.getFullYear() - 1)
  // 把 Date 对象格式化成 yyyy-MM-dd 字符串（类比 VB6 的 Format(Now, "yyyy-mm-dd")）
  const formatDate = (d: Date) => {
    const year = d.getFullYear()
    const month = String(d.getMonth() + 1).padStart(2, '0') // padStart 补零：1 -> "01"
    const day = String(d.getDate()).padStart(2, '0')
    return `${year}-${month}-${day}`
  }
  return { startDate: formatDate(start), endDate: formatDate(end) }
}

const defaultRange = getDefaultDateRange()
// 列表页的查询条件（对应页面上方的搜索栏）
// reactive = 响应式对象：改了它，页面上绑定的输入框/下拉自动跟着变（类比 VB6 文本框的 Change 联动）
const searchForm = reactive({ 
  yiyuanmc: '',      // 医院名称
  mokuai: '',        // 模块
  id: '',            // 问题ID
  zhuangtai: 'weiwan',  // 问题状态（未完成/已完成/待讨论），默认未完成
  wentism: '',       // 问题说明（模糊检索关键词）
  startDate: defaultRange.startDate,  // 录入日期起
  endDate: defaultRange.endDate       // 录入日期止
})
// 日期范围选择器的绑定值（Element Plus 的日期区间控件要一个数组）
const dateRange = ref([defaultRange.startDate, defaultRange.endDate])

// 日期范围变化：同步到 searchForm 并立即重新查询
const handleDateChange = (val: any) => {
  if (val && val.length === 2) {
    searchForm.startDate = val[0]
    searchForm.endDate = val[1]
  } else {
    searchForm.startDate = ''
    searchForm.endDate = ''
  }
  handleSearch()
}
const viewAll = ref(false)  // "查看所有问题"复选框：默认false（只查自己跟进的）
const myRelated = ref(true)  // "与我有关"复选框：默认勾选，按当前用户编码匹配跟进/工程师/反馈人/测试人任一
const selectedShishiry = ref('')  // 勾选查看所有后，可再选一个跟进人员来筛

// computed = 计算属性：依赖的值变了它自动重算（类比 VB6 里由其它控件事件刷新的 Label）
// 判断当前用户是否有"查看非本人数据"权限（角色表里的 viewOthers 字段）
const canViewOthers = computed(() => {
  return parseInt(localStorage.getItem('viewOthers') || '0') === 1
})

// ============ 客户用户相关（客户=医院端操作员，用户管理里绑定了医院和跟进人） ============
// 判断当前用户是否是客户用户（userType 字段 = '客户'）
const isCustomerUser = computed(() => {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  return u.userType === '客户'
})

// 客户绑定的医院名称（新增问题时自动填进"医院名称"，且不允许改）
const customerHospital = computed(() => {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  return u.hospital || ''
})

// 客户绑定的跟进人员（新增问题时自动填进"跟进人员"，且不允许改）
const customerFollower = computed(() => {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  return u.follower || ''
})

// ============ 新增/编辑问题的表单数据 ============
// 字段与数据库 feedback 表一一对应（拼音缩写是历史遗留命名，见下）
const form = reactive({
  id: 0,               // 问题ID（0=还没保存过）
  banben: 'HIS问题',   // 软件版本：HIS问题/医保接口/其它问题
  yiyuanmc: '',        // 医院名称
  shishiry: '',        // 跟进人员（实施人员）
  mokuai: '',          // 模块
  chuangtimc: '',      // 窗体名称
  xggcs: '',           // 工程师（修改人员）
  jingjicd: '一般',    // 紧急程度：一般/急/紧急
  wentilx: '其它问题', // 问题类型：软件BUG/业务逻辑/个性化/其它问题
  wentism: '',         // 问题说明
  shouzhongcs: '',     // 售后（测试）说明
  shouhoucs: '',       // 处理意见（售后处理）
  shcsgcs: '',         // 反馈人（提交问题的人）
  cssj: null as any,   // 测试时间（确认测试通过时写入）
  fanhuisj: null as any, // 问题返回时间（返回测试时写入）
  lvrusj: null as any, // 录入时间
  xgsj: null as any    // 修改时间
})

// ============ 售后到期日（xt_ConfigServer 表的 SYQ 字段） ============
// 选择医院后显示：未过期=蓝字，已过期=红字
const shouhouDaoqiRi = ref('')   // 当前选中医院的售后到期日（yyyy-MM-dd）
const isShouhouExpired = computed(() => {  // 是否已过期（今天 0 点与到期日比）
  if (!shouhouDaoqiRi.value) return false
  const today = new Date()
  today.setHours(0, 0, 0, 0)   // 只保留日期，时间清零，避免时分干扰比较
  const expireDate = new Date(shouhouDaoqiRi.value)
  return expireDate < today    // 到期日 < 今天 => 已过期
})

// 医院下拉变化 -> 查询该医院售后到期日（encodeURIComponent 把中文转成URL安全编码）
const onHospitalChange = async (val: string) => {
  if (!val) {
    shouhouDaoqiRi.value = ''
    return
  }
  try {
    const response = await axios.get(`/api/hospital/syq?name=${encodeURIComponent(val)}`)
    console.log('售后到期日返回:', response.data)
    if (response.data && response.data.syq) {
      shouhouDaoqiRi.value = response.data.syq
    } else {
      shouhouDaoqiRi.value = ''
    }
  } catch (e) {
    console.error('查询售后到期日失败:', e)
    shouhouDaoqiRi.value = ''
  }
}

// ============ 表单必填校验规则（Element Plus 表单校验） ============
// trigger: 'change'=下拉改变时校验；'blur'=输入框失去焦点时校验
// 类比 VB6：保存前逐个 If 判断必填项，这里声明式写在 rules 里
const rules = {
  banben: [{ required: true, message: '请选择软件版本', trigger: 'change' }],
  yiyuanmc: [{ required: true, message: '请选择医院', trigger: 'change' }],
  shishiry: [{ required: true, message: '请选择实施人员', trigger: 'change' }],
  mokuai: [{ required: true, message: '请选择模块', trigger: 'change' }],
  chuangtimc: [{ required: true, message: '请选择窗体', trigger: 'change' }],
  xggcs: [{ required: true, message: '请选择工程师', trigger: 'change' }],
  jingjicd: [{ required: true, message: '请选择紧急程度', trigger: 'change' }],
  wentilx: [{ required: true, message: '请选择问题类型', trigger: 'change' }],
  shouzhongcs: [{ required: true, message: '请填写测试意见', trigger: 'blur' }],
  wentism: [{ required: true, message: '请填写问题说明', trigger: 'blur' }]
}

const pagination = reactive({ page: 1, pageSize: 10, total: 0 })

// 格式化日期为 yyyy-MM-dd HH:mm:ss（类比 VB6 的 Format(Now, "yyyy-MM-dd hh:mm:ss")）
// 数据库存的时间是 ISO 字符串，前端展示统一转成这个格式
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

// 计算问题状态：由三个标志位组合推导（Y=是，N=否）
//   待修改: 工程师未处理(工程=Y 测试完成(售后=Y 讨论=Y 即待讨论
//   待测试: 工程师已改(gongchengsbz='Y')，但还没测试(shouhoubz='N')
//   已修改: 工程师已改(gongchengsbz='Y') 且测试已完成(shouhoubz='Y')
//   待讨论: 标记了讨论(taolunbz='Y')，优先级最高
const getProblemStatus = (row: any) => {
  if (row.taolunbz === 'Y') return '待讨论'
  if (row.gongchengsbz === 'Y' && row.shouhoubz === 'Y') return '已修改'
  if (row.gongchengsbz === 'Y' && row.shouhoubz === 'N') return '待测试'
  if (row.gongchengsbz === 'N' && row.shouhoubz === 'N') return '待修改'
  return '待修改'
}

// 获取状态对应的标签颜色
const getStatusType = (status: string) => {
  switch (status) {
    case '待修改': return 'warning'
    case '待测试': return 'info'
    case '已修改': return 'success'
    case '待讨论': return 'danger'
    default: return 'info'
  }
}

// 查看问题对话框右上角的状态标签（待处理/待测试/已处理/待讨论，莫兰迪配色，字号与标题一致）
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

// 当前选中行ID（点击行高亮用，颜色随主题）
const selectedId = ref<number | null>(null)
const handleSelectRow = (row: any) => { selectedId.value = row.id }

// 问题说明条件框总宽：动态测量第一行"问题ID号(左边缘)→医院(右边缘)"的实际宽度
// 保证问题说明的右边缘与医院下拉框右侧精确对齐（含ID与医院之间的间距）
const wentismWidth = ref('440px')
// 录入日期条件框总宽：动态测量第一行"模块(左边缘)→状态(右边缘)"，左对齐模块、右对齐状态
const dateItemWidth = ref('380px')
const measureWentismWidth = () => {
  nextTick(() => {
    const form = document.querySelector('.search-form')
    if (!form) return
    // 只取 el-form 直接子级（第一行），第二行在 div 里不受影响
    const items = form.querySelectorAll(':scope > .el-form-item')
    if (items.length >= 2) {
      const right = items[1].offsetLeft + items[1].offsetWidth  // 医院右边缘
      const left = items[0].offsetLeft                          // 问题ID号左边缘
      wentismWidth.value = Math.max(right - left, 300) + 'px'
    }
    if (items.length >= 4) {
      const modLeft = items[2].offsetLeft                        // 模块左边缘
      const statusRight = items[3].offsetLeft + items[3].offsetWidth  // 状态右边缘
      dateItemWidth.value = Math.max(statusRight - modLeft, 300) + 'px'
    }
    // 以查询问题为基准：统一第一行三个按钮的宽高
    const qBtn = form.querySelector('.btn-group-1 .btn-search')
    if (qBtn) {
      form.style.setProperty('--search-btn-w', qBtn.offsetWidth + 'px')
      form.style.setProperty('--search-btn-h', qBtn.offsetHeight + 'px')
    }
  })
}
onMounted(() => {
  measureWentismWidth()
  window.addEventListener('resize', measureWentismWidth)
})

// 行颜色：选中行用主题浅色；测试后"打回"的问题（工程师标志被重置为 N 且有返回时间）整行淡红色
const getTableRowClassName = ({ row }: { row: any }) => {
  if (selectedId.value === row.id) return 'selected-row'
  if (row.gongchengsbz === 'N' && row.fanhuisj) {
    return 'test-returned-row'
  }
  return ''
}

// 医院下拉远程搜索（输入关键词才请求，支持拼音码）
const searchHospitals = async (query: string) => {
  if (!query) return
  hospitalLoading.value = true
  try {
    const res = await axios.get('/api/dict/hospitals?keyword=' + query)
    hospitals.value = res.data.data || []
  } catch (err) { console.error('搜索医院失败:', err) }
  finally { hospitalLoading.value = false }
}

// 一次性加载全部医院（用于编辑时回显下拉）
const loadHospitals = async () => {
  if (hospitals.value.length > 0) return
  try {
    const res = await axios.get('/api/dict/hospitals')
    hospitals.value = res.data.data || []
  } catch (err) { console.error('加载医院失败:', err) }
}

// 并行加载四个下拉字典（Promise.all = 同时发4个请求，等全部完成）
// 类比 VB6：相当于同时开了4个异步请求，全部返回后才继续
const loadDicts = async () => {
  try {
    const [e, m, s, y] = await Promise.all([
      axios.get('/api/dict/engineers'), 
      axios.get('/api/dict/modules'),
      axios.get('/api/dict/shishi'),
      axios.get('/api/dict/yanfa')
    ])
    
    engineers.value = e.data?.data || []
    modules.value = m.data?.data || []
    shishiList.value = s.data?.data || []
    yanfaList.value = y.data?.data || []
  } catch (err) { console.error('字典加载失败:', err) }
}

// ============ 核心：加载问题列表 ============
// 关键：不同身份的人查到的数据范围不同（客户只看自己，员工看自己跟进的）
const loadData = async () => {
  loading.value = true
  const user = JSON.parse(localStorage.getItem('user') || '{}')
  const currentUserName = user?.realName || user?.username || localStorage.getItem('username') || ''
  const currentUserType = user?.userType || '内部员工'   // 身份：客户 / 内部员工
  const currentUserHospital = user?.hospital || ''       // 客户绑定的医院
  
  // 组装查询参数：undefined 的字段后端会忽略（不参与过滤）
  const params: any = { 
    page: pagination.page, 
    pageSize: pagination.pageSize, 
    yiyuanmc: searchForm.yiyuanmc || undefined, 
    mokuai: searchForm.mokuai || undefined, 
    id: searchForm.id || undefined,
    startDate: searchForm.startDate || undefined,   // 录入日期起
    endDate: searchForm.endDate || undefined,       // 录入日期止
    zhuangtai: searchForm.zhuangtai || undefined,   // 问题状态
    keyword: searchForm.wentism || undefined        // 问题说明模糊检索（后端按 wentism LIKE）
  }
  
  // ① 客户用户：强制只查本医院的问题（医院的查询条件被覆盖，客户改不了）
  if (currentUserType === '客户' && currentUserHospital) {
    params.yiyuanmc = currentUserHospital
  } else {
    // ② 内部员工：
    //   不勾"查看所有问题" -> 只查自己跟进的问题（shishiry=当前登录者）
    //   勾了"查看所有问题" -> 可选跟进人员过滤；不选就是全部
    if (!viewAll.value) {
      // 与我有关（默认勾选）：当前用户编码与 跟进人/工程师/反馈人/测试人 任一相等即显示
      // 不勾：只查自己跟进（shishiryBM）
      if (myRelated.value) {
        params.relatedBM = localStorage.getItem('userCode') || ''
      } else {
        params.shishiryBM = localStorage.getItem('userCode') || ''
      }
    } else if (selectedShishiry.value) {
      params.shishiryBM = selectedShishiry.value  // 选定跟进人员（编码）
    }
  }
  
  try {
    const res = await axios.get('/api/feedback', { params })
    const data = res.data?.data || res.data || res  // 兼容不同返回结构
    // 兼容字段别名：后端可能返回 hospital/module/engineer，前端统一成 yiyuanmc/mokuai/xggcs
    tableData.value = (data?.list || []).map((item: any) => ({
      ...item,
      yiyuanmc: item.yiyuanmc || item.hospital,
      mokuai: item.mokuai || item.module,
      xggcs: item.xggcs || item.engineer
    }))
    pagination.total = data?.total || 0  // 总条数（分页用）
  } catch (err) { console.error('加载列表失败:', err) }
  finally { loading.value = false }
}

// 点"查询"：回到第一页再加载
const handleSearch = () => { pagination.page = 1; loadData() }
// 点"重置条件"：把搜索栏清回默认（日期=最近一年，状态=未完成，其余为空）
const handleResetSearch = () => { 
  const defaultRange = getDefaultDateRange()
  searchForm.yiyuanmc = ''
  searchForm.mokuai = ''
  searchForm.id = ''
  searchForm.zhuangtai = 'weiwan'
  searchForm.wentism = ''
  searchForm.startDate = defaultRange.startDate
  searchForm.endDate = defaultRange.endDate
  dateRange.value = [defaultRange.startDate, defaultRange.endDate]
  viewAll.value = false
  selectedShishiry.value = ''
  handleSearch()
}

// 模块下拉变化 -> 按 [版本+模块] 加载对应的窗体列表（联动）
const onModuleChange = async (moduleName: any) => {
  form.chuangtimc = ''   // 清空已选的窗体
  forms.value = []
  if (!moduleName) return
  try { const res = await axios.get(`/api/dict/forms?module=${encodeURIComponent(moduleName)}&banben=${encodeURIComponent(form.banben || '')}`); forms.value = res.data.data || [] } 
  catch (err) { console.error('加载窗体失败:', err) }
}

// 窗体输入变化处理：支持"手写新窗体"功能
// 关键点：只有手动录入新名字（列表里不存在）时才会触发保存到数据库；
//         从下拉列表选择已有项不会重复添加（change 事件不区分，靠 exists 判断拦截）
const handleFormChange = async () => {
  const value = form.chuangtimc
  if (!value || !form.mokuai) return
  // 判断当前输入的名字在本版本+模块下是否已存在
  const exists = forms.value.some((f: any) => (f.label || f.chuangtimc || '') === value)
  if (exists) {
    ElMessage.info('窗体「' + value + '」在【' + form.banben + ' / ' + form.mokuai + '】下已存在，无需重复添加')
    return
  }
  // 不存在 -> 保存为新窗体（写进窗体表，下次下拉就能直接选了）
  try {
    await axios.post('/api/dict/forms', { 
      banben: form.banben,
      mokuai: form.mokuai, 
      chuangtimc: value 
    })
    ElMessage.success('新窗体「' + value + '」已保存到【' + form.banben + ' / ' + form.mokuai + '】')
    await onModuleChange(form.mokuai)  // 刷新窗体下拉（新项出现在列表里）
    form.chuangtimc = value
  } catch (err) { 
    console.error('保存窗体失败:', err) 
    ElMessage.error('保存窗体失败')
  }
}

// 版本下拉变化 -> 加载该版本下的模块列表，同时清空已选的模块/窗体
// 形成三级联动：版本 -> 模块 -> 窗体
const onVersionChange = async (banben: string) => {
  form.mokuai = ''
  form.chuangtimc = ''
  modules.value = []
  forms.value = []
  if (!banben) return
  try {
    const res = await axios.get('/api/dict/modules', { params: { banben } })
    modules.value = res.data?.data || []
  } catch (err) { console.error('加载模块失败:', err) }
}

// 点击"新增问题"：打开空表单，并按登录者身份自动填默认值
const handleAdd = async () => {
  isEdit.value = false  // 标记为新增模式
  // 获取当前登录者信息（姓名/医院/跟进人/身份）
  const userStr = localStorage.getItem('user')
  let currentUser = ''
  let userHospital = ''
  let userFollower = ''
  let userType = '内部员工'
  if (userStr) {
    try {
      const userObj = JSON.parse(userStr)
      currentUser = userObj?.realName || userObj?.username || ''
      userHospital = userObj?.hospital || ''
      userFollower = userObj?.follower || ''
      userType = userObj?.userType || '内部员工'
    } catch (e) {
      currentUser = localStorage.getItem('username') || ''
    }
  } else {
    currentUser = localStorage.getItem('username') || ''
  }
  
  // 重置表单为初始值
  form.id = 0
  form.banben = 'HIS问题'   // 版本默认 HIS问题
  shouhouDaoqiRi.value = ''  // 清空售后到期日
  // 客户用户：医院/跟进人/工程师 全部取用户管理里绑定的值（页面里这几个下拉是只读的）
  if (userType === '客户') {
    form.yiyuanmc = userHospital
    form.shishiry = userFollower
    form.xggcs = userFollower  // 工程师默认绑定为跟进人员（客户不用自己选工程师）
  } else {
    // 内部员工：跟进人员默认为当前登录者本人
    form.yiyuanmc = ''
    form.shishiry = currentUser  // 跟进人员默认为当前登录者
    form.shishiryBM = localStorage.getItem('userCode') || ''  // 跟进人员编码
    form.xggcs = ''
  }
  form.mokuai = ''
  form.chuangtimc = ''
  form.jingjicd = '一般'   // 紧急程度默认"一般"
  form.wentilx = '其它问题' // 问题类型默认"其它问题"
  form.wentism = ''
  form.shouzhongcs = ''
  form.shouhoucs = ''
  form.shcsgcs = ''
  form.cssj = null
  form.fanhuisj = null
  uploadFileList.value = []
  forms.value = []
  dialogVisible.value = true  // 弹出新增对话框
  
  // 加载默认版本对应的模块
  onVersionChange('HIS问题')
}

// 查看问题：把行数据传给统一窗体（组件内部自动加载详情/附件/售后到期日）
const handleView = (row: any) => {
  viewProblem.value = row
  viewDialogVisible.value = true
}

const handleViewImage = (url: string) => {
  previewItems.value = detailItems.value
  currentIndex.value = previewItems.value.findIndex(u => u.url === url)
  previewVisible.value = true
}

const getJingjiType = (level: string) => {
  if (level === '紧急') return 'danger'
  if (level === '急') return 'warning'
  return 'info'
}

// 编辑问题：先校验权限（只有待修改状态可编辑），再填充表单
const handleEdit = async (row: any) => {
  // 权限验证：只有待修改状态的问题才能编辑
  if (!canEdit(row)) {
    ElMessage.warning('只有待修改状态的问题才能编辑')
    return
  }
  isEdit.value = true
  const rowCopy = JSON.parse(JSON.stringify(row))
  rowCopy.yiyuanmc = rowCopy.yiyuanmc || rowCopy.hospital
  rowCopy.mokuai = rowCopy.mokuai || rowCopy.module
  rowCopy.xggcs = rowCopy.xggcs || rowCopy.engineer
  rowCopy.wentilx = rowCopy.wentilx || '其它问题'  // 老数据没有问题类型的兜底
  Object.assign(form, rowCopy)
  uploadFileList.value = []
  forms.value = []
  try {
    const res = await axios.get(`/api/feedback/images/${row.id}`)
    const imgs = res.data
    console.log('加载图片返回:', imgs)
    if (imgs && imgs.length > 0) {
      // 兼容两种格式：字符串数组 ['11-1.png'] 或对象数组 [{filename: '11-1.png', url: '...'}]
      uploadFileList.value = imgs.map((img: any) => {
        const name = typeof img === 'string' ? img : (img.filename || img.name)
        return { name, url: `/api/feedback/uploads/${name}`, status: 'success', channel: 'image' }
      })
    }
  } catch (err) { console.error('加载图片失败:', err) }
  // 同时加载附件渠道文件（文档等，zd_fjxx 表）
  try {
    const fRes = await axios.get(`/api/feedback/files/${row.id}`)
    const fList = fRes.data
    if (fList && fList.length > 0) {
      const attachItems = fList.map((f: any) => ({
        name: f.name || f.filename,
        filename: f.filename,
        url: `/api/feedback/file-uploads/${encodeURIComponent(f.filename || f.name)}`,
        status: 'success',
        channel: 'file',
        seq: f.seq || 0
      }))
      uploadFileList.value = [...uploadFileList.value, ...attachItems]
    }
  } catch (err) { console.error('加载文件附件失败:', err) }
  if (form.mokuai) {
    try { const res = await axios.get(`/api/dict/forms?module=${encodeURIComponent(form.mokuai)}`); forms.value = res.data.data || [] }
    catch (err) { console.error('加载窗体失败:', err) }
  }
  // 加载对应版本的模块列表
  if (form.banben) {
    try {
      const res = await axios.get('/api/dict/modules', { params: { banben: form.banben } })
      modules.value = res.data?.data || []
    } catch (err) { console.error('加载模块失败:', err) }
  }
  // 编辑时如果有医院名称，查询售后到期日
  if (form.yiyuanmc) {
    try {
      const response = await axios.get(`/api/hospital/syq?name=${encodeURIComponent(form.yiyuanmc)}`)
      if (response.data && response.data.syq) {
        shouhouDaoqiRi.value = response.data.syq
      } else {
        shouhouDaoqiRi.value = ''
      }
    } catch (e) {
      console.error('查询售后到期日失败:', e)
      shouhouDaoqiRi.value = ''
    }
  } else {
    shouhouDaoqiRi.value = ''
  }
  dialogVisible.value = true
}

// 删除问题：二次确认（ElMessageBox.confirm 弹窗）后再调后端接口
const handleDelete = async (row: any) => {
  // 权限验证：只有待修改状态且是反馈人本人或管理员才能删除
  if (!canDelete(row)) {
    ElMessage.warning('只有待修改状态的问题，且是反馈人本人或管理员才能删除')
    return
  }
  try {
    await ElMessageBox.confirm('确定要删除该问题吗？', '提示', { type: 'warning' })
    await axios.delete(`/api/feedback/${row.id}`)
    ElMessage.success('删除成功')
    loadData()
  } catch (err: any) { if (err !== 'cancel') ElMessage.error(err.message || '删除失败') }
}

// ============ 附件相关操作 ============
// 编辑对话框中点附件卡片：把所有附件放进轮播，定位到当前个
const handlePreview = (file: any) => {
  previewItems.value = uploadFileList.value.map(f => {
    const name = f.name || f.url?.split('/').pop() || ''
    return { url: f.url, type: getAttachType(name), name }
  })
  const idx = previewItems.value.findIndex(it => it.url === file.url)
  currentIndex.value = idx > -1 ? idx : 0
  previewVisible.value = true
}
// 编辑对话框中删除单个附件 - 带确认提示（先删后端文件，再删本地列表项）
const handleRemove = async (file: any, fileList: any) => {
  try {
    await ElMessageBox.confirm('确定要删除当前附件吗？', '提示', { type: 'warning' })
    if (file.url && file.name) {
      const filename = file.filename || file.name || file.url.split('/').pop()
      if (filename) {
        if (file.channel === 'file') {
          // 附件渠道：走附件删除接口，仅上传者本人可删
          await axios.delete(`/api/feedback/file/${encodeURIComponent(filename)}`, { data: { currentUser: currentUserCode.value } })
        } else {
          await axios.delete(`/api/feedback/image/${filename}`)
        }
      }
    }
    const idx = uploadFileList.value.findIndex(f => f.url === file.url)
    if (idx > -1) uploadFileList.value.splice(idx, 1)
    ElMessage.success('删除成功')
  } catch (e: any) {
    if (e !== 'cancel') ElMessage.error(e.message || '删除失败')
  }
}

// 选择文件时检查大小：单个附件不超过 50MB，超限直接移除并提示
const handleFileChange = (file: any) => {
  const raw = file.raw || file.rawFile
  if (raw && raw.size > 50 * 1024 * 1024) {
    ElMessage.warning(`文件「${raw.name}」超过 50MB，不能上传`)
    const idx = uploadFileList.value.findIndex(f => f.uid === file.uid)
    if (idx > -1) uploadFileList.value.splice(idx, 1)
  }
  // 自动分类：图片/视频 -> 图片渠道，其它文档 -> 附件渠道
  if (raw) {
    const item = uploadFileList.value.find(f => f.uid === file.uid)
    if (item) item.channel = isMediaFile(raw) ? 'image' : 'file'
  }
}

// 支持 Ctrl+V 直接粘贴剪贴板里的图片或复制的文件到上传列表
const handlePaste = (event: ClipboardEvent) => {
  const cd = event.clipboardData
  if (!cd) return
  // 同一剪贴板内容会同时出现在 files 与 items 两个来源（部分来源文件名/时间戳不一致，
  // 按 key 去重也会漏掉），因此这里只取一个来源：
  //   优先 files（资源管理器复制文件），否则取 items 里的 image（截图）
  let picked: File[] = []
  if (cd.files && cd.files.length > 0) {
    picked = Array.from(cd.files)
  } else if (cd.items) {
    picked = Array.from(cd.items)
      .filter(i => i.type.startsWith('image/'))
      .map(i => i.getAsFile())
      .filter(Boolean) as File[]
  }
  for (const f of picked) {
    if (f.size > 50 * 1024 * 1024) {
      ElMessage.warning(`文件「${f.name}」超过 50MB，不能上传`)
      continue
    }
    const url = URL.createObjectURL(f)
    uploadFileList.value.push({ name: f.name, url, raw: f, status: 'ready', channel: isMediaFile(f) ? 'image' : 'file' })
  }
}

// 列表里点"查看附件"图标：加载该问题的所有附件并打开轮播
const viewImages = async (row: any) => {
  try {
    const res = await axios.get(`/api/feedback/images/${row.id}`)
    const imgs = res.data
    if (imgs && imgs.length > 0) {
      previewItems.value = imgs.map((name: any) => toAttachItem(typeof name === 'string' ? name : (name.filename || name.name)))
    } else {
      previewItems.value = []
    }
  } catch (err) { 
    console.error('加载附件失败:', err)
    previewItems.value = []
  }
  previewVisible.value = true
}

// ============ 核心：保存（新增或更新） ============
// ============ 模板按钮追加（测试意见，双击弹窗条目） ============
const appendShouzhongcs = (text: string) => {
  form.shouzhongcs = form.shouzhongcs ? form.shouzhongcs + '\n' + text : text
}

const handleSubmit = async () => {
  try {
    await formRef.value.validate()  // 先过必填校验，不过直接抛错到 catch
    submitting.value = true
    
    const data = { ...form }  // 浅拷贝表单（避免直接改 form）
    if (!isEdit.value) {
      // 新增时才初始化这些状态字段（编辑时保持数据库里的原值不动）
      data.shouzhongbz = 'Y'    // 售后标志：先置Y（问题已受理）
      data.gongchengsbz = 'N'   // 工程师处理标志：初始未处理
      const userStr = localStorage.getItem('user')
      const user = userStr ? JSON.parse(userStr) : null
      data.szcsgcs = user?.realName || user?.username || localStorage.getItem('username') || ''  // 反馈人=当前登录者
      data.szcsgcsBM = user?.username || localStorage.getItem('userCode') || ''  // 反馈人编码
      data.FanKuiQD = user?.userType || '内部员工'  // 反馈渠道=登录者的用户类型
    }
    
    // 人员编码：根据姓名从人员列表匹配（跟进人/工程师）
    const sUser = shishiList.value.find((x: any) => (x.value || x.xingming) === data.shishiry)
    if (sUser?.username) data.shishiryBM = sUser.username
    const yUser = yanfaList.value.find((x: any) => (x.value || x.xingming) === data.xggcs)
    if (yUser?.username) data.xggcsBM = yUser.username
    
    let savedFeedback = null
    
    if (isEdit.value) {
      await axios.put(`/api/feedback/${form.id}`, data)
      savedFeedback = { id: form.id }
    } else {
      const res = await axios.post('/api/feedback', data)
      console.log('新增问题完整响应 res:', res)
      console.log('res.data:', res.data)
      console.log('res.data.data:', res.data?.data)
      
      // 健壮地获取返回的数据对象（兼容多种响应结构）
      if (res.data?.data?.id !== undefined) {
        savedFeedback = res.data.data
      } else if (res.data?.id !== undefined) {
        savedFeedback = res.data
      } else if (res?.data?.id !== undefined) {
        savedFeedback = res.data
      } else {
        savedFeedback = res.data?.data || res.data || res
      }
      console.log('最终 savedFeedback:', savedFeedback)
    }
    
    // 上传图片
    const idToUse = savedFeedback?.id || form.id
    console.log('新增问题返回的savedFeedback:', savedFeedback, 'idToUse:', idToUse)
    console.log('uploadFileList:', uploadFileList.value)
    
    // 更健壮的文件过滤：支持 raw、rawFile 或 File 对象
    const rawFiles = uploadFileList.value.filter(f => f.raw || f.rawFile || (f instanceof File))
    const existingFiles = uploadFileList.value.filter(f => !(f.raw || f.rawFile || (f instanceof File)))
    // 自动分类：图片/视频 -> 图片渠道(upload)，其它文档 -> 附件渠道(upload-file)
    const mediaFiles = rawFiles.filter(f => isMediaFile(f.raw || f.rawFile || f))
    const docFiles = rawFiles.filter(f => !isMediaFile(f.raw || f.rawFile || f))
    console.log('需要上传文件数:', rawFiles.length, '（图片/视频:', mediaFiles.length, '文档:', docFiles.length, '）已存在:', existingFiles.length)

    let maxTpnum = 0  // 图片序号（{id}-{n}.{ext}）
    let maxSeq = 0    // 附件序号（{id}-{n}#{原名} / zd_fjxx.seq）
    existingFiles.forEach(f => {
      if (f.channel !== 'file' && f.name) {
        const match = f.name.match(/^\d+-(\d+)\./)
        if (match) {
          const num = parseInt(match[1])
          if (num > maxTpnum) maxTpnum = num
        }
      }
      if (f.seq && f.seq > maxSeq) maxSeq = f.seq
    })
    // 1) 图片/视频 -> 图片渠道（upload，视频自动转码）
    for (let i = 0; i < mediaFiles.length; i++) {
      const formData = new FormData()
      const fileObj = mediaFiles[i].raw || mediaFiles[i].rawFile || mediaFiles[i]
      // 上传前再次校验大小（选择时已校验，这里兜底）
      if (fileObj.size > 50 * 1024 * 1024) {
        ElMessage.warning(`文件「${fileObj.name}」超过 50MB，已跳过上传`)
        continue
      }
      formData.append('file', fileObj)
      formData.append('id', String(idToUse))
      formData.append('yiyuanmc', form.yiyuanmc || '')
      formData.append('tpnum', String(maxTpnum + i + 1))
      try {
        console.log('上传图片/视频:', i + 1, '/', mediaFiles.length, '文件名:', fileObj.name)
        await axios.post('/api/feedback/upload', formData, { headers: { 'Content-Type': 'multipart/form-data' } })
      } catch (err) {
        console.error('上传图片/视频失败:', err)
        ElMessage.error('图片/视频上传失败: ' + (err as any)?.message)
      }
    }
    // 2) 文档等 -> 附件渠道（upload-file，写入 zd_fjxx 并记录上传者）
    for (let i = 0; i < docFiles.length; i++) {
      const formData = new FormData()
      const fileObj = docFiles[i].raw || docFiles[i].rawFile || docFiles[i]
      if (fileObj.size > 50 * 1024 * 1024) {
        ElMessage.warning(`文件「${fileObj.name}」超过 50MB，已跳过上传`)
        continue
      }
      formData.append('file', fileObj)
      formData.append('id', String(idToUse))
      formData.append('tpnum', String(maxSeq + i + 1))
      formData.append('uploadUser', currentUserCode.value)
      formData.append('uploadName', currentUserName.value)
      try {
        console.log('上传附件:', i + 1, '/', docFiles.length, '文件名:', fileObj.name)
        await axios.post('/api/feedback/upload-file', formData, { headers: { 'Content-Type': 'multipart/form-data' } })
      } catch (err) {
        console.error('附件上传失败:', err)
        ElMessage.error('附件上传失败: ' + (err as any)?.message)
      }
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

onMounted(() => { initCurrentUser(); loadDicts(); loadData() })

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
.feedback-container { padding: 0; }
.card-header { display: flex; justify-content: space-between; align-items: center; }
.search-form { margin-bottom: 10px; flex-wrap: nowrap; white-space: nowrap; }
.search-form .el-form-item { flex-shrink: 0; }  /* 查询行不换行：宽度不足时由整页缩放处理 */
/* 查询条件第二行：问题说明 + 录入日期 */
.search-row-2 { display: flex; flex-wrap: nowrap; align-items: center; gap: 0; width: 100%; }
/* 第二行控件间距 1px */
.search-row-2 .el-form-item { margin-right: var(--qgap) !important; margin-bottom: 0 !important; }
.search-row-2 .wentism-item { flex: 0 1 auto; min-width: 0; }
.search-row-2 .wentism-item .el-input { width: 100%; }
/* 按钮组：固定在末尾，不压缩 */
.search-row-2 .btn-group-2 { flex: 0 0 auto; margin-right: 0 !important; display: flex; align-items: center; }
.search-row-2 .btn-group-2 .el-button, .search-row-2 .btn-group-2 .check-item { margin: 0 var(--qgap); }
/* 第一行控件间距 6px（含查看所有/新增问题） */
.search-form .el-form-item { margin-right: var(--qgap) !important; margin-bottom: 10px !important; }
/* 查看所有/新增/查询/重置 宽度统一：JS 写入 --search-btn-w 取四者最大值 */
.search-form { --search-btn-w: 110px; --search-btn-h: 40px; }
.search-form .btn-group-1 { display: inline-flex; align-items: center; vertical-align: top; margin-left: var(--qgap); }
.search-form .btn-group-1 .el-button { width: var(--search-btn-w); height: 32px; margin: 0 var(--qgap); }
.search-row-2 .btn-group-2 .check-item { margin: 0 6px; }
.search-form .morandi-btn { min-width: var(--search-btn-w); }
/* 第二行顶部对齐：录入日期与查询按钮上边缘齐平 */
.search-row-2 { align-items: flex-start; }
/* 复选框跟随系统主题（与问题处理/测试页一致）：主色边框 + 浅色底 */
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
.full-width { width: 100%; }


/* 表格内容不换行，超出显示省略号 */
:deep(.el-table .cell) {
  white-space: nowrap !important;
  overflow: hidden !important;
  text-overflow: ellipsis !important;
  cursor: default !important;
}
/* 列表只读：文字上显示普通鼠标箭头；可点击按钮仍显示手型 */
:deep(.el-table .cell .el-button) { cursor: pointer !important; }

/* 操作列按钮禁用态：字体变灰，不可操作；鼠标经过不显示任何效果 */
:deep(.el-table .el-button.is-disabled.is-link),
:deep(.el-table .el-button.is-disabled) {
  color: #b3b8bf !important;
  cursor: not-allowed;
}
:deep(.el-table .el-button.is-disabled.is-link:hover),
:deep(.el-table .el-button.is-disabled.is-link:focus),
:deep(.el-table .el-button.is-disabled:hover),
:deep(.el-table .el-button.is-disabled:focus) {
  color: #b3b8bf !important;
  background: transparent !important;
  border-color: transparent !important;
  box-shadow: none !important;
  transform: none !important;
  opacity: 1;
}

/* 莫兰迪按钮 - 仅尺寸定制（本页按钮整体偏大）；配色/悬停/禁用/主题切换统一走全局 theme.css */
.morandi-btn { padding: 10px 22px !important; font-size: 14px !important; margin: 0 5px; }
/* 紧急程度和售后到期日同一行，左右分布 */
.priority-content { display: flex; justify-content: space-between; align-items: center; width: 100%; }
.priority-box { display: flex; gap: 8px; }
.priority-box .el-button { min-width: 60px; font-size: 12px; padding: 6px 12px; font-weight: 500; }
.priority-box .el-button.active { transform: scale(1.05); box-shadow: 0 2px 8px rgba(0,0,0,0.15); }
/* 紧急程度选中状态背景色（不依赖 Element Plus type，避免被全局主题覆盖） */
.priority-box .el-button.priority-btn.danger.active {
  background: linear-gradient(135deg, #E08484 0%, #D65C5C 100%) !important;
  color: #ffffff !important;
  border: none !important;
}
.priority-box .el-button.priority-btn.warning.active {
  background: linear-gradient(135deg, #E8C87A 0%, #D4A84A 100%) !important;
  color: #ffffff !important;
  border: none !important;
}
.priority-box .el-button.priority-btn.info.active {
  background: linear-gradient(135deg, #9AA0A6 0%, #7A8086 100%) !important;
  color: #ffffff !important;
  border: none !important;
}
.shouhou-right { display: flex; align-items: center; gap: 6px; margin-left: auto; }
.shouhou-title { font-size: 14px; color: #606266; white-space: nowrap; font-weight: 500; }

/* 售后到期日显示 */
.shouhou-date { display: flex; align-items: center; gap: 4px; padding: 2px 8px; border-radius: 4px; font-size: 12px; font-weight: 500; white-space: nowrap; height: 24px; box-sizing: border-box; line-height: 20px; }
.shouhou-date.expired { background: #fef0f0; color: #f56c6c; border: 1px solid #fbc4c4; }
.shouhou-date.valid { background: #ecf5ff; color: var(--el-color-primary); border: 1px solid #b3d8ff; }
.view-dialog-actions { display: flex; justify-content: center; align-items: center; margin-top: 20px; width: 100%; text-align: center; }
.view-dialog-actions .el-button { padding: 11px 36px !important; font-size: 14px !important; height: auto; line-height: 1.5; }

/* 淡黄色按钮 */
.lsh-box :deep(.el-input__wrapper) { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; }
.lsh-box :deep(.el-input__inner) { color: white; font-weight: bold; }
.priority-box { display: flex; gap: 8px; }
.priority-box .el-button { min-width: 60px; font-size: 12px; padding: 6px 12px; font-weight: 500; }
.priority-box .el-button.active { transform: scale(1.05); box-shadow: 0 2px 8px rgba(0,0,0,0.15); }

.upload-area { width: 100%; }
.upload-icon { font-size: 28px; color: #999; }
.upload-text { font-size: 12px; color: #999; margin-top: 8px; text-align: center; line-height: 1.6; }
.viewer-tip { margin-top: 12px; padding: 8px 12px; background: #ecf5ff; color: var(--el-color-primary); border-radius: 4px; font-size: 12px; text-align: center; }

/* 选中行：跟随系统主题的明显底色 + 整行加粗，一眼可辨 */
:deep(.selected-row) {
  background-color: var(--el-color-primary-light-9) !important;
}
:deep(.selected-row td) {
  font-weight: 600 !important;
}

/* 测试后返回的问题行颜色：淡淡的红色 */
:deep(.test-returned-row) {
  background-color: #fef0f0 !important;
}

/* 轮播样式 */
.carousel-container { text-align: center; display: flex; flex-direction: column; }
.carousel-wrapper { display: flex; align-items: center; justify-content: center; height: 560px; background: #f5f7fa; border-radius: 8px; overflow: hidden; flex-shrink: 0; }
.carousel-image { max-width: 100%; max-height: 100%; width: auto; height: auto; object-fit: contain; }
.carousel-controls { display: flex; align-items: center; justify-content: center; gap: 20px; margin: 20px 0; flex-shrink: 0; }
.carousel-indicator { font-size: 16px; font-weight: 600; color: var(--el-color-primary); min-width: 60px; }
.carousel-actions { margin-top: 20px; flex-shrink: 0; display: flex; justify-content: center; gap: 1px; }
.carousel-back { margin-top: 12px; flex-shrink: 0; }

/* 图片预览对话框：固定尺寸 */
.preview-dialog :deep(.el-dialog) { width: 960px !important; height: 760px !important; display: flex; flex-direction: column; }
.preview-dialog :deep(.el-dialog__body) { flex: 1; overflow: auto; display: flex; flex-direction: column; }

/* 查看对话框附件样式 */
.view-images { display: flex; flex-wrap: wrap; gap: 12px; }
.view-image { width: 120px; height: 120px; object-fit: cover; border-radius: 6px; border: 1px solid #dcdfe6; transition: all 0.3s; }
.view-image:hover { transform: scale(1.05); box-shadow: 0 4px 12px rgba(0,0,0,0.15); }
/* 查看对话框里的非图片文件：图标 + 文件名 */
.view-file { display: inline-flex; align-items: center; gap: 6px; padding: 8px 14px; border: 1px solid #dcdfe6; border-radius: 6px; cursor: pointer; font-size: 13px; color: var(--el-color-primary); max-width: 260px; }
.view-file:hover { background: var(--el-color-primary-light-9); }
.view-file span { overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }

/* 上传卡片：图片缩略图 / 文件图标（跟随主题） */
:deep(.el-upload-list--picture-card .el-upload-list__item) { overflow: hidden; }
.file-card { position: relative; width: 100%; height: 100%; display: flex; flex-direction: column; align-items: center; justify-content: center; cursor: pointer; }
.file-thumb { width: 100%; height: 100%; object-fit: cover; }
.file-icon { display: flex; flex-direction: column; align-items: center; gap: 4px; padding: 8px; font-size: 28px; color: var(--el-color-primary); }
.file-name { font-size: 11px; color: #606266; max-width: 100%; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; padding: 0 6px; }
.file-card-del { position: absolute; top: 2px; right: 2px; width: 20px; height: 20px; border-radius: 50%; background: rgba(0,0,0,0.45); color: #fff; display: flex; align-items: center; justify-content: center; font-size: 12px; z-index: 2; }
.file-card-del:hover { background: #f56c6c; }

/* 轮播里的视频 / 其他文件 */
.carousel-video { max-width: 100%; max-height: 100%; width: auto; height: auto; }
.video-error-tip { margin-top: 12px; padding: 10px 16px; background: #fef0f0; color: #f56c6c; border: 1px solid #fbc4c4; border-radius: 6px; font-size: 13px; line-height: 1.7; text-align: center; max-width: 640px; }
.carousel-file { display: flex; flex-direction: column; align-items: center; gap: 12px; }
.carousel-file-icon { font-size: 64px; color: var(--el-color-primary); }
.carousel-file-name { font-size: 15px; font-weight: 600; color: #303133; word-break: break-all; text-align: center; max-width: 600px; }
</style>
