<template>
  <div class="hospital-manage">
    <el-card class="main-card" shadow="hover">
      <template #header>
        <div class="card-header">
          <span>医院维护</span>
          <el-button type="primary" @click="loadData"><el-icon><Refresh /></el-icon> 刷新</el-button>
        </div>
      </template>
      
      <el-form :inline="true" :model="searchForm" class="search-form">
        <el-form-item label="医院名称">
          <el-input v-model="searchForm.keyword" placeholder="搜索医院" clearable @keyup.enter="handleSearch" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="handleSearch">搜索</el-button>
          <el-button type="success" @click="handleAdd">新增医院</el-button>
        </el-form-item>
      </el-form>
      
      <el-table :data="tableData" border v-loading="loading" stripe>
        <el-table-column prop="name" label="医院名称" min-width="150" />
        <el-table-column prop="pym" label="拼音码" width="100" />
        <el-table-column prop="province" label="省份" width="100" />
        <el-table-column prop="city" label="市" width="100" />
        <el-table-column prop="leader" label="负责人" width="80" />
        <el-table-column prop="contact" label="电话" width="100" />
        <el-table-column prop="level" label="等级" width="80">
          <template #default="{ row }">
            <el-tag :type="row.level === '三级' ? 'danger' : row.level === '二级' ? 'warning' : 'info'" size="small">{{ row.level }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column prop="nature" label="性质" width="60">
          <template #default="{ row }">
            <el-tag :type="row.nature === '公立' ? 'success' : 'warning'" size="small">{{ row.nature }}</el-tag>
          </template>
        </el-table-column>
        <el-table-column label="操作" width="120" fixed="right">
          <template #default="{ row }">
            <el-button type="primary" link @click="handleEdit(row)">编辑</el-button>
            <el-button type="danger" link @click="handleDelete(row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      
      <el-pagination v-model:current-page="pagination.page" v-model:page-size="pagination.pageSize" :total="pagination.total" :page-sizes="[10,20,50]" layout="total,sizes,prev,pager,next" @size-change="loadData" @current-change="loadData" style="margin-top:20px;justify-content:flex-end;" />
    </el-card>
    
    <!-- 新增/编辑对话框 -->
    <el-dialog v-model="dialogVisible" :title="isEdit ? '编辑医院' : '新增医院'" width="600px" :close-on-click-modal="false" destroy-on-close>
      <el-form :model="form" :rules="rules" ref="formRef" label-width="90px">
        <el-form-item label="医院名称" prop="name">
          <el-input v-model="form.name" placeholder="请输入医院名称" @blur="onNameBlur" />
        </el-form-item>
        
        <el-form-item label="拼音码" prop="pym">
          <el-input v-model="form.pym" placeholder="自动生成" />
        </el-form-item>
        
        <el-form-item label="省市区" prop="region">
          <el-cascader v-model="form.region" :options="regionOptions" :props="{ checkStrictly: true, emitPath: false }" placeholder="请选择省市区" @change="onRegionChange" style="width:100%;" />
        </el-form-item>
        
        <el-row :gutter="16">
          <el-col :span="12">
            <el-form-item label="负责人" prop="leader">
              <el-input v-model="form.leader" placeholder="请输入负责人" />
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="联系电话" prop="contact">
              <el-input v-model="form.contact" placeholder="请输入电话" />
            </el-form-item>
          </el-col>
        </el-row>
        
        <el-row :gutter="16">
          <el-col :span="12">
            <el-form-item label="医院等级" prop="level">
              <el-select v-model="form.level" placeholder="请选择" style="width:100%;">
                <el-option label="三级甲等" value="三级" />
                <el-option label="三级乙等" value="三级" />
                <el-option label="二级甲等" value="二级" />
                <el-option label="二级乙等" value="二级" />
                <el-option label="一级" value="一级" />
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="医院性质" prop="nature">
              <el-select v-model="form.nature" placeholder="请选择" style="width:100%;">
                <el-option label="公立" value="公立" />
                <el-option label="私立" value="私立" />
              </el-select>
            </el-form-item>
          </el-col>
        </el-row>
      </el-form>
      
      <template #footer>
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="handleSubmit" :loading="submitting">保存</el-button>
      </template>
    </el-dialog>
  </div>
</template>

<script setup lang="ts">
import { ref, reactive, onMounted } from 'vue'
import { ElMessage, ElMessageBox } from 'element-plus'
import { Refresh } from '@element-plus/icons-vue'
import axios from '@/api'

const loading = ref(false)
const submitting = ref(false)
const dialogVisible = ref(false)
const isEdit = ref(false)
const formRef = ref()

const tableData = ref<any[]>([])
const regionOptions = ref<any[]>([])

const searchForm = reactive({ keyword: '' })
const form = reactive({
  id: 0, name: '', pym: '', province: '', city: '', leader: '', contact: '', level: '', nature: '', region: []
})

const rules = { name: [{ required: true, message: '请输入医院名称', trigger: 'blur' }] }
const pagination = reactive({ page: 1, pageSize: 10, total: 0 })

// 省市数据结构
const provinceData = [
  { value: '北京市', label: '北京市', children: [{ value: '北京市', label: '北京市' }] },
  { value: '上海市', label: '上海市', children: [{ value: '上海市', label: '上海市' }] },
  { value: '浙江省', label: '浙江省', children: [
    { value: '杭州市', label: '杭州市' }, { value: '宁波市', label: '宁波市' }, { value: '温州市', label: '温州市' },
    { value: '嘉兴市', label: '嘉兴市' }, { value: '湖州市', label: '湖州市' }, { value: '绍兴市', label: '绍兴市' },
    { value: '金华市', label: '金华市' }, { value: '衢州市', label: '衢州市' }, { value: '舟山市', label: '舟山市' },
    { value: '台州市', label: '台州市' }, { value: '丽水市', label: '丽水市' }
  ]},
  { value: '江苏省', label: '江苏省', children: [
    { value: '南京市', label: '南京市' }, { value: '苏州市', label: '苏州市' }, { value: '无锡市', label: '无锡市' },
    { value: '常州市', label: '常州市' }, { value: '南通市', label: '南通市' }, { value: '连云港市', label: '连云港市' },
    { value: '淮安市', label: '淮安市' }, { value: '盐城市', label: '盐城市' }, { value: '扬州市', label: '扬州市' },
    { value: '镇江市', label: '镇江市' }, { value: '泰州市', label: '泰州市' }, { value: '宿迁市', label: '宿迁市' }
  ]},
  { value: '广东省', label: '广东省', children: [
    { value: '广州市', label: '广州市' }, { value: '深圳市', label: '深圳市' }, { value: '珠海市', label: '珠海市' },
    { value: '东莞市', label: '东莞市' }, { value: '佛山市', label: '佛山市' }, { value: '中山市', label: '中山市' },
    { value: '江门市', label: '江门市' }, { value: '湛江市', label: '湛江市' }, { value: '茂名市', label: '茂名市' },
    { value: '肇庆市', label: '肇庆市' }, { value: '惠州市', label: '惠州市' }, { value: '梅州市', label: '梅州市' },
    { value: '汕尾市', label: '汕尾市' }, { value: '河源市', label: '河源市' }, { value: '阳江市', label: '阳江市' },
    { value: '清远市', label: '清远市' }, { value: '韶关市', label: '韶关市' }, { value: '揭阳市', label: '揭阳市' },
    { value: '潮州市', label: '潮州市' }, { value: '云浮市', label: '云浮市' }
  ]},
  { value: '湖北省', label: '湖北省', children: [
    { value: '武汉市', label: '武汉市' }, { value: '黄石市', label: '黄石市' }, { value: '十堰市', label: '十堰市' },
    { value: '宜昌市', label: '宜昌市' }, { value: '襄阳市', label: '襄阳市' }, { value: '鄂州市', label: '鄂州市' },
    { value: '荆门市', label: '荆门市' }, { value: '孝感市', label: '孝感市' }, { value: '荆州市', label: '荆州市' },
    { value: '黄冈市', label: '黄冈市' }, { value: '咸宁市', label: '咸宁市' }, { value: '随州市', label: '随州市' },
    { value: '恩施市', label: '恩施市' }
  ]},
  { value: '湖南省', label: '湖南省', children: [
    { value: '长沙市', label: '长沙市' }, { value: '株洲市', label: '株洲市' }, { value: '湘潭市', label: '湘潭市' },
    { value: '衡阳市', label: '衡阳市' }, { value: '邵阳市', label: '邵阳市' }, { value: '岳阳市', label: '岳阳市' },
    { value: '常德市', label: '常德市' }, { value: '张家界市', label: '张家界市' }, { value: '益阳市', label: '益阳市' },
    { value: '郴州市', label: '郴州市' }, { value: '永州市', label: '永州市' }, { value: '怀化市', label: '怀化市' },
    { value: '娄底市', label: '娄底市' }, { value: '湘西市', label: '湘西市' }
  ]},
  { value: '四川省', label: '四川省', children: [
    { value: '成都市', label: '成都市' }, { value: '自贡市', label: '自贡市' }, { value: '攀枝花市', label: '攀枝花市' },
    { value: '泸州市', label: '泸州市' }, { value: '德阳市', label: '德阳市' }, { value: '绵阳市', label: '绵阳市' },
    { value: '广元市', label: '广元市' }, { value: '遂宁市', label: '遂宁市' }, { value: '内江市', label: '内江市' },
    { value: '乐山市', label: '乐山市' }, { value: '南充市', label: '南充市' }, { value: '眉山市', label: '眉山市' },
    { value: '宜宾市', label: '宜宾市' }, { value: '广安市', label: '广安市' }, { value: '达州市', label: '达州市' },
    { value: '雅安市', label: '雅安市' }, { value: '巴中市', label: '巴中市' }, { value: '资阳市', label: '资阳市' },
    { value: '阿坝市', label: '阿坝市' }, { value: '甘孜市', label: '甘孜市' }, { value: '凉山市', label: '凉山市' }
  ]}
]

regionOptions.value = provinceData

// 生成拼音码
const getPym = (name: string): string => {
  if (!name) return ''
  
  // 汉字拼音首字母映射表（扩展版）
  const pyMap: Record<string, string> = {
    // 常用汉字拼音首字母
    '一': 'Y', '丁': 'D', '七': 'Q', '万': 'W', '三': 'S', '上': 'S', '下': 'X', '不': 'B', '与': 'Y', '专': 'Z',
    '东': 'D', '中': 'Z', '丹': 'D', '丽': 'L', '丸': 'W', '么': 'M', '义': 'Y', '之': 'Z', '乌': 'W', '乎': 'H',
    '乐': 'L', '书': 'S', '也': 'Y', '习': 'X', '乡': 'X', '买': 'M', '乱': 'L', '乾': 'Q', '并': 'B', '关': 'G',
    '交': 'J', '亥': 'H', '亦': 'Y', '产': 'C', '享': 'X', '京': 'J', '亭': 'T', '亮': 'L', '亲': 'Q', '以': 'Y',
    '但': 'D', '位': 'W', '低': 'D', '你': 'N', '住': 'Z', '佐': 'Z', '佑': 'Y', '体': 'T', '何': 'H', '佟': 'T',
    '余': 'Y', '佚': 'Y', '佛': 'F', '作': 'Z', '伯': 'B', '伶': 'L', '侄': 'Z', '保': 'B', '信': 'X', '修': 'X',
    '借': 'J', '值': 'Z', '倾': 'Q', '傅': 'F', '傻': 'S', '像': 'X', '催': 'C', '僧': 'S', '像': 'X', '催': 'C',
    '僧': 'S', '像': 'X', '催': 'C', '僧': 'S', '像': 'X', '催': 'C', '僧': 'S', '像': 'X', '催': 'C', '僧': 'S',
    // 省份相关汉字
    '北': 'B', '京': 'J', '天': 'T', '津': 'J', '河': 'H', '山': 'S', '辽': 'L', '吉': 'J', '黑': 'H', '上': 'S',
    '海': 'H', '江': 'J', '苏': 'S', '浙': 'Z', '安': 'A', '徽': 'H', '福': 'F', '建': 'J', '江': 'J', '西': 'X',
    '山': 'S', '东': 'D', '河': 'H', '南': 'N', '湖': 'H', '北': 'B', '湖': 'H', '南': 'N', '广': 'G', '东': 'D',
    '广': 'G', '西': 'X', '海': 'H', '南': 'N', '重': 'C', '庆': 'Q', '四': 'S', '川': 'C', '贵': 'G', '州': 'Z',
    '云': 'Y', '南': 'N', '西': 'X', '藏': 'Z', '陕': 'S', '西': 'X', '甘': 'G', '肃': 'S', '青': 'Q', '海': 'H',
    '宁': 'N', '夏': 'X', '新': 'X', '疆': 'J', '香': 'X', '港': 'G', '澳': 'A', '门': 'M', '台': 'T', '湾': 'W',
    // 医院相关汉字
    '医': 'Y', '院': 'Y', '中': 'Z', '心': 'X', '附': 'F', '属': 'S', '第': 'D', '一': 'Y', '二': 'E', '三': 'S',
    '四': 'S', '五': 'W', '六': 'L', '七': 'Q', '八': 'B', '九': 'J', '十': 'S', '人': 'R', '民': 'M', '公': 'G',
    '立': 'L', '私': 'S', '立': 'L', '总': 'Z', '院': 'Y', '分': 'F', '院': 'Y', '卫': 'W', '生': 'S', '局': 'J',
    // 百家姓
    '赵': 'Z', '钱': 'Q', '孙': 'S', '李': 'L', '周': 'Z', '吴': 'W', '郑': 'Z', '王': 'W', '冯': 'F', '陈': 'C',
    '褚': 'C', '卫': 'W', '蒋': 'J', '沈': 'S', '韩': 'H', '杨': 'Y', '朱': 'Z', '秦': 'Q', '尤': 'Y', '许': 'X',
    '何': 'H', '吕': 'L', '施': 'S', '张': 'Z', '孔': 'K', '曹': 'C', '严': 'Y', '华': 'H', '金': 'J', '魏': 'W',
    '陶': 'T', '姜': 'J', '戚': 'Q', '谢': 'X', '邹': 'Z', '喻': 'Y', '柏': 'B', '水': 'S', '窦': 'D', '章': 'Z',
    '云': 'Y', '苏': 'S', '潘': 'P', '葛': 'G', '奚': 'X', '范': 'F', '彭': 'P', '郎': 'L', '鲁': 'L', '韦': 'W',
    '昌': 'C', '马': 'M', '苗': 'M', '凤': 'F', '花': 'H', '方': 'F', '俞': 'Y', '任': 'R', '袁': 'Y', '柳': 'L',
    '酆': 'F', '鲍': 'B', '史': 'S', '唐': 'T', '费': 'F', '廉': 'L', '岑': 'C', '薛': 'X', '雷': 'L', '贺': 'H',
    '倪': 'N', '汤': 'T', '滕': 'T', '殷': 'Y', '罗': 'L', '毕': 'B', '郝': 'H', '邬': 'W', '安': 'A', '常': 'C',
    '乐': 'L', '于': 'Y', '时': 'S', '傅': 'F', '皮': 'P', '卞': 'B', '齐': 'Q', '康': 'K', '伍': 'W', '余': 'Y',
    '元': 'Y', '卜': 'B', '顾': 'G', '孟': 'M', '平': 'P', '黄': 'H', '和': 'H', '穆': 'M', '萧': 'X', '尹': 'Y',
    '姚': 'Y', '邵': 'S', '湛': 'Z', '汪': 'W', '祁': 'Q', '毛': 'M', '禹': 'Y', '狄': 'D', '米': 'M', '贝': 'B',
    '明': 'M', '臧': 'Z', '计': 'J', '伏': 'F', '成': 'C', '戴': 'D', '谈': 'T', '宋': 'S', '茅': 'M', '庞': 'P',
    '熊': 'X', '纪': 'J', '舒': 'S', '屈': 'Q', '项': 'X', '祝': 'Z', '董': 'D', '梁': 'L', '杜': 'D', '阮': 'R',
    '蓝': 'L', '闵': 'M', '席': 'X', '季': 'J', '麻': 'M', '强': 'Q', '贾': 'J', '路': 'L', '娄': 'L', '危': 'W',
    '江': 'J', '童': 'T', '颜': 'Y', '郭': 'G', '梅': 'M', '盛': 'S', '林': 'L', '刁': 'D', '锺': 'Z', '徐': 'X',
    '邱': 'Q', '骆': 'L', '高': 'G', '夏': 'X', '蔡': 'C', '田': 'T', '樊': 'F', '胡': 'H', '凌': 'L', '霍': 'H',
    '虞': 'Y', '万': 'W', '支': 'Z', '柯': 'K', '昝': 'Z', '管': 'G', '卢': 'L', '莫': 'M', '经': 'J', '房': 'F',
    '裘': 'Q', '缪': 'M', '干': 'G', '解': 'X', '应': 'Y', '宗': 'Z', '丁': 'D', '宣': 'X', '贲': 'B', '邓': 'D',
    '郁': 'Y', '单': 'S', '杭': 'H', '洪': 'H', '包': 'B', '诸': 'Z', '左': 'Z', '石': 'S', '崔': 'C', '吉': 'J',
    '钮': 'N', '龚': 'G', '程': 'C', '嵇': 'J', '邢': 'X', '滑': 'H', '裴': 'P', '陆': 'L', '荣': 'R', '翁': 'W',
    '荀': 'X', '羊': 'Y', '於': 'Y', '惠': 'H', '甄': 'Z', '麴': 'Q', '家': 'J', '封': 'F', '芮': 'R', '羿': 'Y',
    '储': 'C', '靳': 'J', '汲': 'J', '邴': 'B', '糜': 'M', '松': 'S', '井': 'J', '段': 'D', '富': 'F', '巫': 'W',
    '乌': 'W', '焦': 'J', '巴': 'B', '弓': 'G', '牧': 'M', '隗': 'K', '山': 'S', '谷': 'G', '车': 'C', '侯': 'H',
    '宓': 'M', '蓬': 'P', '全': 'Q', '郗': 'X', '班': 'B', '仰': 'Y', '秋': 'Q', '仲': 'Z', '伊': 'Y', '宫': 'G',
    '宁': 'N', '仇': 'Q', '栾': 'L', '暴': 'B', '甘': 'G', '钭': 'T', '厉': 'L', '戎': 'R', '祖': 'Z', '武': 'W',
    '符': 'F', '刘': 'L', '景': 'J', '詹': 'Z', '束': 'S', '龙': 'L', '叶': 'Y', '幸': 'X', '司': 'S', '韶': 'S',
    '郜': 'G', '黎': 'L', '蓟': 'J', '薄': 'B', '印': 'Y', '宿': 'S', '白': 'B', '怀': 'H', '蒲': 'P', '邰': 'T',
    '从': 'C', '鄂': 'E', '索': 'S', '咸': 'X', '籍': 'J', '赖': 'L', '卓': 'Z', '蔺': 'L', '屠': 'T', '蒙': 'M',
    '池': 'C', '乔': 'Q', '阴': 'Y', '郁': 'Y', '胥': 'X', '能': 'N', '苍': 'C', '双': 'S', '闻': 'W', '莘': 'S',
    '党': 'D', '翟': 'Z', '谭': 'T', '贡': 'G', '劳': 'L', '逄': 'P', '姬': 'J', '申': 'S', '扶': 'F', '堵': 'D',
    '冉': 'R', '宰': 'Z', '郦': 'L', '雍': 'Y', '却': 'Q', '璩': 'Q', '桑': 'S', '桂': 'G', '濮': 'P', '牛': 'N',
    '寿': 'S', '通': 'T', '边': 'B', '扈': 'H', '燕': 'Y', '冀': 'J', '郏': 'J', '浦': 'P', '尚': 'S', '农': 'N',
    '温': 'W', '别': 'B', '庄': 'Z', '晏': 'Y', '柴': 'C', '瞿': 'Q', '阎': 'Y', '充': 'C', '慕': 'M', '连': 'L',
    '茹': 'R', '习': 'X', '宦': 'H', '艾': 'A', '鱼': 'Y', '容': 'R', '向': 'X', '古': 'G', '易': 'Y', '慎': 'S',
    '戈': 'G', '廖': 'L', '庾': 'Y', '终': 'Z', '暨': 'J', '居': 'J', '衡': 'H', '步': 'B', '都': 'D', '耿': 'G',
    '满': 'M', '弘': 'H', '匡': 'K', '国': 'G', '文': 'W', '寇': 'K', '广': 'G', '禄': 'L', '阙': 'Q', '东欧': 'D',
    '殳': 'S', '沃': 'W', '利': 'L', '蔚': 'W', '越': 'Y', '夔': 'K', '隆': 'L', '师': 'S', '巩': 'G', '厍': 'S',
    '聂': 'N', '晁': 'C', '勾': 'G', '敖': 'A', '融': 'R', '冷': 'L', '訾': 'Z', '辛': 'X', '阚': 'K', '那': 'N',
    '简': 'J', '饶': 'R', '空': 'K', '曾': 'Z', '毋': 'W', '沙': 'S', '乜': 'M', '养': 'Y', '鞠': 'J', '须': 'X',
    '丰': 'F', '巢': 'C', '关': 'G', '蒯': 'K', '相': 'X', '查': 'Z', '后': 'H', '荆': 'J', '红': 'H', '游': 'Y',
    '竺': 'Z', '权': 'Q', '逯': 'L', '盖': 'G', '益': 'Y', '桓': 'H', '公': 'G', '仉': 'Z', '督': 'D', '岳': 'Y',
    '帅': 'S', '缑': 'G', '亢': 'K', '况': 'K', '后': 'H', '有': 'Y', '琴': 'Q', '归': 'G', '海': 'H', '晋': 'J',
    '楚': 'C', '闫': 'Y', '法': 'F', '汝': 'R', '鄢': 'Y', '涂': 'T', '钦': 'Q', '商': 'S', '牟': 'M', '佘': 'S',
    '佴': 'N', '伯': 'B', '赏': 'S', '墨': 'M', '哈': 'H', '谯': 'Q', '笪': 'D', '年': 'N', '爱': 'A', '阳': 'Y',
    '佟': 'T', '言': 'Y', '福': 'F', '南': 'N', '火': 'H', '铁': 'T', '迟': 'C', '漆': 'Q', '官': 'G', '冼': 'X',
    '真': 'Z', '展': 'Z', '繁': 'F', '檀': 'T', '祭': 'J', '密': 'M', '敬': 'J', '揭': 'J', '舜': 'S', '楼': 'L',
    '疏': 'S', '冒': 'M', '浑': 'H', '挚': 'Z', '胶': 'J', '随': 'S', '高': 'G', '皋': 'G', '原': 'Y', '种': 'Z',
    '练': 'L', '弥': 'M', '仓': 'C', '眭': 'S', '蹇': 'J', '覃': 'Q', '阿': 'A', '门': 'M', '恽': 'Y', '来': 'L',
    '綦': 'Q', '召': 'Z', '仪': 'Y', '风': 'F', '介': 'J', '巨': 'J', '木': 'M', '京': 'J', '狐': 'H', '郇': 'X',
    '虎': 'H', '枚': 'M', '侯': 'H', '宓': 'M', '蓬': 'P', '邴': 'B', '微': 'W', '生': 'S', '岳': 'Y', '帅': 'S',
    '缑': 'G', '亢': 'K', '况': 'K', '后': 'H', '有': 'Y', '琴': 'Q', '归': 'G', '海': 'H', '晋': 'J', '楚': 'C',
    '闫': 'Y', '法': 'F', '汝': 'R', '鄢': 'Y', '涂': 'T', '钦': 'Q', '商': 'S', '牟': 'M', '佘': 'S', '佴': 'N',
    '伯': 'B', '赏': 'S', '墨': 'M', '哈': 'H', '谯': 'Q', '笪': 'D', '年': 'N', '爱': 'A', '阳': 'Y', '佟': 'T',
    '言': 'Y', '福': 'F', '南': 'N', '火': 'H', '铁': 'T', '迟': 'C', '漆': 'Q', '官': 'G', '冼': 'X', '真': 'Z',
    '展': 'Z', '繁': 'F', '檀': 'T', '祭': 'J', '密': 'M', '敬': 'J', '揭': 'J', '舜': 'S', '楼': 'L', '疏': 'S',
    '冒': 'M', '浑': 'H', '挚': 'Z', '胶': 'J', '随': 'S', '高': 'G', '皋': 'G', '原': 'Y', '种': 'Z', '练': 'L',
    '弥': 'M', '仓': 'C', '眭': 'S', '蹇': 'J', '覃': 'Q', '阿': 'A', '门': 'M', '恽': 'Y', '来': 'L', '綦': 'Q',
    '召': 'Z', '仪': 'Y', '风': 'F', '介': 'J', '巨': 'J', '木': 'M', '京': 'J', '狐': 'H', '郇': 'X', '虎': 'H',
    '枚': 'M', '侯': 'H'
  }
  
  let result = ''
  for (const char of name) {
    const upper = char.toUpperCase()
    if (upper >= 'A' && upper <= 'Z') {
      result += upper
    } else if (pyMap[char]) {
      result += pyMap[char]
    } else {
      // 对于不在映射表中的汉字，使用默认处理
      result += '?'
    }
  }
  return result.substring(0, 10)
}

const onNameBlur = () => {
  if (form.name && !form.pym) {
    form.pym = getPym(form.name)
  }
}

// 省市选择变化
const onRegionChange = (value: any[]) => {
  if (value && value.length >= 1) {
    form.province = value[0]
    form.city = value[1] || ''
  }
}

const loadData = async () => {
  loading.value = true
  try {
    const res = await axios.get('/hospital', { params: { page: pagination.page, pageSize: pagination.pageSize, keyword: searchForm.keyword || undefined } })
    tableData.value = res?.list || res?.data?.list || []
    pagination.total = res?.total || res?.data?.total || 0
  } catch (err) { console.error('加载失败:', err) }
  finally { loading.value = false }
}

const handleSearch = () => { pagination.page = 1; loadData() }

const handleAdd = () => {
  isEdit.value = false
  Object.assign(form, { id: 0, name: '', pym: '', province: '', city: '', leader: '', contact: '', level: '', nature: '', region: [] })
  dialogVisible.value = true
}

const handleEdit = (row: any) => {
  isEdit.value = true
  Object.assign(form, row)
  if (form.province) {
    form.region = form.city ? [form.province, form.city] : [form.province]
  }
  dialogVisible.value = true
}

const handleDelete = async (row: any) => {
  try {
    await ElMessageBox.confirm('确定删除该医院吗？', '提示', { type: 'warning' })
    await axios.delete(`/hospital/${row.id}`)
    ElMessage.success('删除成功')
    loadData()
  } catch (err: any) { if (err !== 'cancel') ElMessage.error(err.message || '删除失败') }
}

const handleSubmit = async () => {
  try {
    await formRef.value?.validate()
    submitting.value = true
    
    if (isEdit.value) {
      await axios.put(`/hospital/${form.id}`, form)
      ElMessage.success('更新成功')
    } else {
      await axios.post('/hospital', form)
      ElMessage.success('创建成功')
    }
    
    dialogVisible.value = false
    loadData()
  } catch (err: any) {
    if (err !== 'cancel') ElMessage.error(err.message || '保存失败')
  } finally {
    submitting.value = false
  }
}

onMounted(() => { loadData() })
</script>

<style scoped>
.hospital-manage {
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

.search-form { margin-bottom: 20px; }

.main-card {
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
</style>