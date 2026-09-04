<template>
  <div class="form-maintenance">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>窗体维护</span>
          <el-button class="morandi-btn morandi-blue" @click="handleAdd">新增</el-button>
        </div>
      </template>

      <div class="main-body">
        <!-- 左侧树形结构：版本 → 模块 → 窗体 -->
        <div class="tree-panel">
          <el-input
            v-model="treeKeyword"
            placeholder="搜索版本/模块/窗体"
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
          <el-table v-loading="loading" :data="forms" style="width: 100%">
            <el-table-column prop="banben" label="版本" width="110" />
            <el-table-column prop="mokuai" label="模块" width="180" />
            <el-table-column prop="chuangtimc" label="窗体名称" min-width="200" />
            <el-table-column label="操作" width="150" fixed="right">
              <template #default="scope">
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
      :title="dialogType === 'add' ? '新增窗体' : '编辑窗体'"
      width="500px"
    >
      <el-form :model="formData" label-width="80px">
        <el-form-item label="版本">
          <el-select v-model="formData.banben" placeholder="请选择版本" style="width: 100%;" @change="handleVersionChange">
            <el-option label="HIS问题" value="HIS问题" />
            <el-option label="医保接口" value="医保接口" />
            <el-option label="其它问题" value="其它问题" />
          </el-select>
        </el-form-item>
        <el-form-item label="模块">
          <el-select v-model="formData.mokuai" placeholder="请选择模块" style="width: 100%">
            <el-option v-for="module in modules" :key="module.id" :label="module.mokuaimc" :value="module.mokuaimc" />
          </el-select>
        </el-form-item>
        <el-form-item label="窗体名称">
          <el-input v-model="formData.chuangtimc" placeholder="请输入窗体名称" />
        </el-form-item>
      </el-form>
      <template #footer>
        <span class="dialog-footer">
          <el-button class="btn-cancel" @click="dialogVisible = false">取消</el-button>
          <el-button class="morandi-btn morandi-blue" @click="handleSubmit">确定</el-button>
        </span>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue';
import axios from 'axios';
import { ElMessage } from 'element-plus';

const loading = ref(false);
const allForms = ref<any[]>([]);  // 全量窗体数据
const forms = ref<any[]>([]);     // 显示（按树过滤后）
const total = ref(0);
const currentPage = ref(1);
const pageSize = ref(10);

const dialogVisible = ref(false);
const dialogType = ref<'add' | 'edit'>('add');
const formData = ref({
  id: 0,
  banben: 'HIS问题',
  mokuai: '',
  chuangtimc: ''
});

const modules = ref<any[]>([]);

// 树形结构
const treeRef = ref<any>(null);
const treeKeyword = ref('');
const treeData = ref<any[]>([]);
const treeFilter = ref<{ banben?: string; mokuai?: string; chuangtimc?: string }>({});

// 根据版本加载模块
const loadModulesByVersion = async (banben: string) => {
  if (!banben) {
    modules.value = [];
    return;
  }
  try {
    const res = await axios.get('/api/dict/modules', { params: { banben } });
    modules.value = res.data?.data || [];
  } catch (error) {
    console.error('加载模块失败:', error);
    modules.value = [];
  }
};

// 版本变化处理
const handleVersionChange = (val: string) => {
  formData.value.mokuai = '';
  loadModulesByVersion(val);
};

// 构建树形结构：版本 → 模块 → 窗体
const buildTree = () => {
  const versions = [...new Set(modules.value.map((m: any) => m.banben).filter(Boolean))];
  treeData.value = [
    {
      id: 'all',
      label: '全部窗体',
      type: 'all',
      children: versions.map((v: string) => ({
        id: 'v-' + v,
        label: v,
        type: 'version',
        children: modules.value
          .filter((mo: any) => mo.banben === v)
          .map((mo: any) => ({
            id: 'm-' + mo.id,
            label: mo.mokuaimc,
            type: 'module',
            children: allForms.value
              .filter((f: any) => f.mokuai === mo.mokuaimc)
              .map((f: any) => ({
                id: 'f-' + f.id,
                label: f.chuangtimc,
                type: 'form'
              }))
          }))
      }))
    }
  ];
};

// 应用树过滤
const applyFilter = () => {
  forms.value = allForms.value.filter((f: any) => {
    if (treeFilter.value.banben && f.banben !== treeFilter.value.banben) return false;
    if (treeFilter.value.mokuai && f.mokuai !== treeFilter.value.mokuai) return false;
    if (treeFilter.value.chuangtimc && f.chuangtimc !== treeFilter.value.chuangtimc) return false;
    return true;
  });
  total.value = forms.value.length;
  currentPage.value = 1;
};

// 点击树节点
const handleNodeClick = (data: any) => {
  if (data.type === 'all') {
    treeFilter.value = {};
  } else if (data.type === 'version') {
    treeFilter.value = { banben: data.label };
  } else if (data.type === 'module') {
    treeFilter.value = { mokuai: data.label };
  } else if (data.type === 'form') {
    treeFilter.value = { chuangtimc: data.label };
  }
  applyFilter();
};

// 树搜索
const filterNode = (value: string, data: any) => {
  if (!value) return true;
  return data.label.includes(value);
};
const handleTreeSearch = () => {
  treeRef.value?.filter(treeKeyword.value);
};

// 加载窗体数据
const loadForms = async () => {
  loading.value = true;
  try {
    const res = await axios.get('/api/dict/forms');
    // 处理后端返回的数据结构，将 label 和 module 映射到 chuangtimc 和 mokuai
    allForms.value = (res.data?.data || []).map((item: any) => ({
      id: item.id,
      banben: item.banben,
      mokuai: item.module || item.mokuai,
      chuangtimc: item.label || item.chuangtimc
    }));
    applyFilter();
    buildTree();
  } catch (error) {
    ElMessage.error('加载窗体数据失败');
    console.error('加载窗体数据失败:', error);
  } finally {
    loading.value = false;
  }
};

// 新增
const handleAdd = () => {
  dialogType.value = 'add';
  formData.value = {
    id: 0,
    banben: 'HIS问题',
    mokuai: '',
    chuangtimc: ''
  };
  loadModulesByVersion('HIS问题');
  dialogVisible.value = true;
};

// 编辑
const handleEdit = (row: any) => {
  dialogType.value = 'edit';
  formData.value = { ...row };
  // 编辑时先加载该模块对应的版本下的所有模块
  if (row.banben) {
    loadModulesByVersion(row.banben);
  } else if (row.mokuai) {
    // 如果没有版本信息，先加载所有模块
    loadModulesByVersion('');
  }
  dialogVisible.value = true;
};

// 删除
const handleDelete = async (id: number) => {
  try {
    await axios.delete(`/api/dict/forms/${id}`);
    ElMessage.success('删除成功');
    loadForms();
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
  if (!formData.value.mokuai || !formData.value.chuangtimc) {
    ElMessage.warning('请填写完整信息');
    return;
  }

  try {
    if (dialogType.value === 'add') {
      await axios.post('/api/dict/forms', formData.value);
      ElMessage.success('新增成功');
    } else {
      // 编辑只提交有效字段，避免 id 等多余字段导致后端报错
      await axios.put(`/api/dict/forms/${formData.value.id}`, {
        banben: formData.value.banben,
        mokuai: formData.value.mokuai,
        chuangtimc: formData.value.chuangtimc
      });
      ElMessage.success('编辑成功');
    }
    dialogVisible.value = false;
    loadForms();
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

// 加载模块数据
const loadModules = async () => {
  try {
    const res = await axios.get('/api/dict/modules');
    modules.value = res.data?.data || [];
    buildTree();
  } catch (error) {
    console.error('加载模块数据失败:', error);
  }
};

// 初始化
onMounted(() => {
  loadForms();
  loadModules();
});
</script>

<style scoped>
.form-maintenance {
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
