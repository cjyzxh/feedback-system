<template>
  <div class="report-container">
    <el-card>
      <template #header>
        <div class="card-header">
          <span>时效分析报表</span>
          <el-button @click="loadData"><el-icon><Refresh /></el-icon> 刷新</el-button>
        </div>
      </template>
      
      <el-tabs v-model="activeTab">
        <el-tab-pane label="研发处理时效" name="dev">
          <el-row :gutter="20">
            <el-col :span="8">
              <el-card shadow="hover">
                <h3>紧急（≤24小时）</h3>
                <div class="stat">
                  <span class="num">{{ devData.urgent.total }}</span>
                  <span class="label">总计</span>
                </div>
                <div class="stat">
                  <span class="num success">{{ devData.urgent.ok }}</span>
                  <span class="label">达标</span>
                </div>
                <el-progress :percentage="devData.urgent.total ? (devData.urgent.ok / devData.urgent.total * 100) : 0" />
              </el-card>
            </el-col>
            <el-col :span="8">
              <el-card shadow="hover">
                <h3>急（≤72小时）</h3>
                <div class="stat">
                  <span class="num">{{ devData.normal.total }}</span>
                  <span class="label">总计</span>
                </div>
                <div class="stat">
                  <span class="num success">{{ devData.normal.ok }}</span>
                  <span class="label">达标</span>
                </div>
                <el-progress :percentage="devData.normal.total ? (devData.normal.ok / devData.normal.total * 100) : 0" />
              </el-card>
            </el-col>
            <el-col :span="8">
              <el-card shadow="hover">
                <h3>一般（≤168小时）</h3>
                <div class="stat">
                  <span class="num">{{ devData.low.total }}</span>
                  <span class="label">总计</span>
                </div>
                <div class="stat">
                  <span class="num success">{{ devData.low.ok }}</span>
                  <span class="label">达标</span>
                </div>
                <el-progress :percentage="devData.low.total ? (devData.low.ok / devData.low.total * 100) : 0" />
              </el-card>
            </el-col>
          </el-row>
        </el-tab-pane>
        
        <el-tab-pane label="测试时效" name="test">
          <el-row :gutter="20">
            <el-col :span="8">
              <el-card shadow="hover">
                <h3>紧急（≤12小时）</h3>
                <div class="stat">
                  <span class="num">{{ testData.urgent.total }}</span>
                  <span class="label">总计</span>
                </div>
                <div class="stat">
                  <span class="num success">{{ testData.urgent.ok }}</span>
                  <span class="label">达标</span>
                </div>
                <el-progress :percentage="testData.urgent.total ? (testData.urgent.ok / testData.urgent.total * 100) : 0" />
              </el-card>
            </el-col>
            <el-col :span="8">
              <el-card shadow="hover">
                <h3>急（≤24小时）</h3>
                <div class="stat">
                  <span class="num">{{ testData.normal.total }}</span>
                  <span class="label">总计</span>
                </div>
                <div class="stat">
                  <span class="num success">{{ testData.normal.ok }}</span>
                  <span class="label">达标</span>
                </div>
                <el-progress :percentage="testData.normal.total ? (testData.normal.ok / testData.normal.total * 100) : 0" />
              </el-card>
            </el-col>
            <el-col :span="8">
              <el-card shadow="hover">
                <h3>一般（≤48小时）</h3>
                <div class="stat">
                  <span class="num">{{ testData.low.total }}</span>
                  <span class="label">总计</span>
                </div>
                <div class="stat">
                  <span class="num success">{{ testData.low.ok }}</span>
                  <span class="label">达标</span>
                </div>
                <el-progress :percentage="testData.low.total ? (testData.low.ok / testData.low.total * 100) : 0" />
              </el-card>
            </el-col>
          </el-row>
        </el-tab-pane>
      </el-tabs>
    </el-card>
  </div>
</template>

<script setup>
import { ref, reactive, onMounted } from 'vue'
import api from '@/api'

const activeTab = ref('dev')
const devData = reactive({ urgent: { total: 0, ok: 0 }, normal: { total: 0, ok: 0 }, low: { total: 0, ok: 0 } })
const testData = reactive({ urgent: { total: 0, ok: 0 }, normal: { total: 0, ok: 0 }, low: { total: 0, ok: 0 } })

const loadData = async () => {
  try {
    const devRes = await api.get('/feedback/report/dev-efficiency')
    const testRes = await api.get('/feedback/report/test-efficiency')
    Object.assign(devData, devRes)
    Object.assign(testData, testRes)
  } catch (e) {
    console.error(e)
  }
}

onMounted(() => {
  loadData()
})
</script>

<style scoped>
.stat {
  display: inline-block;
  margin-right: 20px;
}
.stat .num {
  font-size: 24px;
  font-weight: bold;
  display: block;
}
.stat .num.success {
  color: #67c23a;
}
.stat .label {
  font-size: 12px;
  color: #999;
}
</style>