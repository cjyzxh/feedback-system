import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Hospital } from './hospital.entity';

// 中文转拼音工具函数
function getPinyin(name: string): string {
  if (!name) return '';
  
  const pinyinMap: Record<string, string> = {
    '北': 'B', '上': 'S', '广': 'G', '浙': 'Z', '江': 'J', '福': 'F', '四': 'S',
    '湖': 'H', '安': 'A', '陕': 'S', '辽': 'L', '吉': 'J', '黑': 'H', '河': 'H',
    '山': 'S', '云': 'Y', '贵': 'G', '海': 'H', '津': 'J',
    '宁': 'N', '新': 'X', '藏': 'Z', '蒙': 'M', '桂': 'G', '青': 'Q', '甘': 'G',
    '澳': 'A', '台': 'T', '香': 'X', '港': 'G', '东': 'D', '医': 'Y', '科': 'K',
    '大': 'D', '学': 'X', '院': 'Y', '人': 'R', '民': 'M', '第': 'D', '一': 'Y'
  };
  
  let result = '';
  for (const char of name) {
    const upper = char.toUpperCase();
    if (upper >= 'A' && upper <= 'Z') {
      result += upper;
    } else if (pinyinMap[char]) {
      result += pinyinMap[char];
    }
  }
  return result.substring(0, 10);
}

@Injectable()
export class HospitalService {
  constructor(
    @InjectRepository(Hospital)
    private hospitalRepository: Repository<Hospital>,
  ) {}

  // 省份列表
  getProvinces(): string[] {
    return [
      '北京市', '天津市', '上海市', '重庆市',
      '河北省', '山西省', '辽宁省', '吉林省', '黑龙江省',
      '江苏省', '浙江省', '安徽省', '福建省', '江西省', '山东省',
      '河南省', '湖北省', '湖南省', '广东省', '海南省',
      '四川省', '贵州省', '云南省', '陕西省', '甘肃省', '青海省', '台湾省',
      '内蒙古自治区', '广西壮族自治区', '西藏自治区', '宁夏回族自治区', '新疆维吾尔自治区',
      '香港特别行政区', '澳门特别行政区'
    ];
  }

  // 城市列表（按省份）
  getCities(province: string): string[] {
    const cities: Record<string, string[]> = {
      '浙江省': ['杭州市', '宁波市', '温州市', '嘉兴市', '湖州市', '绍兴市', '金华市', '衢州市', '舟山市', '台州市', '丽水市'],
      '江苏省': ['南京市', '苏州市', '无锡市', '常州市', '南通市', '连云港市', '淮安市', '盐城市', '扬州市', '镇江市', '泰州市', '宿迁市'],
      '广东省': ['广州市', '深圳市', '珠海市', '东莞市', '佛山市', '中山市', '江门市', '湛江市', '茂名市', '肇庆市', '惠州市', '梅州市', '汕尾市', '河源市', '阳江市', '清远市', '韶关市', '揭阳市', '潮州市', '云浮市'],
      '北京市': ['北京市'],
      '上海市': ['上海市'],
      '湖北省': ['武汉市', '黄石市', '十堰市', '宜昌市', '襄阳市', '鄂州市', '荆门市', '孝感市', '荆州市', '黄冈市', '咸宁市', '随州市', '恩施市'],
      '湖南省': ['长沙市', '株洲市', '湘潭市', '衡阳市', '邵阳市', '岳阳市', '常德市', '张家界市', '益阳市', '郴州市', '永州市', '怀化市', '娄底市', '湘西市'],
      '四川省': ['成都市', '自贡市', '攀枝花市', '泸州市', '德阳市', '绵阳市', '广元市', '遂宁市', '内江市', '乐山市', '南充市', '眉山市', '宜宾市', '广安市', '达州市', '雅安市', '巴中市', '资阳市', '阿坝市', '甘孜市', '凉山市']
    };
    return cities[province] || ['其他'];
  }

  // 分页查询
  async findAll(page = 1, pageSize = 10, keyword?: string): Promise<{ list: Hospital[]; total: number }> {
    const qb = this.hospitalRepository.createQueryBuilder('h');
    if (keyword) {
      qb.where('h.name LIKE :keyword OR h.pym LIKE :keyword OR h.province LIKE :keyword', { keyword: `%${keyword}%` });
    }
    const [list, total] = await qb.orderBy('h.id', 'DESC').skip((page - 1) * pageSize).take(pageSize).getManyAndCount();
    return { list, total };
  }

  // 根据ID查询
  async findOne(id: number): Promise<Hospital> {
    const hospital = await this.hospitalRepository.findOne({ where: { id } });
    if (!hospital) throw new NotFoundException(`医院 ID ${id} 不存在`);
    return hospital;
  }

  // 创建医院（自动生成拼音码）
  async create(data: Partial<Hospital>): Promise<Hospital> {
    // 自动生成拼音码
    if (data.name && !data.pym) {
      data.pym = getPinyin(data.name);
    }
    const hospital = this.hospitalRepository.create(data);
    return this.hospitalRepository.save(hospital);
  }

  // 更新医院
  async update(id: number, data: Partial<Hospital>): Promise<Hospital> {
    const hospital = await this.findOne(id);
    // 如果名称变了，更新拼音码
    if (data.name && data.name !== hospital.name) {
      data.pym = getPinyin(data.name);
    }
    Object.assign(hospital, data);
    return this.hospitalRepository.save(hospital);
  }

  // 删除医院
  async remove(id: number): Promise<void> {
    const hospital = await this.findOne(id);
    await this.hospitalRepository.remove(hospital);
  }
}