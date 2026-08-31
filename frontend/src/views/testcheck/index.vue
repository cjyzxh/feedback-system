<template>
  <div class="check-page">
    <!-- 上部：测试问题表单 -->
    <el-card class="form-card">
      <template #header>
        <div class="card-header">
          <span><el-icon><CircleCheck /></el-icon> 测试问题</span>
          <el-button type="success" @click="handleSubmit" :loading="submitting">
            <el-icon><Check /></el-icon> 提交测试结果
          </el-button>
        </div>
      </template>
      <div class="form-content">
        <!-- 第一行：基础信息（缩小显示） -->
        <el-row :gutter="16" class="basic-info">
          <el-col :span="3">
            <div class="info-item small">
              <div class="info-label">问题ID号</div>
              <div class="info-value">{{ form.id || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="3">
            <div class="info-item small">
              <div class="info-label">紧急</div>
              <el-tag :type="getJingjiType(form.jingjicd)" size="small">{{ form.jingjicd || '-' }}</el-tag>
            </div>
          </el-col>
          <el-col :span="4">
            <div class="info-item small">
              <div class="info-label">版本</div>
              <div class="info-value">{{ form.banben || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="5">
            <div class="info-item small">
              <div class="info-label">医院</div>
              <div class="info-value" :title="form.yiyuanmc">{{ form.yiyuanmc || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="3">
            <div class="info-item small">
              <div class="info-label">模块</div>
              <div class="info-value">{{ form.mokuai || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="3">
            <div class="info-item small">
              <div class="info-label">窗体</div>
              <div class="info-value">{{ form.chuangtimc || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="3">
            <div class="info-item small">
              <div class="info-label">工程师</div>
              <div class="info-value">{{ form.xggcs || '-' }}</div>
            </div>
          </el-col>
        </el-row>
        <!-- 第二行：问题说明、处理意见、测试结果（等高显示） -->
        <el-row :gutter="16">
          <el-col :span="8">
            <div class="info-item large">
              <div class="info-label big">问题说明</div>
              <div class="info-value textarea large-text">{{ form.wentism || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="info-item large">
              <div class="info-label big">处理意见</div>
              <div class="info-value textarea large-text">{{ form.gongcscs || '暂无' }}</div>
            </div>
          </el-col>
          <el-col :span="8">
            <div class="info-item large">
              <div class="info-label big required">测试结果</div>
              <el-radio-group v-model="form.testResult" class="test-radio">
                <el-radio value="通过"><el-tag type="success" size="small">通过</el-tag></el-radio>
                <el-radio value="未通过"><el-tag type="danger" size="small">未通过</el-tag></el-radio>
              </el-radio-group>
              <el-input v-if="form.testResult === '未通过'" class="opinion-input" v-model="form.shouhoucs" type="textarea" :rows="2" placeholder="请说明未通过原因..." />
            </div>
          </el-col>
        </el-row>
      </div>
    </el-card>

    <!-- 下部：待测试问题列表 -->
    <el-card class="table-card">
      <template #header>
        <div class="card-header">
          <span><el-icon><List /></el-icon> 待测试问题列表（处理=是，测试=否）</span>
          <div class="header-right">
            <el-checkbox v-if="canViewOthers" v-model="viewAll" @change="loadList">查询所有待测试问题</el-checkbox>
            <el-button type="primary" link @click="loadList"><el-icon><Refresh /></el-icon> 刷新</el-button>
          </div>
        </div>
      </template>
      <el-table :data="list" @row-click="handleRowClick" highlight-current-row :row-class-name="getRowClass" stripe height="100%">
        <el-table-column prop="id" label="问题ID号" width="80" align="center" />
        <el-table-column prop="yiyuanmc" label="医院名称" min-width="120" show-overflow-tooltip />
        <el-table-column prop="mokuai" label="模块" width="70" />
        <el-table-column prop="chuangtimc" label="窗体" width="70" />
        <el-table-column prop="xggcs" label="工程师" width="70" />
        <el-table-column prop="wentism" label="问题说明" min-width="120" show-overflow-tooltip />
        <el-table-column prop="gongcscs" label="处理意见" min-width="100" show-overflow-tooltip />
        <el-table-column prop="jingjicd" label="紧急" width="60" align="center">
          <template #default="{ row }">
            <el-tag v-if="row.jingjicd === '紧急'" type="danger" size="small">紧急</el-tag>
            <el-tag v-else-if="row.jingjicd === '急'" type="warning" size="small">急</el-tag>
            <el-tag v-else type="info" size="small">一般</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="lvrusj" label="录入时间" width="140" />
        <el-table-column label="图片" width="50" align="center">
          <template #default="{ row }">
            <el-button type="primary" link size="small" @click.stop="viewImages(row)"><el-icon><Picture /></el-icon></el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>

    <!-- 图片预览弹窗 -->
    <el-dialog v-model="previewVisible" title="问题截图" width="750px">
      <div class="carousel-container">
        <div class="carousel-wrapper" v-if="previewImages.length > 0">
          <img :src="previewImages[currentIndex]" class="carousel-image" />
        </div>
        <el-empty v-else description="暂无图片" />
        <div class="carousel-controls" v-if="previewImages.length > 1">
          <el-button circle :disabled="currentIndex === 0" @click="currentIndex--"><el-icon><ArrowLeft /></el-icon></el-button>
          <span class="indicator">{{ currentIndex + 1 }} / {{ previewImages.length }}</span>
          <el-button circle :disabled="currentIndex === previewImages.length - 1" @click="currentIndex++"><el-icon><ArrowRight /></el-icon></el-button>
        </div>
      </div>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, computed, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { CircleCheck, Check, List, Refresh, Picture, ArrowLeft, ArrowRight } from '@element-plus/icons-vue'
import axios from 'axios'

const list = ref<any[]>([])
const selected = ref<any>(null)
const submitting = ref(false)
const viewAll = ref(false)  // 查询所有待测试问题，默认false（只查自己的）

// 判断当前用户是否有"查看非本人数据"权限
const canViewOthers = computed(() => {
  return parseInt(localStorage.getItem('viewOthers') || '0') === 1
})

const getRowClass = ({ row }: { row: any }) => selected.value?.id === row.id ? 'selected-row' : ''
const canAssign = ref(true)  // ?????????????

const getJingjiType = (type: string) => {
  if (type === '紧急') return 'danger'
  if (type === '急') return 'warning'
  return 'info'
}

const form = reactive({
  id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', gongcscs: '', testResult: '', shouhoucs: '', xggcs: '', shishiry: '', jingjicd: '一般'
})

const loadList = async () => {
  const userStr = localStorage.getItem('user')
  const user = userStr ? JSON.parse(userStr) : null
  const params: any = { gongchengsbz: 'Y', shouhoubz: 'N' }  // 处理=是，售后=否（待测试）
  
  // 获取当前登录者名称
  const currentUserName = user?.realName || user?.username || localStorage.getItem('username') || ''
  
  // 不打勾：只查询跟进人员为当前登录者的待测试数据
  if (!viewAll.value && currentUserName) {
    params.shishiry = currentUserName
    console.log('只查询当前登录者的待测试问题, shishiry:', currentUserName)
  }
  
  try {
    console.log('测试页查询参数:', params, 'viewAll:', viewAll.value)
    const res = await axios.get('/api/feedback', { params })
    console.log('测试页查询结果:', res.data)
    list.value = res?.data?.data?.list || res?.data?.list || []
  } catch (err) { console.error('加载列表失败', err) }
}

const handleRowClick = (row: any) => {
  selected.value = row
  const rowCopy = JSON.parse(JSON.stringify(row))
  Object.assign(form, rowCopy)
}

const previewVisible = ref(false)
const previewImages = ref<string[]>([])
const currentIndex = ref(0)

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
  if (!form.id) { ElMessage.warning('请先从下方列表选择一条记录'); return }
  if (!form.testResult) { ElMessage.warning('请选择测试结果'); return }
  if (form.testResult === '未通过' && !form.shouhoucs) { ElMessage.warning('请填写未通过原因'); return }
  submitting.value = true
  try {
    // 根据测试结果更新不同字段
    const updateData: any = { shouhoucs: form.shouhoucs || '' }
    if (form.testResult === '通过') {
      updateData.shouhoubz = 'Y'  // 测试通过，进入售后/完成阶段
    } else {
      updateData.gongchengsbz = 'N'  // 测试未通过，退回工程师重新处理
    }
    await axios.put('/api/feedback/' + form.id, updateData)
    ElMessage.success('提交成功')
    form.testResult = ''
    form.shouhoucs = ''
    selected.value = null
    // 重置表单
    Object.assign(form, { id: 0, yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', gongcscs: '', testResult: '', shouhoucs: '', xggcs: '', shishiry: '', jingjicd: '一般' })
    loadList()
  } catch (err) { ElMessage.error('提交失败') }
  finally { submitting.value = false }
}

onMounted(() => { loadList() })
</script>

<style scoped>
.check-page { padding: 16px; height: calc(100vh - 100px); display: flex; flex-direction: column; gap: 16px; overflow: hidden; }
.card-header { display: flex; justify-content: space-between; align-items: center; }
.header-right { display: flex; align-items: center; gap: 16px; }
.card-header span { display: flex; align-items: center; gap: 8px; font-weight: 600; }
.form-card { flex-shrink: 0; }
.form-content { display: flex; flex-direction: column; gap: 12px; }
.basic-info { margin-bottom: 8px; }
.info-item { background: #f8f9fa; padding: 8px 12px; border-radius: 6px; }
.info-item.small { padding: 6px 8px; }
.info-item.large { padding: 12px 16px; background: #fff; border: 1px solid #e4e7ed; height: 100%; display: flex; flex-direction: column; }
.info-label { font-size: 11px; color: #909399; margin-bottom: 4px; }
.info-label.big { font-size: 13px; font-weight: 600; color: #303133; }
.info-label.required::before { content: '*'; color: #f56c6c; margin-right: 4px; }
.info-value { font-size: 12px; color: #303133; font-weight: 500; }
.info-value.textarea { white-space: pre-wrap; flex: 1; overflow: auto; }
.large-text { font-size: 14px; line-height: 1.6; }
.test-radio { display: flex; gap: 12px; margin-bottom: 8px; }
.opinion-input { flex: 1; }
.opinion-input :deep(.el-textarea__inner) { min-height: 50px !important; }
.table-card { flex: 1; min-height: 0; overflow: hidden; }
.table-card :deep(.el-card__body) { height: 100%; padding: 0; }
.table-card :deep(.el-table) { font-size: 13px; }
:deep(.selected-row) { background: #ecf5ff !important; }
:deep(.el-table__row:hover) { cursor: pointer; }
.carousel-container { text-align: center; }
.carousel-wrapper { min-height: 400px; display: flex; align-items: center; justify-content: center; background: #f5f7fa; border-radius: 8px; }
.carousel-image { max-width: 100%; max-height: 500px; object-fit: contain; }
.carousel-controls { display: flex; align-items: center; justify-content: center; gap: 20px; margin-top: 16px; }
.indicator { font-weight: 600; color: #409eff; min-width: 60px; }
</style>
