<template>
  <div class="handle-page">
    <!-- 上部：处理问题表单 -->
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
              <div class="info-value textarea large-text zoomable" @dblclick="openZoom('问题说明', form, 'wentism', true)">{{ form.wentism || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="6">
            <div class="info-item large">
              <div class="info-label big">测试说明</div>
              <div class="info-value textarea large-text zoomable" @dblclick="openZoom('测试说明', form, 'shouzhongcs', true)">
                <template v-if="form.shouzhongcs">
                  <div v-for="(line, i) in shouzhongcsLines(form.shouzhongcs)" :key="i" :style="assignLineStyle(line)">{{ line }}</div>
                </template>
                <span v-else>-</span>
              </div>
            </div>
          </el-col>
          <el-col :span="4" v-if="form.shouhoucs">
            <div class="info-item large test-result-box">
              <div class="info-label big">测试结果（返回原因）</div>
              <div class="info-value textarea large-text zoomable" style="color: #f56c6c; font-weight: 500;" @dblclick="openZoom('测试结果（返回原因）', form, 'shouhoucs', true)">{{ form.shouhoucs }}</div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="info-item large">
              <div class="info-label big required">处理意见</div>
              <div style="display:flex; align-items:flex-start; gap:6px; width:100%">
                <el-input class="opinion-input" v-model="form.gongcscs" type="textarea" :rows="4" placeholder="请填写处理意见..." @dblclick="openZoom('处理意见', form, 'gongcscs', false)" />
                <div style="display:flex; flex-direction:column; gap:6px;">
                  <TemplatePicker :lx="'处理意见'" @select="appendGongcscs" />
                  <el-button class="morandi-btn morandi-blue" size="large" @click="openAttachDialog" :disabled="!form.id">
                    <el-icon><FolderOpened /></el-icon> 上传附件
                  </el-button>
                </div>
              </div>
            </div>
          </el-col>
        </el-row>
      </div>
    </el-card>

    <!-- 文本框双击放大查看/编辑弹窗 -->
    <el-dialog v-model="zoomState.visible" width="900px" top="8vh" :show-close="false">
      <template #header>
        <div style="display:flex; align-items:center; justify-content:space-between; width:100%; padding-right:4px;">
          <span>{{ zoomState.title }}</span>
          <el-button class="morandi-red" size="large" @click="zoomState.visible = false">返回列表</el-button>
        </div>
      </template>
      <el-input v-model="zoomState.model[zoomState.field]" type="textarea" :rows="18" :readonly="zoomState.readonly" resize="none" />
      <div style="color:#909399; font-size:12px; margin-top:8px;">{{ zoomState.readonly ? '只读查看：关闭后自动回到原内容' : '可编辑：修改后自动同步回原输入框' }}</div>
    </el-dialog>

    <!-- 附件管理弹窗（文件上传/查看/下载/删除，选择后立即上传） -->
    <el-dialog v-model="attachDialog.visible" width="720px" top="8vh" :show-close="false">
      <template #header>
        <div style="display:flex; align-items:center; justify-content:space-between; width:100%; padding-right:4px;">
          <span>{{ '附件管理（问题ID: ' + (form.id || '-') + '）' }}</span>
          <el-button class="morandi-btn morandi-blue" @click="attachDialog.visible = false">返回列表</el-button>
        </div>
      </template>
      <div class="attach-tip">已上传文件（图片/视频/文档，单个≤50MB）：</div>
      <div class="attach-list">
        <div v-for="f in attachFiles" :key="f.filename" class="attach-item">
          <el-icon><Document /></el-icon>
          <span class="attach-name" :title="f.name">{{ f.name }}</span>
          <el-button link type="primary" @click="previewAttach(f)">查看</el-button>
          <el-button link type="success" @click="downloadAttach(f)">下载</el-button>
          <el-button link type="danger" @click="removeAttach(f)">删除</el-button>
        </div>
        <el-empty v-if="attachFiles.length === 0" description="暂无文件" :image-size="60" />
      </div>
      <el-upload drag multiple :auto-upload="false" :show-file-list="false" :on-change="onAttachChange">
        <el-icon class="upload-icon" style="font-size:32px; color:#909399;"><Upload /></el-icon>
        <div style="color:#909399; font-size:13px;">拖拽文件到此处或点击选择（支持所有类型，单个≤50MB）<br/>支持 Ctrl+V 粘贴图片或文件</div>
      </el-upload>
    </el-dialog>

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
            <el-button class="morandi-btn morandi-blue" size="default" @click="handleRefresh"><el-icon><Refresh /></el-icon> 刷新列表</el-button>
          </div>
          <div class="header-actions">
            <el-button class="morandi-btn morandi-green" @click="handleSubmit" :loading="submitting">
              <el-icon><Check /></el-icon> 确认处理
            </el-button>
            <el-button class="morandi-btn morandi-blue" @click="handleAssignFollower"><el-icon><User /></el-icon> 分配跟进</el-button>
            <el-button class="morandi-btn morandi-blue" @click="handleAssign"><el-icon><User /></el-icon> 分配修改</el-button>
            <el-button class="morandi-btn morandi-yellow" @click="viewImages(form)" :disabled="!hasImages">
              <el-icon><Picture /></el-icon> 查看图片
            </el-button>
            <el-button class="morandi-btn morandi-red" @click="handleDiscuss"><el-icon><ChatDotRound /></el-icon> 待讨论</el-button>
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
        <el-table-column prop="shishiry" label="跟进人" width="70" />
        <el-table-column prop="xggcs" label="工程师" width="70" />
        <el-table-column prop="wentism" label="问题说明" min-width="40" />
        <el-table-column prop="shouzhongcs" label="测试说明" min-width="40">
          <template #default="{ row }">
            <span v-if="row.shouzhongcs">{{ row.shouzhongcs }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
        <el-table-column prop="gongcscs" label="处理意见" min-width="40">
          <template #default="{ row }">
            <span v-if="row.gongcscs">{{ row.gongcscs }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
        <el-table-column prop="shouhoucs" label="测试结果" min-width="40" v-if="!viewTaolun">
          <template #default="{ row }">
            <span v-if="row.shouhoucs" style="color: #f56c6c">{{ row.shouhoucs }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
        <el-table-column prop="lvrusj" label="录入时间" width="180">
          <template #default="{ row }">
            <span v-if="row.lvrusj">{{ formatDate(row.lvrusj) }}</span>
            <span v-else style="color: #c0c4cc">-</span>
          </template>
        </el-table-column>
        <el-table-column label="图片" width="55" align="center" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link  @click.stop="viewImages(row)"><el-icon><Picture /></el-icon></el-button>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="140" align="center" fixed="right" v-if="viewTaolun">
          <template #default="{ row }">
            <div class="action-buttons">
              <el-button type="success" size="small" @click.stop="handleReturnToPending(row)">返回</el-button>
              <el-button type="danger" size="small" @click.stop="handleDeleteProblem(row)">删除</el-button>
            </div>
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
    <el-dialog v-model="showDevSelect" title="分配修改人" width="320px">
      <el-select v-model="selectedDev" placeholder="请选择研发人员" style="width:100%">
        <el-option v-for="u in yanfaList" :key="u.username" :label="u.label" :value="u.value" />
      </el-select>
      <template #footer>
        <el-button class="btn-cancel" @click="showDevSelect=false">取消</el-button>
        <el-button class="morandi-btn morandi-blue" @click="confirmAssign">确认</el-button>
      </template>
    </el-dialog>
    <!-- 分配跟进人弹窗 -->
    <el-dialog v-model="showFollowerSelect" title="分配跟进人" width="320px">
      <el-select v-model="selectedFollower" placeholder="请选择实施人员" style="width:100%">
        <el-option v-for="u in shishiList" :key="u.username" :label="u.label" :value="u.value" />
      </el-select>
      <template #footer>
        <el-button class="btn-cancel" @click="showFollowerSelect=false">取消</el-button>
        <el-button class="morandi-btn morandi-blue" @click="confirmAssignFollower">确认</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted, nextTick, onUnmounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Edit, Check, List, Refresh, Picture, ArrowLeft, ArrowRight, User, ChatDotRound, ZoomIn, Back, Document, Download, Upload, Delete, FolderOpened } from '@element-plus/icons-vue'
import axios from 'axios'
import { downloadWithSaveDialog } from '@/utils/saveFile'
import TemplatePicker from '@/components/TemplatePicker.vue'
import ViewProblemDialog from '@/components/ViewProblemDialog.vue'

// ============ 页面状态变量 ============
const list = ref<any[]>([])      // 待处理问题列表
const selected = ref<any>(null)  // 当前选中的问题行（点行选中）
const submitting = ref(false)    // 提交处理中（防重复点击）
const viewAll = ref(false)  // "查看所有问题"复选框：默认false（只查当前工程师的）
const viewTaolun = ref(false)  // "查看待讨论"复选框：默认false（只查 taolunbz=N 的）

// 时间条件：默认查最近一年（处理页按录入时间 lvrusj 过滤）
// toISOString().split('T')[0] = 把 Date 转成 "2025-09-06" 这种日期字符串（取T前面的部分）
const getDefaultStartDate = () => {
  const date = new Date()
  date.setFullYear(date.getFullYear() - 1)  // 去年今天
  return date.toISOString().split('T')[0]
}
const getDefaultEndDate = () => {
  return new Date().toISOString().split('T')[0]  // 今天
}
const startDate = ref(getDefaultStartDate())
const endDate = ref(getDefaultEndDate())

// 判断当前用户是否有"查看非本人数据"权限（角色表 viewOthers 字段）
// 这里暂未用于强制过滤（列表权限主要在 loadList 里按 xggcs 控制）
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
// 获取当前登录者姓名（与 loadList 取法一致）
const getCurrentUserName = () => {
  const userStr = localStorage.getItem('user')
  const user = userStr ? JSON.parse(userStr) : null
  return user?.realName || user?.username || localStorage.getItem('username') || ''
}

// 生成分配记录标签：分配类型(操作人) 时间
const buildAssignNote = (type: string) => {
  return `${type}(${getCurrentUserName()}) ${formatDate(new Date())}`
}

// 测试说明按行拆分（逐行渲染用）
const shouzhongcsLines = (text: string) => (text || '').split('\n')

// 分配记录行着色：分配修改=红，分配跟进=蓝
const assignLineStyle = (line: string) => {
  if (line.startsWith('分配修改')) return { color: '#f56c6c', fontWeight: 600 }
  if (line.startsWith('分配跟进')) return { color: '#409eff', fontWeight: 600 }
  return {}
}


// 行颜色：选中行=淡蓝；测试打回的问题=淡红（提醒工程师重新处理）
const getRowClass = ({ row }: { row: any }) => {
  if (selected.value?.id === row.id) return 'selected-row'
  // 测试后返回的问题：工程师标志被重置为 N 且有过测试时间
  if (row.gongchengsbz === 'N' && row.fanhuisj) return 'test-returned-row'
  return ''
}

const getJingjiType = (type: string) => {
  if (type === '紧急') return 'danger'
  if (type === '急') return 'warning'
  return 'info'
}

// ============ 上方详情表单（点击列表行后填充） ============
// gongcscs = 工程师处理意见（处理人填写的核心字段）
const form = reactive({
  id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', shouzhongcs: '', gongcscs: '', xggcs: '', shishiry: '', jingjicd: '一般', shouhoucs: '', shcsgcs: '', cssj: null as any, fanhuisj: null as any, lvrusj: null as any
})

// ============ 文本框双击放大查看/编辑 ============
const zoomState = reactive({ visible: false, title: '', model: null as any, field: '', readonly: false })
const openZoom = (title: string, model: any, field: string, readonly = false) => {
  zoomState.title = title
  zoomState.model = model
  zoomState.field = field
  zoomState.readonly = readonly
  zoomState.visible = true
}
// ============ 文本框双击放大结束 ============

// ============ 文件附件管理（上传到 fileUploadPath，与图片分开） ============
// 文件名规则：{id}-{序号}#{原文件名}，列表展示 # 后的原文件名
const attachDialog = reactive({ visible: false })
const attachFiles = ref<any[]>([])  // [{ filename: 磁盘名, name: 原文件名, seq: 序号 }]

const openAttachDialog = () => {
  if (!form.id) { ElMessage.warning('请先选择问题'); return }
  attachDialog.visible = true
  loadAttachFiles()
}

// 加载该问题的文件附件列表
const loadAttachFiles = async () => {
  if (!form.id) { attachFiles.value = []; return }
  try {
    const res = await axios.get(`/api/feedback/files/${form.id}`)
    attachFiles.value = res.data || []
  } catch (e) {
    console.error('加载文件附件失败:', e)
    attachFiles.value = []
  }
}

// 选择文件后立即上传（自动续接序号）
const onAttachChange = async (file: any) => {
  if (!form.id) { ElMessage.warning('请先选择问题'); return }
  const fileObj = file.raw || file.rawFile
  if (!fileObj) return
  if (fileObj.size > 50 * 1024 * 1024) {
    ElMessage.warning(`文件「${fileObj.name}」超过 50MB，已跳过上传`)
    return
  }
  const maxSeq = attachFiles.value.reduce((m, f) => Math.max(m, f.seq || 0), 0)
  const fd = new FormData()
  fd.append('file', fileObj)
  fd.append('id', String(form.id))
  fd.append('tpnum', String(maxSeq + 1))
  try {
    await axios.post('/api/feedback/upload-file', fd)
    ElMessage.success(`「${fileObj.name}」上传成功`)
    loadAttachFiles()
  } catch (e) {
    console.error('文件上传失败:', e)
    ElMessage.error(`「${fileObj.name}」上传失败: ${(e as any)?.message || ''}`)
  }
}

// 新窗口预览/打开（图片/视频/可预览文件直接显示，Office 等提示下载）
const previewAttach = (f: any) => {
  window.open(`/api/feedback/file-uploads/${encodeURIComponent(f.filename)}`, '_blank')
}

// 下载文件（弹出"另存为"让用户选择保存位置）
const downloadAttach = async (f: any) => {
  const ok = await downloadWithSaveDialog(`/api/feedback/file-uploads/${encodeURIComponent(f.filename)}`, f.name)
  if (ok === true) ElMessage.success('文件已保存')
}

// 删除文件
const removeAttach = async (f: any) => {
  try {
    await ElMessageBox.confirm(`确定删除文件「${f.name}」？`, '删除确认', { type: 'warning' })
  } catch { return }
  try {
    await axios.delete(`/api/feedback/file/${encodeURIComponent(f.filename)}`)
    ElMessage.success('已删除')
    loadAttachFiles()
  } catch (e) {
    console.error('删除文件失败:', e)
    ElMessage.error('删除失败')
  }
}
// ============ 文件附件管理结束 ============

// 空表单模板：Object.assign(form, emptyForm) 一步把表单清回初始值（刷新用）
const emptyForm = {
  id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', shouzhongcs: '', gongcscs: '', xggcs: '', shishiry: '', jingjicd: '一般', shouhoucs: '', shcsgcs: '', cssj: null, fanhuisj: null, lvrusj: null
}

// ============ 核心：加载待处理问题列表 ============
// 本页只显示"待处理"的问题：gongchengsbz='N'（工程师还没处理完）
const loadList = async () => {
  const userStr = localStorage.getItem('user')
  const user = userStr ? JSON.parse(userStr) : null
  const params: any = { gongchengsbz: 'N' }  // 固定条件：未处理
  
  // 待讨论查询：打勾查 taolunbz='Y'（待讨论的问题）；不打勾查 taolunbz='N'（正常待处理）
  params.taolunbz = viewTaolun.value ? 'Y' : 'N'
  
  // 时间范围条件（问题处理页按 lvrusj 录入时间查询）
  if (startDate.value) params.startDate = startDate.value
  if (endDate.value) params.endDate = endDate.value
  params.dateField = 'lvrusj'  // 告诉后端按哪个时间字段过滤
  
  // 获取当前登录者名称（多种方式兜底）
  const currentUserName = user?.realName || user?.username || localStorage.getItem('username') || ''
  
  // 不打勾"查看所有"：只查工程师（xggcs）=当前登录者的数据（每人只看到分给自己的问题）
  // 按编码过滤：工程师编码(xggcsBM)=当前登录人编码
  const currentUserCode = localStorage.getItem('userCode') || ''
  if (!viewAll.value && (currentUserName || currentUserCode)) {
    params.xggcsBM = currentUserCode
  }
  
  try {
    console.log('查询参数:', params, 'viewAll:', viewAll.value, 'viewTaolun:', viewTaolun.value)
    const res = await axios.get('/api/feedback', { params })
    console.log('查询结果:', res.data)
    list.value = res?.data?.data?.list || res?.data?.list || []
  } catch (err) { console.error('加载列表失败', err) }
}

// 刷新：清空上方详情表单和选中状态，重新加载列表
const handleRefresh = () => {
  selected.value = null
  Object.assign(form, emptyForm)  // 表单恢复初始值（只清界面，不动数据库）
  hasImages.value = false
  loadList()
}

// 点击列表行 -> 把该问题数据填到上方表单（详情区），并查有无图片
const handleRowClick = async (row: any) => {
  selected.value = row
  const rowCopy = JSON.parse(JSON.stringify(row))  // 深拷贝，避免改到列表行
  Object.assign(form, rowCopy)  // 整行字段复制进 form（模板上自动显示）
  // 查询该问题是否有图片（决定"查看图片"按钮是否可用）
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
const viewDialogVisible = ref(false)  // 查看对话框是否显示
const viewProblem = ref<any>(null)        // 当前查看的问题行数据（传给统一查看窗体）
const detailImages = ref<string[]>([])  // 查看详情图片列表

const hasImages = ref(false)  // 当前选中问题是否有图片


// ============ 分配修改人 / 分配跟进人 ============
const yanfaList = ref([])   // 研发人员列表（sys_user isYanfa=1）——"分配修改"选人用
const shishiList = ref([])  // 实施人员列表（sys_user isShishi=1）——"分配跟进"选人用
const showDevSelect = ref(false)       // 分配修改人弹窗是否显示
const selectedDev = ref('')            // 选中的研发人员
const showFollowerSelect = ref(false)  // 分配跟进人弹窗是否显示
const selectedFollower = ref('')       // 选中的跟进人

// 加载人员下拉：研发/实施均从 sys_user 加载（dict 接口返回 {value:姓名, label:姓名, username:编码}）
const loadUsers = async () => {
  try {
    const [y, s] = await Promise.all([
      axios.get('/api/dict/yanfa'),
      axios.get('/api/dict/shishi')
    ])
    yanfaList.value = y.data?.data || []
    shishiList.value = s.data?.data || []
  } catch(e) { console.error(e) }
}

// 点"分配修改"：打开研发人员选择弹窗（默认带出当前工程师）
const handleAssign = async () => {
  if (!selected.value) { alert("请选择一个问题"); return; }
  if (yanfaList.value.length === 0) await loadUsers()  // 首次打开先加载人员
  selectedDev.value = selected.value.xggcs || ''
  showDevSelect.value = true
}

// 确认分配修改人：调专用接口 /assign-dev 更新工程师字段
// 处理意见追加到测试说明：分配修改(操作人) 时间 + 意见（不写入 gongcscs，输入框不回显）
const confirmAssign = async () => {
  if (!selectedDev.value) { alert("请选择研发人员"); return; }
  try {
    const dev = yanfaList.value.find((u: any) => u.value === selectedDev.value)
    const patch: any = { xggcs: selectedDev.value, xggcsBM: dev?.username || '' }
    const opinion = (form.gongcscs || '').trim()
    if (opinion) {
      // 意见只追加到测试说明(已在显示区可见)，不写入 gongcscs，避免处理意见输入框回显
      const note = buildAssignNote('分配修改')
      const old = (form.shouzhongcs || '').replace(/\s+$/, '')
      patch.shouzhongcs = old ? `${old}\n${note}\n${opinion}` : `${note}\n${opinion}`
    }
    await axios.put("/api/feedback/" + selected.value.id + "/assign-dev", patch)
    ElMessage.success('分配成功')
    showDevSelect.value = false
    loadList()
  } catch (err) {
    ElMessage.error('分配失败')
  }
}

// 点"分配跟进"：打开跟进人员选择弹窗（默认带出当前跟进人）
const handleAssignFollower = async () => {
  if (!selected.value) { ElMessage.warning('请先选择一个问题'); return }
  if (shishiList.value.length === 0) await loadUsers()
  selectedFollower.value = selected.value.shishiry || ''
  showFollowerSelect.value = true
}

// 确认分配跟进人：普通更新接口，改 shishiry 字段
// 若上方"处理意见"框有内容，则追加保存到测试说明(shouzhongcs)：分配跟进(操作人) 时间 + 意见
const confirmAssignFollower = async () => {
  if (!selectedFollower.value) { alert("请选择实施人员"); return; }
  try {
    const fol = shishiList.value.find((u: any) => u.value === selectedFollower.value)
    const patch: any = { shishiry: selectedFollower.value, shishiryBM: fol?.username || '' }
    const opinion = (form.gongcscs || '').trim()
    if (opinion) {
      const note = buildAssignNote('分配跟进')
      const old = (form.shouzhongcs || '').replace(/\s+$/, '')
      patch.shouzhongcs = old ? `${old}\n${note}\n${opinion}` : `${note}\n${opinion}`
    }
    await axios.put("/api/feedback/" + selected.value.id, patch)
    ElMessage.success('分配跟进人成功')
    showFollowerSelect.value = false
    loadList()
  } catch (err) {
    ElMessage.error('分配跟进人失败')
  }
}


// ============ 图片查看 ============
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



// ============ 核心：确认处理（工程师填完处理意见后提交） ============
// 成功后该问题 gongchengsbz 置 'Y'，从本页列表消失、进入"待测试"
// ============ 模板按钮追加（处理意见） ============
const appendGongcscs = (text: string) => {
  form.gongcscs = form.gongcscs ? form.gongcscs + '\n' + text : text
}

const handleSubmit = async () => {
  if (!selected.value) { ElMessage.warning('请先选择要处理的问题'); return }
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
    Object.assign(form, { id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', gongcscs: '', xggcs: '', shishiry: '', jingjicd: '一般', shouhoucs: '', shcsgcs: '', cssj: null, fanhuisj: null })
    loadList()
  } catch (err) { ElMessage.error('处理失败') }
  finally { submitting.value = false }
}

// 放入待讨论：把问题的 taolunbz 置为 'Y'（工程师觉得要开会讨论）
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

// 返回待处理：把 gongchengsbz 和 taolunbz 都置 N（重新回到工程师待处理状态）
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
.handle-page { padding: 0; height: calc(100vh - 100px); display: flex; flex-direction: column; gap: 1px; overflow: hidden; }
.card-header { display: flex; justify-content: flex-start; align-items: center; gap: var(--qgap); flex-wrap: wrap; }
.form-header { display: flex; justify-content: flex-start; align-items: center; }
.header-filters { display: flex; align-items: center; gap: var(--qgap); margin-left: 10px; flex-wrap: wrap; }
.header-filters .el-checkbox { margin-right: 8px !important; }
.header-actions { display: flex; align-items: center; flex-shrink: 0; }
.header-actions .el-button { margin-left: 0 !important; margin-right: var(--qgap) !important; }

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
  background: #909399 !important;
  color: #ffffff !important;
  cursor: not-allowed;
  transform: none;
  box-shadow: none;
}

/* 确认处理 - 莫兰迪绿（柔和、沉稳，表示完成确认） */
/* 查看图片 - 莫兰迪黄（柔和、温暖，表示查看浏览） */
/* 分配修改人 - 莫兰迪蓝（沉稳、专业，表示分配任务） */
/* 分配跟进人 - 莫兰迪紫（优雅、协作，表示跟进配合） */
/* 待讨论 - 莫兰迪橙（温暖、活跃，表示讨论待处理） */
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
.info-label { font-size: calc(var(--el-font-size-base) - 3px); color: #909399; margin-bottom: 4px; }
.info-label.big { font-size: calc(var(--el-font-size-base) - 1px); font-weight: 600; color: #303133; }
.info-label.required::before { content: '*'; color: #f56c6c; margin-right: 4px; }
.info-value { font-size: calc(var(--el-font-size-base) - 2px); color: #303133; font-weight: 500; }
.info-value.textarea { white-space: pre-wrap; flex: 1; overflow-y: auto; overflow-x: hidden; }
.large-text { font-size: var(--el-font-size-base); line-height: 1.6; }
.opinion-input { flex: 1; display: flex; flex-direction: column; }
.opinion-input :deep(.el-textarea) { flex: 1; }
.opinion-input :deep(.el-textarea__inner) { height: 138px !important; min-height: 138px !important; max-height: 138px !important; overflow-y: auto; resize: none; }
/* 可双击放大的文本框：鼠标提示 */
.zoomable { cursor: zoom-in; }
/* 附件管理弹窗 */
.attach-tip { color: #606266; font-size: 13px; margin-bottom: 8px; }
.attach-list { max-height: 260px; overflow-y: auto; border: 1px solid #e4e7ed; border-radius: 6px; padding: 8px; margin-bottom: 12px; }
.attach-item { display: flex; align-items: center; gap: 8px; padding: 6px 4px; border-bottom: 1px dashed #ebeef5; }
.attach-item:last-child { border-bottom: none; }
.attach-item .el-icon { color: #1E5DA2; flex-shrink: 0; }
.attach-name { flex: 1; min-width: 0; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; color: #303133; font-size: 13px; }
.attach-item .el-button { margin-left: 0; }

/* 测试返回信息样式 */
.test-return-info { background: #fef0f0 !important; border: 1px solid #fbc4c4; }
.test-result-row { margin-bottom: 8px; }
.test-result-box { background: #fef0f0 !important; border: 1px solid #fbc4c4; padding: 10px 14px; }

.table-card { flex: 1; min-height: 0; overflow: hidden; }
.table-card :deep(.el-card__body) { height: 100%; padding: 0; }
.table-card :deep(.el-table) { font-size: var(--el-font-size-base); }

/* 选中行蓝色 */
:deep(.selected-row) {
  background-color: var(--el-color-primary-light-9) !important;
}
:deep(.selected-row td) {
  font-weight: 600 !important;
}

/* 测试后返回的问题行颜色：淡淡的红色 */
:deep(.test-returned-row) { background: #fef0f0 !important; }

:deep(.el-table__row:hover) { cursor: pointer; }
.carousel-container { text-align: center; display: flex; flex-direction: column; }
.carousel-wrapper { height: 560px; display: flex; align-items: center; justify-content: center; background: #f5f7fa; border-radius: 8px; overflow: hidden; flex-shrink: 0; }
.carousel-image { max-width: 100%; max-height: 100%; width: auto; height: auto; object-fit: contain; }
.carousel-controls { display: flex; align-items: center; justify-content: center; gap: 20px; margin-top: 16px; flex-shrink: 0; }
.carousel-actions { display: flex; justify-content: center; gap: 1px; flex-shrink: 0; }
.indicator { font-weight: 600; color: var(--el-color-primary); min-width: 60px; }
.viewer-tip { margin-top: 12px; padding: 8px 12px; background: #ecf5ff; color: var(--el-color-primary); border-radius: 4px; font-size: 12px; text-align: center; flex-shrink: 0; }

/* 图片预览对话框：固定尺寸 */
.preview-dialog :deep(.el-dialog) { width: 960px !important; height: 760px !important; display: flex; flex-direction: column; }
.preview-dialog :deep(.el-dialog__body) { flex: 1; overflow: auto; display: flex; flex-direction: column; }

.view-dialog-actions { display: flex; justify-content: center; align-items: center; margin-top: 20px; width: 100%; text-align: center; }
.view-dialog-actions .el-button { padding: 11px 36px !important; font-size: 14px !important; height: auto; line-height: 1.5; }
.view-images { display: flex; flex-wrap: wrap; gap: 12px; }
.view-image { width: 120px; height: 120px; object-fit: cover; border-radius: 6px; border: 1px solid #dcdfe6; transition: all 0.3s; }
.view-image:hover { transform: scale(1.05); box-shadow: 0 4px 12px rgba(0,0,0,0.15); }
</style>
