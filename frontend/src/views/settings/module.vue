<template>
  <div class="module-maintenance">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>模块维护</span>
          <el-button size="large" class="morandi-btn morandi-blue" @click="handleAdd"><el-icon><Plus /></el-icon> 新增</el-button>
        </div>
      </template>

      <div class="main-body">
        <!-- 左侧树形结构：版本 → 模块 -->
        <div class="tree-panel">
          <el-input
            v-model="treeKeyword"
            placeholder="搜索版本/模块"
            clearable
            size="small"
            class="tree-search"
            @input="handleTreeSearch"
          />
          <el-tree
            ref="treeRef"
            :data="treeData"
            :props="{ label: 'label', children: 'children' }"
            node-key="id"
            highlight-current
            :default-expanded-keys="['all']"
            :expand-on-click-node="false"
            :filter-node-method="filterNode"
            @node-click="handleNodeClick"
            class="dict-tree"
          />
        </div>

        <!-- 右侧表格 -->
        <div class="table-panel">
          <el-table v-loading="loading" :data="modules" style="width: 100%">
            <el-table-column prop="banben" label="版本" width="120" />
            <el-table-column prop="mokuaimc" label="模块名称" min-width="200" />
            <el-table-column label="操作" width="220" fixed="right">
              <template #default="scope">
                <el-button size="small" type="primary" @click="handleAdd()">新增</el-button>
                <el-button size="small" @click="handleEdit(scope.row)">编辑</el-button>
                <el-button size="small" type="danger" @click="handleDelete(scope.row.id)">删除</el-button>
              </template>
            </el-table-column>
          </el-table>

          <div class="pagination-container" v-if="total > 0">
            <el-pagination
              v-model:current-page="currentPage"
              v-model:page-size="pageSize"
              :page-sizes="[10, 20, 50, 100]"
              layout="total, sizes, prev, pager, next, jumper"
              :total="total"
              @size-change="handleSizeChange"
              @current-change="handleCurrentChange"
            />
          </div>
        </div>
      </div>
    </el-card>

    <!-- 新增/编辑对话框 -->
    <el-dialog
      v-model="dialogVisible"
      :title="dialogType === 'add' ? '新增模块' : '编辑模块'"
      width="500px"
    >
      <el-form :model="formData" label-width="80px">
        <el-form-item label="版本">
          <el-select v-model="formData.banben" placeholder="请选择版本" style="width: 100%;">
            <el-option label="HIS问题" value="HIS问题" />
            <el-option label="医保接口" value="医保接口" />
            <el-option label="其它问题" value="其它问题" />
          </el-select>
        </el-form-item>
        <el-form-item label="模块名称">
          <el-input v-model="formData.mokuaimc" placeholder="请输入模块名称" />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button size="large" class="morandi-btn morandi-red" @click="dialogVisible = false"><el-icon><Close /></el-icon> 取消</el-button>
          <el-button size="large" class="morandi-btn morandi-blue" @click="handleSubmit"><el-icon><Check /></el-icon> 确定</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import axios from 'axios';
import { ElMessage } from 'element-plus';
import { Plus, Close, Check } from '@element-plus/icons-vue';

const loading = ref(false);
const allModules = ref<any[]>([]); // 全量模块数据
const modules = ref<any[]>([]);    // 显示（按树过滤后）
const total = ref(0);
const currentPage = ref(1);
const pageSize = ref(10);

const dialogVisible = ref(false);
const dialogType = ref<'add' | 'edit'>('add');
const formData = ref({
  id: 0,
  banben: '',
  mokuaimc: ''
});

// 树形结构
const treeRef = ref<any>(null);
const treeKeyword = ref('');
const treeData = ref<any[]>([]);
const treeFilter = ref<{ banben?: string; mokuaimc?: string }>({});

// 构建树形结构：版本 → 模块
const buildTree = () => {
  const versions = [...new Set(allModules.value.map((m: any) => m.banben).filter(Boolean))];
  treeData.value = [
    {
      id: 'all',
      label: '全部模块',
      type: 'all',
      children: versions.map((v: string) => ({
        id: 'v-' + v,
        label: v,
        type: 'version',
        children: allModules.value
          .filter((m: any) => m.banben === v)
          .map((m: any) => ({
            id: 'm-' + m.id,
            label: m.mokuaimc,
            banben: v,
            type: 'module'
          }))
      }))
    }
  ];
};

// 应用树过滤
const applyFilter = () => {
  modules.value = allModules.value.filter((m: any) => {
    if (treeFilter.value.banben && m.banben !== treeFilter.value.banben) return false;
    if (treeFilter.value.mokuaimc && m.mokuaimc !== treeFilter.value.mokuaimc) return false;
    return true;
  });
  total.value = modules.value.length;
  currentPage.value = 1;
};

// 点击树节点
const handleNodeClick = async (data: any) => {
  if (data.type === 'all') {
    treeFilter.value = {};
  } else if (data.type === 'version') {
    treeFilter.value = { banben: data.label };
  } else if (data.type === 'module') {
    treeFilter.value = { mokuaimc: data.label };
  }
  // 进入页面默认不查询列表，点击树节点时若尚未加载则加载
  if (allModules.value.length === 0) {
    await loadModules(true);
  } else {
    applyFilter();
  }
};

// 树搜索
const filterNode = (value: string, data: any) => {
  if (!value) return true;
  return data.label.includes(value);
};
const handleTreeSearch = () => {
  treeRef.value?.filter(treeKeyword.value);
};

// 加载模块数据
const loadModules = async (showList = true) => {
  loading.value = true;
  try {
    const res = await axios.get('/api/dict/modules');
    allModules.value = res.data?.data || [];
    if (showList) applyFilter();
    buildTree();
  } catch (error) {
    ElMessage.error('加载模块数据失败');
    console.error('加载模块数据失败:', error);
  } finally {
    loading.value = false;
  }
};

// 新增（版本默认取当前所选树节点）
const handleAdd = () => {
  dialogType.value = 'add';
  const node = treeRef.value?.getCurrentNode() || null;
  let banben = 'HIS问题';
  if (node) {
    if (node.type === 'version') {
      banben = node.label;
    } else if (node.type === 'module') {
      banben = node.banben || 'HIS问题';
    }
  }
  formData.value = { id: 0, banben, mokuaimc: '' };
  dialogVisible.value = true;
};

// 编辑
const handleEdit = (row: any) => {
  dialogType.value = 'edit';
  formData.value = { ...row };
  dialogVisible.value = true;
};

// 删除
const handleDelete = async (id: number) => {
  try {
    await axios.delete(`/api/dict/modules/${id}`);
    ElMessage.success('删除成功');
    loadModules();
  } catch (error) {
    ElMessage.error('删除失败');
    console.error('删除失败:', error);
  }
};

// 提交
const handleSubmit = async () => {
  if (!formData.value.banben) {
    ElMessage.warning('请选择版本');
    return;
  }
  if (!formData.value.mokuaimc) {
    ElMessage.warning('请填写模块名称');
    return;
  }

  try {
    if (dialogType.value === 'add') {
      await axios.post('/api/dict/modules', formData.value);
      ElMessage.success('新增成功');
    } else {
      // 编辑只提交有效字段，避免 id 等多余字段导致后端报错
      await axios.put(`/api/dict/modules/${formData.value.id}`, {
        banben: formData.value.banben,
        mokuaimc: formData.value.mokuaimc
      });
      ElMessage.success('编辑成功');
    }
    dialogVisible.value = false;
    loadModules();
  } catch (error) {
    ElMessage.error(dialogType.value === 'add' ? '新增失败' : '编辑失败');
    console.error('提交失败:', error);
  }
};

// 分页
const handleSizeChange = (size: number) => {
  pageSize.value = size;
};

const handleCurrentChange = (current: number) => {
  currentPage.value = current;
};

// 初始化：默认不查询列表，仅构建树；点击树节点时才加载模块列表
onMounted(() => {
  loadModules(false);
});
</script>

<style scoped>
.module-maintenance {
  padding: 0;
  height: 100%;
  display: flex;
  flex-direction: column;
}

.card-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.el-card {
  height: 100%;
  margin-bottom: 0;
  display: flex;
  flex-direction: column;
}

.el-card__body {
  flex: 1;
  overflow: hidden;
  padding: 12px;
  display: flex;
  flex-direction: column;
}

.main-body {
  flex: 1;
  min-height: 0;
  display: flex;
  gap: 12px;
}

.tree-panel {
  width: 240px;
  flex-shrink: 0;
  border: 1px solid var(--el-border-color-lighter, #e4e7ed);
  border-radius: 6px;
  padding: 8px;
  display: flex;
  flex-direction: column;
  overflow: hidden;
}

.tree-search {
  margin-bottom: 8px;
}

.dict-tree {
  flex: 1;
  min-height: 0;
  overflow: auto;
}

.table-panel {
  flex: 1;
  min-width: 0;
  display: flex;
  flex-direction: column;
}

.el-table {
  flex: 1;
  min-height: 0;
}

.el-table__body-wrapper {
  overflow: auto;
}

.pagination-container {
  margin-top: 12px;
  display: flex;
  justify-content: flex-end;
  flex-shrink: 0;
}
</style>
