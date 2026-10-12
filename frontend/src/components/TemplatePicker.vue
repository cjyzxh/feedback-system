<template>
  <span>
    <el-button class="morandi-btn morandi-blue" size="large" @click="openPicker">
      <el-icon style="margin-right: 4px"><Collection /></el-icon>选择模板
    </el-button>

    <el-dialog :title="lx + '模板'" v-model="dialogVisible" width="600px" custom-class="tp-dialog tp-dialog-fixed" style="height:600px; display:flex; flex-direction:column" append-to-body>
      <el-input v-model="keyword" placeholder="搜索模板..." clearable size="small" style="margin-bottom: 10px" />
      <el-table
        v-loading="loading"
        :data="filteredList"
        border
        stripe
        max-height="320"
        highlight-current-row
        @row-dblclick="handleSelect"
        empty-text="暂无模板"
      >
        <el-table-column prop="moBanNR" label="模板内容" min-width="300" show-overflow-tooltip />
        <el-table-column prop="moBanFW" label="范围" width="70" align="center" />
        <el-table-column prop="createUserName" label="创建人" width="100">
          <template #default="scope">
            {{ scope.row.createUserName || scope.row.createUser }}
          </template>
        </el-table-column>
      </el-table>
      <div class="tip-text">双击条目插入到文本框末尾</div>
    </el-dialog>
  </span>
</template>

<script setup lang="ts">
import { ref, computed } from 'vue'
import { Collection } from '@element-plus/icons-vue'
import { ElMessage } from 'element-plus'
import axios from 'axios'

const props = defineProps<{ lx: string }>()
const emit = defineEmits<{ (e: 'select', text: string): void }>()

const currentUser = (() => {
  let code = localStorage.getItem('userCode') || ''
  if (!code) {
    try { code = JSON.parse(localStorage.getItem('user') || '{}').username || '' } catch (e) { code = '' }
  }
  return code
})()
const loginName = localStorage.getItem('username') || ''
const dialogVisible = ref(false)
const loading = ref(false)
const keyword = ref('')
const list = ref<any[]>([])

const filteredList = computed(() => {
  const k = keyword.value.trim()
  if (!k) return list.value
  return list.value.filter((i: any) => i.moBanNR.includes(k))
})

async function openPicker() {
  dialogVisible.value = true
  if (list.value.length === 0) await loadList()
}

async function loadList() {
  loading.value = true
  try {
    const res: any = await axios.get('/api/template/options', {
      params: { lx: props.lx, currentUser }
    })
    list.value = res.data?.data || res.data || []
  } catch (e: any) {
    list.value = []
  } finally {
    loading.value = false
  }
}

function formatNow() {
  const d = new Date()
  const p = (n: number) => String(n).padStart(2, '0')
  return `${d.getFullYear()}-${p(d.getMonth() + 1)}-${p(d.getDate())} ${p(d.getHours())}:${p(d.getMinutes())}:${p(d.getSeconds())}`
}

function handleSelect(row: any) {
  if (row?.moBanNR) {
    emit('select', `${row.moBanNR}--${loginName}(${formatNow()})`)
    dialogVisible.value = false
    ElMessage.success('已插入到文本框')
  }
}
</script>

<style scoped>
.tip-text {
  margin-top: 8px;
  font-size: 12px;
  color: #9ca3af;
  text-align: center;
}
</style>

<!-- 弹窗固定高度（非 scoped：dialog 挂载到 body 下） -->
<style>
.tp-dialog.tp-dialog-fixed {
  height: 600px !important;
  display: flex;
  flex-direction: column;
}
.tp-dialog.tp-dialog-fixed .el-dialog__header {
  flex-shrink: 0;
}
.tp-dialog.tp-dialog-fixed .el-dialog__body {
  flex: 1;
  min-height: 0;
  overflow-y: auto;
  overflow-x: hidden;
  padding-top: 6px;
}
</style>
