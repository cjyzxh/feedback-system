const { UserService } = require('./src/modules/user/user.service');
const { User } = require('./src/modules/user/user.entity');
const { getRepository } = require('typeorm');

// 模拟UserService
class MockUserService {
  constructor() {
    this.userRepository = {
      findOne: async (options) => {
        console.log('查询参数:', options);
        // 模拟返回admin用户
        if (options.where.username === 'admin' || options.where.id === 1) {
          return {
            id: 1,
            username: 'admin',
            password: '$2b$10$EixZaYVK1fsbw1ZfbX3OXePaWxn96p36WQoeG6Lruj3vjPGga31lW',
            realName: '管理员',
            email: 'admin@example.com',
            phone: '13800138000',
            role: 'admin',
            status: 1
          };
        }
        return null;
      }
    };
  }

  // 复制findByUsernameOrId方法
  async findByUsernameOrId(identifier) {
    console.log('输入参数:', identifier, '类型:', typeof identifier);
    // 尝试作为ID查询
    const id = Number(identifier);
    console.log('转换后的ID:', id, 'isNaN:', isNaN(id), 'isInteger:', Number.isInteger(id));
    if (!isNaN(id) && Number.isInteger(id)) {
      const userById = await this.userRepository.findOne({
        where: { id },
      });
      console.log('按ID查询结果:', userById);
      if (userById) {
        return userById;
      }
    }
    
    // 作为用户名查询
    console.log('按用户名查询:', String(identifier));
    return this.userRepository.findOne({
      where: { username: String(identifier) },
    });
  }
}

// 测试
async function testFindByUsernameOrId() {
  const userService = new MockUserService();
  
  console.log('测试1: 使用用户名 "admin"');
  const user1 = await userService.findByUsernameOrId('admin');
  console.log('结果:', user1);
  console.log('');
  
  console.log('测试2: 使用ID "1"');
  const user2 = await userService.findByUsernameOrId('1');
  console.log('结果:', user2);
  console.log('');
  
  console.log('测试3: 使用ID 1');
  const user3 = await userService.findByUsernameOrId(1);
  console.log('结果:', user3);
}

testFindByUsernameOrId();