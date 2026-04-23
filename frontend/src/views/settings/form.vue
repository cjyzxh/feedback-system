<template>
  <div class="form-maintenance">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>窗体维护</span>
          <el-button type="primary" @click="handleAdd">新增</el-button>
        </div>
      </template>
      
      <el-table v-loading="loading" :data="forms" style="width: 100%">
        <el-table-column prop="id" label="ID" width="80" />
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
    </el-card>
    
    <!-- 新增/编辑对话框 -->
    <el-dialog
      v-model="dialogVisible"
      :title="dialogType === 'add' ? '新增窗体' : '编辑窗体'"
      width="500px"
    >
      <el-form :model="formData" label-width="80px">
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
          <el-button @click="dialogVisible = false">取消</el-button>
          <el-button type="primary" @click="handleSubmit">确定</el-button>
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
const forms = ref<any[]>([]);
const total = ref(0);
const currentPage = ref(1);
const pageSize = ref(10);

const dialogVisible = ref(false);
const dialogType = ref<'add' | 'edit'>('add');
const formData = ref({
  id: 0,
  mokuai: '',
  chuangtimc: ''
});

const modules = ref<any[]>([]);

// 加载窗体数据
const loadForms = async () => {
  loading.value = true;
  try {
    const res = await axios.get('/api/dict/forms');
    console.log('窗体数据:', res.data);
    // 处理后端返回的数据结构，将 label 和 module 映射到 chuangtimc 和 mokuai
    forms.value = (res.data?.data || []).map((item: any) => ({
      id: item.id,
      mokuai: item.module || item.mokuai,
      chuangtimc: item.label || item.chuangtimc
    }));
    total.value = forms.value.length;
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
    mokuai: '',
    chuangtimc: ''
  };
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
  if (!formData.value.mokuai || !formData.value.chuangtimc) {
    ElMessage.warning('请填写完整信息');
    return;
  }
  
  try {
    if (dialogType.value === 'add') {
      await axios.post('/api/dict/forms', formData.value);
      ElMessage.success('新增成功');
    } else {
      await axios.put(`/api/dict/forms/${formData.value.id}`, formData.value);
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
  loadForms();
};

const handleCurrentChange = (current: number) => {
  currentPage.value = current;
  loadForms();
};

// 加载模块数据
const loadModules = async () => {
  try {
    const res = await axios.get('/api/dict/modules');
    modules.value = res.data?.data || [];
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
  padding: 20px;
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
  margin-top: 20px;
  display: flex;
  justify-content: flex-end;
  flex-shrink: 0;
}
</style>