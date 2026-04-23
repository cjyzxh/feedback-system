const bcrypt = require('bcrypt');

const password = 'admin123';
const saltRounds = 10;

console.log('正在生成密码哈希...');
console.log(`密码: ${password}\n`);

bcrypt.hash(password, saltRounds, (err, hash) => {
  if (err) {
    console.error('生成失败:', err);
    return;
  }
  
  console.log('✅ 哈希生成成功！');
  console.log(`哈希值: ${hash}\n`);
  
  console.log('请使用以下 SQL 语句插入用户：');
  console.log(`
INSERT INTO sys_user (username, password, realName, email, phone, role, status)
VALUES (
  'admin', 
  '${hash}', 
  '系统管理员', 
  'admin@example.com', 
  '13800138000', 
  'admin', 
  1
);
  `);
});
