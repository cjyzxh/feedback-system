<template>
  <div class="handle-page">
    <!-- 上部：处理问题表单 -->
    <el-card class="form-card">
      <template #header>
        <div class="card-header">
          <span><el-icon><Edit /></el-icon> 处理问题</span>
          <el-button type="primary" @click="handleSubmit" :loading="submitting" :disabled="!selected">
            <el-icon><Check /></el-icon> 确认处理
          </el-button>
          <el-button type="warning"  @click="handleAssign"><el-icon><User /></el-icon> 分配修改人</el-button>
          <el-button type="info"  @click="handleAssignFollower"><el-icon><User /></el-icon> 分配跟进人</el-button>
          <el-button type="info"  @click="handleDiscuss"><el-icon><ChatDotRound /></el-icon> 待讨论</el-button>
          <el-button type="danger"  @click="handleDelete"><el-icon><Delete /></el-icon> 删除</el-button>
        </div>
      </template>
      <div class="form-content">
        <!-- 第一行：基础信息（缩小显示） -->
        <el-row :gutter="16" class="basic-info">
          <el-col :span="3">
            <div class="info-item small">
              <div class="info-label">流水号</div>
              <div class="info-value">{{ form.lsh || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="3">
            <div class="info-item small">
              <div class="info-label">紧急</div>
              <el-tag :type="getJingjiType(form.jingjicd)" >{{ form.jingjicd || '-' }}</el-tag>
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
        <!-- 第二行：问题说明和处理意见（等高显示） -->
        <el-row :gutter="16">
          <el-col :span="12">
            <div class="info-item large">
              <div class="info-label big">问题说明</div>
              <div class="info-value textarea large-text">{{ form.wentism || '-' }}</div>
            </div>
          </el-col>
          <el-col :span="12">
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
          <span><el-icon><List /></el-icon> 待处理问题列表（处理标志=否）</span>
          <el-button type="primary" link @click="loadList"><el-icon><Refresh /></el-icon> 刷新</el-button>
        </div>
      </template>
      <el-table :data="list" @row-click="handleRowClick" highlight-current-row :row-class-name="getRowClass" stripe height="100%">
        <el-table-column prop="lsh" label="流水号" width="70" align="center" />
        <el-table-column prop="yiyuanmc" label="医院名称" min-width="120" show-overflow-tooltip />
        <el-table-column prop="mokuai" label="模块" width="70" />
        <el-table-column prop="chuangtimc" label="窗体" width="70" />
        <el-table-column prop="xggcs" label="工程师" width="70" />
        <el-table-column prop="wentism" label="问题说明" min-width="150" show-overflow-tooltip />
        <el-table-column prop="jingjicd" label="紧急" width="60" align="center">
          <template #default="{ row }">
            <el-tag v-if="row.jingjicd === '紧急'" type="danger" >紧急</el-tag>
            <el-tag v-else-if="row.jingjicd === '急'" type="warning" >急</el-tag>
            <el-tag v-else type="info" >一般</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="lvrusj" label="录入时间" width="140" />
        <el-table-column label="图片" width="50" align="center">
          <template #default="{ row }">
            <el-button type="primary" link  @click.stop="viewImages(row)"><el-icon><Picture /></el-icon></el-button>
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
    <el-dialog v-model="showDevSelect" title="??????" width="320px">
      <el-select v-model="selectedDev" placeholder="???????" style="width:100%">
        <el-option v-for="u in userList" :key="u.id" :label="u.xingming" :value="u.xingming" v-if="u.category=='????'" />
      </el-select>
      <template #footer>
        <el-button @click="showDevSelect=false">??</el-button>
        <el-button type="primary" @click="confirmAssign">??</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage } from 'element-plus'
import { Edit, Check, List, Refresh, Picture, ArrowLeft, ArrowRight } from '@element-plus/icons-vue'
import axios from 'axios'

const list = ref<any[]>([])
const selected = ref<any>(null)
const submitting = ref(false)

const getRowClass = ({ row }: { row: any }) => selected.value?.id === row.id ? 'selected-row' : ''

const getJingjiType = (type: string) => {
  if (type === '紧急') return 'danger'
  if (type === '急') return 'warning'
  return 'info'
}

const form = reactive({
  id: 0, lsh: '', yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', gongcscs: '', xggcs: '', shishiry: '', jingjicd: '一般'
})

const loadList = async () => {
  const userStr = localStorage.getItem('user')
  const user = userStr ? JSON.parse(userStr) : null
  const params: any = { gongchengsbz: 'N' }
  const permsStr = localStorage.getItem('permissions'); const perms = permsStr && permsStr.startsWith('[') ? JSON.parse(permsStr) : []
  const viewOthers = parseInt(localStorage.getItem('viewOthers') || '0')
  const testPerm = perms.find(p => p.page === 'test')
  const canViewAll = viewOthers === 1 || (testPerm && testPerm.view)
  if (!canViewAll) { params.xggcs = user.realName }
  try {
    const res = await axios.get('/api/feedback', { params })
    list.value = res?.data?.list || res?.list || []
  } catch (err) { console.error('加载列表失败', err) }
}

const handleRowClick = (row: any) => {
  selected.value = row
  Object.assign(form, row)
}

const previewVisible = ref(false)


const userList = ref([])
const showDevSelect = ref(false)
const selectedDev = ref('')

const loadUsers = async () => {
  try {
    const res = await axios.get('/api/staff')
    userList.value = res.data?.data?.list || []
  } catch(e) { console.error(e) }
}

const handleAssign = async () => {
  if (!selected.value) { alert("请选择一个一个问题"); return; }
  if (userList.value.length === 0) loadUsers()
  selectedDev.value = selected.value.xggcs || ''
  showDevSelect.value = true
}

const confirmAssign = async () => {
  if (!selectedDev.value) { alert("请选择研发人员"); return; }
  axios.put("/api/feedback/" + selected.value.id + "/assign-dev", {xggcs: selectedDev.value})
    .then(() => { alert("分配成功"); showDevSelect.value = false; loadList(); })
    .catch(() => alert("分配失败"))
}


const previewImages = ref<string[]>([])
const currentIndex = ref(0)

const viewImages = async (row: any) => {
  try {
    const res = await axios.get("/api/feedback/images/" + row.id)
    const imgs = res.data
    if (imgs && imgs.length > 0) {
      previewImages.value = imgs.map((name: string) => "/uploads/" + name)
      currentIndex.value = 0
      previewVisible.value = true
    } else { ElMessage.warning("暂无图片") }
  } catch (err) { console.error("加载图片失败", err) }
}

const handleSubmit = async () => {
  if (!form.gongcscs) { ElMessage.warning('请填写处理意见'); return }
  submitting.value = true
  try {
    await axios.put('/api/feedback/' + form.id, { gongcscs: form.gongcscs, gongchengsbz: 'Y' })
    ElMessage.success('处理成功')
    form.gongcscs = ''
    selected.value = null
    // 重置表单
    Object.assign(form, { id: 0, lsh: '', yiyuanmc: '', mokuai: '', chuangtimc: '', banben: '', wentism: '', gongcscs: '', xggcs: '', shishiry: '', jingjicd: '一般' })
    loadList()
  } catch (err) { ElMessage.error('处理失败') }
  finally { submitting.value = false }
}

onMounted(() => { loadList() })
</script>

<style scoped>
.handle-page { padding: 16px; height: calc(100vh - 100px); display: flex; flex-direction: column; gap: 16px; overflow: hidden; }
.card-header { display: flex; justify-content: flex-start; align-items: center; }
.card-header span { display: flex; align-items: center; gap: 2px; font-weight: 600; }
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
.opinion-input { flex: 1; }
.opinion-input :deep(.el-textarea__inner) { height: 100%; min-height: 80px; }
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
