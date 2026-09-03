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
          <el-select v-model="searchForm.yiyuanmc" placeholder="请搜索选择" filterable clearable style="width:180px" :filter-method="searchHospitals" @focus="loadHospitals" :loading="hospitalLoading" @change="handleSearch">
            <el-option v-for="h in hospitals" :key="h.label" :label="h.label" :value="h.label" />
          </el-select>
        </el-form-item>
        <el-form-item label="模块">
          <el-select v-model="searchForm.mokuai" placeholder="请选择" clearable style="width:130px" @change="handleSearch">
            <el-option v-for="m in modules" :key="m.value" :label="m.label" :value="m.label" />
          </el-select>
        </el-form-item>
        <el-form-item label="状态">
          <el-select v-model="searchForm.zhuangtai" placeholder="全部状态" clearable @change="handleSearch" style="width:130px">
            <el-option label="待修改" value="daixiugai" />
            <el-option label="待测试" value="daiceshi" />
            <el-option label="已修改" value="yixiugai" />
            <el-option label="待讨论" value="daitaolun" />
          </el-select>
        </el-form-item>
        <el-form-item label="录入日期">
          <el-date-picker
            v-model="dateRange"
            type="daterange"
            range-separator="至"
            start-placeholder="开始日期"
            end-placeholder="结束日期"
            value-format="YYYY-MM-DD"
            @change="handleDateChange"
            style="width:240px"
          />
        </el-form-item>
        <el-form-item v-if="canViewOthers && !isCustomerUser">
          <el-checkbox v-model="viewAll" @change="handleSearch">查看所有问题</el-checkbox>
        </el-form-item>
        <el-form-item v-if="canViewOthers && viewAll && !isCustomerUser">
          <el-select v-model="selectedShishiry" placeholder="跟进人员" clearable style="width:130px" @change="handleSearch">
            <el-option v-for="s in shishiList" :key="s.value || s.xingming" :label="s.label || s.xingming" :value="s.value || s.xingming" />
          </el-select>
        </el-form-item>
        <el-form-item>
          <el-button class="morandi-btn morandi-blue" @click="handleSearch"><el-icon><Search /></el-icon> 搜索</el-button>
          <el-button class="morandi-btn morandi-gray" @click="handleResetSearch">重置</el-button>
          <el-button class="morandi-btn morandi-green" @click="handleAdd"><el-icon><Plus /></el-icon> 新增问题</el-button>
        </el-form-item>
      </el-form>
      
      <el-table :data="tableData" border v-loading="loading" stripe :row-class-name="getTableRowClassName">
        <el-table-column prop="id" label="问题ID号" width="90" />
        <el-table-column prop="jingjicd" label="紧急度" width="80">
          <template #default="{ row }">
            <el-tag v-if="row.jingjicd === '紧急'" type="danger" size="small">紧急</el-tag>
            <el-tag v-else-if="row.jingjicd === '急'" type="warning" size="small">急</el-tag>
            <el-tag v-else type="info" size="small">一般</el-tag>
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
        <el-table-column prop="mokuai" label="模块" width="100" />
        <el-table-column prop="chuangtimc" label="窗体" width="100" />
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
        <el-table-column prop="cssj" label="测试返回时间" width="160">
          <template #default="{ row }">
            <span v-if="row.cssj">{{ formatDate(row.cssj) }}</span>
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
        <el-table-column label="图片" width="45" align="center">
          <template #default="{ row }">
            <el-button type="primary" link @click.stop="viewImages(row)"><el-icon><Picture /></el-icon></el-button>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="180" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link @click="handleView(row)">查看</el-button>
            <el-button type="primary" link @click="handleEdit(row)" :disabled="!canEdit(row)">编辑</el-button>
            <el-button type="danger" link @click="handleDelete(row)" :disabled="!canDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <el-pagination v-model:current-page="pagination.page" v-model:page-size="pagination.pageSize" :total="pagination.total" :page-sizes="[10,20,50,100]" layout="total,sizes,prev,pager,next,jumper" @size-change="loadData" @current-change="loadData" style="margin-top:20px;justify-content:flex-end;" />
    </el-card>
    
    <!-- 新增/编辑对话框 -->
    <el-dialog v-model="dialogVisible" :title="isEdit ? '编辑问题' : '新增问题'" width="900px" :close-on-click-modal="false" destroy-on-close>
      <el-form :model="form" :rules="rules" ref="formRef" label-width="100px">
        <el-row :gutter="20">
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
                  <el-button :type="form.jingjicd === '紧急' ? 'danger' : 'default'" @click="form.jingjicd = '紧急'" :class="{ active: form.jingjicd === '紧急'}">紧急</el-button>
                  <el-button :type="form.jingjicd === '急' ? 'warning' : 'default'" @click="form.jingjicd = '急'" :class="{ active: form.jingjicd === '急'}">急</el-button>
                  <el-button :type="form.jingjicd === '一般' ? 'info' : 'default'" @click="form.jingjicd = '一般'" :class="{ active: form.jingjicd === '一般'}">一般</el-button>
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
        
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="软件版本" prop="banben">
              <el-select v-model="form.banben" placeholder="请选择" class="full-width" @change="onVersionChange">
                <el-option label="HIS问题" value="HIS问题" />
                <el-option label="医保接口" value="医保接口" />
                <el-option label="其它问题" value="其它问题" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="16">
            <el-form-item label="医院名称" prop="yiyuanmc">
              <el-select v-model="form.yiyuanmc" placeholder="请搜索选择" filterable class="full-width" :filter-method="searchHospitals" @focus="loadHospitals" :loading="hospitalLoading" :disabled="isCustomerUser" @change="onHospitalChange">
                <el-option v-for="h in hospitals" :key="h.label" :label="h.label" :value="h.label" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="模块" prop="mokuai">
              <el-select v-model="form.mokuai" placeholder="请选择" class="full-width" @change="(val) => onModuleChange(val)">
                <el-option v-for="m in modules" :key="m.value" :label="m.label" :value="m.label" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="窗体" prop="chuangtimc">
              <el-select v-model="form.chuangtimc" placeholder="请选择" class="full-width" :disabled="!form.mokuai">
                <el-option v-for="f in forms" :key="f.id" :label="f.label" :value="f.label" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="跟进人员" prop="shishiry">
              <el-select v-model="form.shishiry" placeholder="请选择" class="full-width" :disabled="isCustomerUser">
                <el-option v-for="e in shishiList" :key="e.value" :label="e.label" :value="e.value" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="工程师" prop="xggcs">
              <el-select v-model="form.xggcs" placeholder="请选择" class="full-width" :disabled="isCustomerUser">
                <el-option v-for="e in yanfaList" :key="e.value" :label="e.label" :value="e.value" />
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
        
        <!-- 处理信息（编辑时显示，只读） -->
        <el-divider v-if="isEdit && form.xgsj" content-position="left">处理信息</el-divider>
        <el-row v-if="isEdit && form.xgsj" :gutter="20">
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
        <el-divider v-if="isEdit && form.cssj" content-position="left">测试返回信息</el-divider>
        <el-row v-if="isEdit && form.cssj" :gutter="20">
          <el-col :span="8">
            <el-form-item label="测试人员">
              <el-input v-model="form.shcsgcs" disabled />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="测试返回时间">
              <el-input :model-value="formatDate(form.cssj)" disabled />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item v-if="isEdit && form.shouhoucs" label="测试结果">
          <el-input v-model="form.shouhoucs" type="textarea" :rows="2" disabled style="color: #f56c6c" />
        </el-form-item>
        
        <el-form-item label="问题截图">
          <div @paste="handlePaste" class="upload-area">
            <el-upload ref="uploadRef" v-model:file-list="uploadFileList" action="/api/feedback/upload" list-type="picture-card" :auto-upload="false" :on-preview="handlePreview" :on-remove="handleRemove" :limit="5" accept="image/*" drag multiple>
              <el-icon class="upload-icon"><Plus /></el-icon>
              <div class="upload-text">拖拽或点击选择<br/>Ctrl+V 粘贴图片</div>
            </el-upload>
          </div>
        </el-form-item>
        
        <el-form-item label-width="0" style="margin: 0; padding: 0;">
          <div style="display: flex !important; justify-content: center !important; align-items: center !important; gap: 3px; width: 100%; text-align: center;">
            <el-button class="morandi-btn morandi-green" style="min-width: 110px; height: 42px; padding: 0 20px;" @click="handleSubmit" :loading="submitting">
              <el-icon><Check /></el-icon> {{ isEdit ? '更新' : '保存' }}
            </el-button>
            <el-button class="morandi-btn morandi-gray" style="min-width: 110px; height: 42px; padding: 0 20px;" @click="dialogVisible = false">取消</el-button>
          </div>
        </el-form-item>
      </el-form>
    </el-dialog>
    
    <!-- 查看问题对话框（只读） -->
    <el-dialog v-model="viewDialogVisible" title="查看问题" width="900px" :close-on-click-modal="false" destroy-on-close>
      <el-form :model="form" label-width="100px">
        <el-row :gutter="20">
          <el-col :span="6">
            <el-form-item label="问题ID号">
              <el-input v-model="form.id" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="录入时间">
              <el-input :model-value="formatDate(form.lvrusj)" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="10">
            <el-form-item label="紧急程度">
              <el-tag :type="getJingjiType(form.jingjicd)">{{ form.jingjicd || '-' }}</el-tag>
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="软件版本">
              <el-input v-model="form.banben" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="16">
            <el-form-item label="医院名称">
              <el-input v-model="form.yiyuanmc" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="模块">
              <el-input v-model="form.mokuai" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="窗体">
              <el-input v-model="form.chuangtimc" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="跟进人员">
              <el-input v-model="form.shishiry" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row :gutter="20">
          <el-col :span="8">
            <el-form-item label="工程师">
              <el-input v-model="form.xggcs" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="反馈人">
              <el-input v-model="form.szcsgcs" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="反馈渠道">
              <el-input v-model="form.FanKuiQD" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-form-item label="问题说明">
          <el-input v-model="form.wentism" type="textarea" :rows="4" readonly />
        </el-form-item>
        
        <el-form-item label="工程师处理意见" v-if="form.gongcscs">
          <el-input v-model="form.gongcscs" type="textarea" :rows="3" readonly />
        </el-form-item>
        
        <el-form-item label="测试意见" v-if="form.shouzhongcs">
          <el-input v-model="form.shouzhongcs" type="textarea" :rows="3" readonly />
        </el-form-item>
        
        <!-- 处理信息 -->
        <el-divider v-if="form.xgsj" content-position="left">处理信息</el-divider>
        <el-row v-if="form.xgsj" :gutter="20">
          <el-col :span="8">
            <el-form-item label="处理人">
              <el-input v-model="form.xggcs" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="处理时间">
              <el-input :model-value="formatDate(form.xgsj)" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        
        <!-- 测试返回信息 -->
        <el-divider v-if="form.cssj" content-position="left">测试返回信息</el-divider>
        <el-row v-if="form.cssj" :gutter="20">
          <el-col :span="8">
            <el-form-item label="测试人员">
              <el-input v-model="form.shcsgcs" readonly />
            </el-form-item>
          </el-col>
          <el-col :span="8">
            <el-form-item label="测试返回时间">
              <el-input :model-value="formatDate(form.cssj)" readonly />
            </el-form-item>
          </el-col>
        </el-row>
        <el-form-item v-if="form.shouhoucs" label="测试结果">
          <el-input v-model="form.shouhoucs" type="textarea" :rows="2" readonly style="color: #f56c6c" />
        </el-form-item>
        
        <!-- 问题截图（只读） -->
        <el-form-item label="问题截图" v-if="detailImages.length > 0">
          <div class="view-images">
            <img v-for="(img, index) in detailImages" :key="index" :src="img" class="view-image" @click="handleViewImage(img)" style="cursor: zoom-in;" />
          </div>
        </el-form-item>
        
        <div class="view-dialog-actions">
          <el-button class="morandi-btn morandi-bright-blue" @click="viewDialogVisible = false">
            <el-icon><Close /></el-icon> 关 闭
          </el-button>
        </div>
      </el-form>
    </el-dialog>
    
    <!-- 图片预览弹窗 -->
    <el-dialog v-model="previewVisible" title="问题截图" width="960px" destroy-on-close class="preview-dialog">
      <div class="carousel-container">
        <div class="carousel-wrapper" v-if="previewImages.length > 0">
          <img :src="previewImages[currentIndex]" class="carousel-image" @click="openImageViewer" style="cursor: zoom-in;" />
        </div>
        <el-empty v-else description="暂无图片" />
        <div class="carousel-controls" v-if="previewImages.length > 1">
          <el-button circle :disabled="currentIndex === 0" @click="prevImage"><el-icon><ArrowLeft /></el-icon></el-button>
          <span class="carousel-indicator">{{ currentIndex + 1 }} / {{ previewImages.length }}</span>
          <el-button circle :disabled="currentIndex === previewImages.length - 1" @click="nextImage"><el-icon><ArrowRight /></el-icon></el-button>
        </div>
        <div class="carousel-actions" v-if="previewImages.length > 0">
          <el-button type="primary" @click="openImageViewer">
            <el-icon><ZoomIn /></el-icon> 查看原图（可缩放）
          </el-button>
          <el-button type="danger" @click="deleteCurrentImage">
            <el-icon><Delete /></el-icon> 删除当前图片
          </el-button>
          <el-button type="info" plain @click="previewVisible = false">
            <el-icon><Back /></el-icon> 返回
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
import { ref, reactive, onMounted, computed } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Search, Refresh, Plus, Tickets, Delete, Check, ArrowLeft, ArrowRight, ZoomIn, Picture, Close, Calendar, Back } from '@element-plus/icons-vue'
import axios from 'axios'

const loading = ref(false)
const submitting = ref(false)
const dialogVisible = ref(false)
const viewDialogVisible = ref(false)
const detailImages = ref<string[]>([])
const previewVisible = ref(false)
const previewImages = ref<string[]>([])
const currentIndex = ref(0)
const isEdit = ref(false)
const imageViewerVisible = ref(false)  // 全屏图片查看器状态

const prevImage = () => {
  if (currentIndex.value > 0) currentIndex.value--
}

const nextImage = () => {
  if (currentIndex.value < previewImages.value.length - 1) currentIndex.value++
}

// 打开全屏图片查看器（支持鼠标滚轮缩放、拖拽、全屏）
const openImageViewer = () => {
  if (previewImages.value.length > 0) {
    imageViewerVisible.value = true
  }
}

const deleteCurrentImage = async () => {
  try {
    await ElMessageBox.confirm(`确定要删除第 ${currentIndex.value + 1} 张图片吗？`, '提示', { type: 'warning' })
    const filename = previewImages.value[currentIndex.value].split('/').pop()
    if (filename) {
      await axios.delete(`/api/feedback/image/${filename}`)
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
const shishiList = ref<any[]>([])
const yanfaList = ref<any[]>([])
const modules = ref<any[]>([])
const forms = ref<any[]>([])
const hospitalLoading = ref(false)
const tableData = ref<any[]>([])
const uploadFileList = ref<any[]>([])

// 当前登录者信息
const currentUserName = ref('')
const isAdmin = ref(false)

// 初始化当前登录者信息
const initCurrentUser = () => {
  const userStr = localStorage.getItem('user')
  if (userStr) {
    try {
      const user = JSON.parse(userStr)
      currentUserName.value = user?.realName || user?.username || localStorage.getItem('username') || ''
      isAdmin.value = parseInt(user?.isAdmin || '0') === 1
    } catch (e) {
      currentUserName.value = localStorage.getItem('username') || ''
      isAdmin.value = false
    }
  } else {
    currentUserName.value = localStorage.getItem('username') || ''
    isAdmin.value = false
  }
}

// 判断是否可以编辑：只有待修改状态（gongchengsbz='N' shouhoubz='N' taolunbz='N'）可以编辑
const canEdit = (row: any) => {
  return row.gongchengsbz !== 'Y' && row.shouhoubz !== 'Y' && row.taolunbz !== 'Y'
}

// 判断是否可以删除：
// 1. 只有待修改状态可以删除
// 2. 必须是反馈人本人(szcsgcs为当前登录者)，或者当前登录者是管理员
const canDelete = (row: any) => {
  // 只有待修改状态可以删除
  if (row.gongchengsbz === 'Y' || row.shouhoubz === 'Y' || row.taolunbz === 'Y') {
    return false
  }
  // 必须是反馈人本人或者管理员
  return isAdmin.value || row.szcsgcs === currentUserName.value
}

// 初始化默认日期范围：一个月前到当前日期
const getDefaultDateRange = () => {
  const end = new Date()
  const start = new Date()
  start.setMonth(start.getMonth() - 1)
  const formatDate = (d: Date) => {
    const year = d.getFullYear()
    const month = String(d.getMonth() + 1).padStart(2, '0')
    const day = String(d.getDate()).padStart(2, '0')
    return `${year}-${month}-${day}`
  }
  return { startDate: formatDate(start), endDate: formatDate(end) }
}

const defaultRange = getDefaultDateRange()
const searchForm = reactive({ 
  yiyuanmc: '', 
  mokuai: '', 
  id: '', 
  zhuangtai: '',
  startDate: defaultRange.startDate,
  endDate: defaultRange.endDate
})
// 日期范围选择器的绑定值
const dateRange = ref([defaultRange.startDate, defaultRange.endDate])

// 日期范围变化处理
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
const viewAll = ref(false)  // 查看所有问题，默认false（只查自己跟进的）
const selectedShishiry = ref('')  // 选中的跟进人员（查看所有问题时可用）

// 判断当前用户是否有"查看非本人数据"权限
const canViewOthers = computed(() => {
  return parseInt(localStorage.getItem('viewOthers') || '0') === 1
})

// 判断当前用户是否是客户用户（基于userType字段）
const isCustomerUser = computed(() => {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  return u.userType === '客户'
})

// 获取客户用户的医院名称
const customerHospital = computed(() => {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  return u.hospital || ''
})

// 获取客户用户的跟进人员
const customerFollower = computed(() => {
  const u = JSON.parse(localStorage.getItem('user') || '{}')
  return u.follower || ''
})

const form = reactive({
  id: 0, banben: 'HIS问题', yiyuanmc: '', shishiry: '', mokuai: '', chuangtimc: '', xggcs: '', jingjicd: '一般', wentism: '', shouzhongcs: '', shouhoucs: '', shcsgcs: '', cssj: null as any, lvrusj: null as any, xgsj: null as any
})

// 售后到期日
const shouhouDaoqiRi = ref('')
const isShouhouExpired = computed(() => {
  if (!shouhouDaoqiRi.value) return false
  const today = new Date()
  today.setHours(0, 0, 0, 0)
  const expireDate = new Date(shouhouDaoqiRi.value)
  return expireDate < today
})

// 医院选择变化时查询售后到期日
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

// 计算问题状态
// 待修改: gongchengsbz='N' shouhoubz='N' taolunbz='N'
// 待测试: gongchengsbz='Y' shouhoubz='N' taolunbz='N'
// 已修改: gongchengsbz='Y' shouhoubz='Y' taolunbz='N'
// 待讨论: taolunbz='Y'
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

// 行颜色：测试后返回的问题（gongchengsbz='N' 且 cssj 不为空）显示为淡淡的红色
const getTableRowClassName = ({ row }: { row: any }) => {
  if (row.gongchengsbz === 'N' && row.cssj) {
    return 'test-returned-row'
  }
  return ''
}

const searchHospitals = async (query: string) => {
  if (!query) return
  hospitalLoading.value = true
  try {
    const res = await axios.get('/api/dict/hospitals?keyword=' + query)
    hospitals.value = res.data.data || []
  } catch (err) { console.error('搜索医院失败:', err) }
  finally { hospitalLoading.value = false }
}

const loadHospitals = async () => {
  if (hospitals.value.length > 0) return
  try {
    const res = await axios.get('/api/dict/hospitals')
    hospitals.value = res.data.data || []
  } catch (err) { console.error('加载医院失败:', err) }
}

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

const loadData = async () => {
  loading.value = true
  const user = JSON.parse(localStorage.getItem('user') || '{}')
  const currentUserName = user?.realName || user?.username || localStorage.getItem('username') || ''
  const currentUserType = user?.userType || '内部员工'
  const currentUserHospital = user?.hospital || ''
  
  const params: any = { 
    page: pagination.page, 
    pageSize: pagination.pageSize, 
    yiyuanmc: searchForm.yiyuanmc || undefined, 
    mokuai: searchForm.mokuai || undefined, 
    id: searchForm.id || undefined,
    startDate: searchForm.startDate || undefined,
    endDate: searchForm.endDate || undefined,
    zhuangtai: searchForm.zhuangtai || undefined
  }
  
  // 客户用户：只查询该客户的问题（yiyuanmc = 当前用户的hospital）
  if (currentUserType === '客户' && currentUserHospital) {
    params.yiyuanmc = currentUserHospital
  } else {
    // 内部员工：不勾选"查看所有问题"时，只查询当前操作员跟进的问题（shishiry=当前登录者）
    // 勾选"查看所有问题"时，如果选择了跟进人员则查询所选人员，否则查询全部
    if (!viewAll.value) {
      params.shishiry = currentUserName
    } else if (selectedShishiry.value) {
      params.shishiry = selectedShishiry.value
    }
  }
  
  try {
    const res = await axios.get('/api/feedback', { params })
    const data = res.data?.data || res.data || res
    tableData.value = (data?.list || []).map((item: any) => ({
      ...item,
      yiyuanmc: item.yiyuanmc || item.hospital,
      mokuai: item.mokuai || item.module,
      xggcs: item.xggcs || item.engineer
    }))
    pagination.total = data?.total || 0
  } catch (err) { console.error('加载列表失败:', err) }
  finally { loading.value = false }
}

const handleSearch = () => { pagination.page = 1; loadData() }
const handleResetSearch = () => { 
  const defaultRange = getDefaultDateRange()
  searchForm.yiyuanmc = ''
  searchForm.mokuai = ''
  searchForm.id = ''
  searchForm.zhuangtai = ''
  searchForm.startDate = defaultRange.startDate
  searchForm.endDate = defaultRange.endDate
  dateRange.value = [defaultRange.startDate, defaultRange.endDate]
  viewAll.value = false
  selectedShishiry.value = ''
  handleSearch()
}

const onModuleChange = async (moduleName: any) => {
  form.chuangtimc = ''
  forms.value = []
  if (!moduleName) return
  try { const res = await axios.get(`/api/dict/forms?module=${encodeURIComponent(moduleName)}`); forms.value = res.data.data || [] } 
  catch (err) { console.error('加载窗体失败:', err) }
}

// 版本变化：加载对应版本的模块，并清空模块和窗体
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

const handleAdd = async () => {
  isEdit.value = false
  // 获取当前登录者信息
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
  
  form.id = 0
  form.banben = 'HIS问题'
  shouhouDaoqiRi.value = ''  // 清空售后到期日
  // 如果是客户用户（userType === '客户'），自动填充医院、跟进人员、工程师，并设为只读
  if (userType === '客户') {
    form.yiyuanmc = userHospital
    form.shishiry = userFollower
    form.xggcs = userFollower  // 工程师默认绑定为跟进人员
  } else {
    form.yiyuanmc = ''
    form.shishiry = currentUser  // 跟进人员默认为当前登录者
    form.xggcs = ''
  }
  form.mokuai = ''
  form.chuangtimc = ''
  form.jingjicd = '一般'
  form.wentism = ''
  form.shouzhongcs = ''
  form.shouhoucs = ''
  form.shcsgcs = ''
  form.cssj = null
  uploadFileList.value = []
  forms.value = []
  dialogVisible.value = true
  
  // 加载默认版本对应的模块
  onVersionChange('HIS问题')
}

const handleView = async (row: any) => {
  const rowCopy = JSON.parse(JSON.stringify(row))
  rowCopy.yiyuanmc = rowCopy.yiyuanmc || rowCopy.hospital
  rowCopy.mokuai = rowCopy.mokuai || rowCopy.module
  rowCopy.xggcs = rowCopy.xggcs || rowCopy.engineer
  Object.assign(form, rowCopy)
  detailImages.value = []
  try {
    const res = await axios.get(`/api/feedback/images/${row.id}`)
    const imgs = res.data
    if (imgs && imgs.length > 0) {
      detailImages.value = imgs.map((img: any) => {
        const name = typeof img === 'string' ? img : (img.filename || img.name)
        return `/api/feedback/uploads/${name}`
      })
    }
  } catch (err) { console.error('加载图片失败:', err) }
  viewDialogVisible.value = true
}

const handleViewImage = (url: string) => {
  previewImages.value = detailImages.value
  currentIndex.value = previewImages.value.findIndex(u => u === url)
  previewVisible.value = true
}

const getJingjiType = (level: string) => {
  if (level === '紧急') return 'danger'
  if (level === '急') return 'warning'
  return 'info'
}

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
        return { name, url: `/api/feedback/uploads/${name}`, status: 'success' }
      })
    }
  } catch (err) { console.error('加载图片失败:', err) }
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
    if (file.url && file.name) {
      const filename = file.name || file.url.split('/').pop()
      if (filename) {
        await axios.delete(`/api/feedback/image/${filename}`)
      }
    }
    const idx = uploadFileList.value.findIndex(f => f.url === file.url)
    if (idx > -1) uploadFileList.value.splice(idx, 1)
    ElMessage.success('删除成功')
  } catch (e: any) {
    if (e !== 'cancel') ElMessage.error(e.message || '删除失败')
  }
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
    const res = await axios.get(`/api/feedback/images/${row.id}`)
    const imgs = res.data
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
    if (!isEdit.value) {
      data.shouzhongbz = 'Y'
      data.gongchengsbz = 'N'
      const userStr = localStorage.getItem('user')
      const user = userStr ? JSON.parse(userStr) : null
      data.szcsgcs = user?.realName || user?.username || localStorage.getItem('username') || ''
      data.FanKuiQD = user?.userType || '内部员工'
    }
    
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
    console.log('需要上传的图片数:', rawFiles.length, '已存在的图片数:', existingFiles.length)
    
    let maxTpnum = 0
    existingFiles.forEach(f => {
      if (f.name) {
        const match = f.name.match(/^\d+-(\d+)\./)
        if (match) {
          const num = parseInt(match[1])
          if (num > maxTpnum) maxTpnum = num
        }
      }
    })
    for (let i = 0; i < rawFiles.length; i++) {
      const formData = new FormData()
      const fileObj = rawFiles[i].raw || rawFiles[i].rawFile || rawFiles[i]
      formData.append('file', fileObj)
      formData.append('id', String(idToUse))
      formData.append('yiyuanmc', form.yiyuanmc || '')
      formData.append('tpnum', String(maxTpnum + i + 1))
      try {
        console.log('上传图片:', i + 1, '/', rawFiles.length, '文件名:', fileObj.name)
        const uploadRes = await axios.post('/api/feedback/upload', formData, { headers: { 'Content-Type': 'multipart/form-data' } })
        console.log('图片上传成功:', uploadRes.data)
      } catch (err) { 
        console.error('上传图片失败:', err) 
        ElMessage.error('图片上传失败: ' + (err as any)?.message)
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
</script>

<style scoped>
.feedback-container { padding: 0; }
.card-header { display: flex; justify-content: space-between; align-items: center; }
.search-form { margin-bottom: 20px; }
.full-width { width: 100%; }

/* 表格内容不换行，超出显示省略号 */
:deep(.el-table .cell) {
  white-space: nowrap !important;
  overflow: hidden !important;
  text-overflow: ellipsis !important;
}

/* 莫兰迪色系按钮 */
.morandi-btn { border: none !important; color: #ffffff !important; font-weight: 500; border-radius: 6px !important; padding: 10px 22px !important; font-size: 14px !important; transition: all 0.3s ease; box-shadow: 0 2px 6px rgba(0,0,0,0.08); margin: 0 5px; }
.morandi-btn:hover { transform: translateY(-1px); box-shadow: 0 4px 10px rgba(0,0,0,0.12); color: #ffffff !important; }
.morandi-btn:disabled { background: #dcdfe6 !important; color: #909399 !important; cursor: not-allowed; transform: none; box-shadow: none; }
.morandi-green { background: linear-gradient(135deg, #8FAF8F 0%, #7A9E7A 100%) !important; }
.morandi-green:hover { background: linear-gradient(135deg, #9DBB9D 0%, #8FAF8F 100%) !important; }
.morandi-blue { background: linear-gradient(135deg, #8FA5AF 0%, #7A94A0 100%) !important; }
.morandi-blue:hover { background: linear-gradient(135deg, #9DB3BD 0%, #8FA5AF 100%) !important; }
.morandi-gray { background: linear-gradient(135deg, #A8A8A8 0%, #969696 100%) !important; }
.morandi-gray:hover { background: linear-gradient(135deg, #B8B8B8 0%, #A8A8A8 100%) !important; }

/* 紧急程度和售后到期日同一行，左右分布 */
.priority-content { display: flex; justify-content: space-between; align-items: center; width: 100%; }
.priority-box { display: flex; gap: 8px; }
.priority-box .el-button { min-width: 60px; font-size: 12px; padding: 6px 12px; font-weight: 500; }
.priority-box .el-button.active { transform: scale(1.05); box-shadow: 0 2px 8px rgba(0,0,0,0.15); }
.shouhou-right { display: flex; align-items: center; gap: 6px; margin-left: auto; }
.shouhou-title { font-size: 14px; color: #606266; white-space: nowrap; font-weight: 500; }

/* 售后到期日显示 */
.shouhou-date { display: flex; align-items: center; gap: 4px; padding: 2px 8px; border-radius: 4px; font-size: 12px; font-weight: 500; white-space: nowrap; height: 24px; box-sizing: border-box; line-height: 20px; }
.shouhou-date.expired { background: #fef0f0; color: #f56c6c; border: 1px solid #fbc4c4; }
.shouhou-date.valid { background: #ecf5ff; color: #409eff; border: 1px solid #b3d8ff; }
.view-dialog-actions { display: flex; justify-content: center; align-items: center; margin-top: 20px; width: 100%; text-align: center; }
.view-dialog-actions .el-button { padding: 11px 36px !important; font-size: 14px !important; height: auto; line-height: 1.5; }

/* 淡黄色按钮 */
.morandi-bright-blue { background: linear-gradient(135deg, #E8D8A8 0%, #D4C08A 100%) !important; color: #5a4a2a !important; }
.morandi-bright-blue:hover { background: linear-gradient(135deg, #F0E0B0 0%, #E0CC96 100%) !important; color: #5a4a2a !important; }

.lsh-box :deep(.el-input__wrapper) { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; }
.lsh-box :deep(.el-input__inner) { color: white; font-weight: bold; }
.priority-box { display: flex; gap: 8px; }
.priority-box .el-button { min-width: 60px; font-size: 12px; padding: 6px 12px; font-weight: 500; }
.priority-box .el-button.active { transform: scale(1.05); box-shadow: 0 2px 8px rgba(0,0,0,0.15); }

.upload-area { width: 100%; }
.upload-icon { font-size: 28px; color: #999; }
.upload-text { font-size: 12px; color: #999; margin-top: 8px; text-align: center; line-height: 1.6; }
.viewer-tip { margin-top: 12px; padding: 8px 12px; background: #ecf5ff; color: #409eff; border-radius: 4px; font-size: 12px; text-align: center; }

/* 测试后返回的问题行颜色：淡淡的红色 */
:deep(.test-returned-row) {
  background-color: #fef0f0 !important;
}

/* 轮播样式 */
.carousel-container { text-align: center; display: flex; flex-direction: column; }
.carousel-wrapper { display: flex; align-items: center; justify-content: center; height: 560px; background: #f5f7fa; border-radius: 8px; overflow: hidden; flex-shrink: 0; }
.carousel-image { max-width: 100%; max-height: 100%; width: auto; height: auto; object-fit: contain; }
.carousel-controls { display: flex; align-items: center; justify-content: center; gap: 20px; margin: 20px 0; flex-shrink: 0; }
.carousel-indicator { font-size: 16px; font-weight: 600; color: #409eff; min-width: 60px; }
.carousel-actions { margin-top: 20px; flex-shrink: 0; display: flex; justify-content: center; gap: 1px; }
.carousel-back { margin-top: 12px; flex-shrink: 0; }

/* 图片预览对话框：固定尺寸 */
.preview-dialog :deep(.el-dialog) { width: 960px !important; height: 760px !important; display: flex; flex-direction: column; }
.preview-dialog :deep(.el-dialog__body) { flex: 1; overflow: auto; display: flex; flex-direction: column; }

/* 查看对话框图片样式 */
.view-images { display: flex; flex-wrap: wrap; gap: 12px; }
.view-image { width: 120px; height: 120px; object-fit: cover; border-radius: 6px; border: 1px solid #dcdfe6; transition: all 0.3s; }
.view-image:hover { transform: scale(1.05); box-shadow: 0 4px 12px rgba(0,0,0,0.15); }
</style>
