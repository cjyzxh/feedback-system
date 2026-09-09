// 一次性回填脚本：按 zd_jishuyuan 的 category 回填 sys_user 的 isShishi/isYanfa
// 规则：category 含 '0' → 实施人员(isShishi=1)；含 '1' → 研发人员(isYanfa=1)
// 按姓名匹配（zd_jishuyuan.xingming = sys_user.realName），匹配不到留 0，人工在用户管理页勾选
const fs = require('fs');
const path = require('path');
const sql = require('mssql');

const env = fs.readFileSync(path.join(__dirname, '..', '.env'), 'utf8');
const m = {};
env.split(/\r?\n/).forEach(l => {
  const i = l.indexOf('=');
  if (i > 0) m[l.substring(0, i).trim()] = l.substring(i + 1).trim();
});

(async () => {
  const pool = await sql.connect({
    server: m.DB_HOST || '192.168.2.5',
    port: Number(m.DB_PORT || 1433),
    user: m.DB_USERNAME || 'SA',
    password: m.DB_PASSWORD || '1',
    database: m.DB_DATABASE || 'New_WTFK',
    options: { encrypt: false, trustServerCertificate: true }
  });
  console.log('连接成功:', m.DB_DATABASE || 'New_WTFK');

  // 1. 取 zd_jishuyuan 全部人员及 category
  const staff = await pool.request().query('SELECT xingming, category, zhuangtai FROM zd_jishuyuan WHERE xingming IS NOT NULL AND xingming <> N\'\'');
  console.log('zd_jishuyuan 人数:', staff.recordset.length);

  // 2. 姓名 → 编码 映射（sys_user）
  const users = await pool.request().query("SELECT username, realName, status FROM sys_user WHERE realName IS NOT NULL AND realName <> ''");
  const nameMap = {};
  users.recordset.forEach(u => { nameMap[u.realName] = u.username; });
  console.log('sys_user 人数:', users.recordset.length);

  // 3. 逐人回填
  let matched = 0, shishi = 0, yanfa = 0, both = 0;
  for (const s of staff.recordset) {
    const username = nameMap[s.xingming];
    if (!username) { console.log('未匹配:', s.xingming, '(category=' + s.category + ')'); continue; }
    const isShishi = String(s.category || '').indexOf('0') >= 0 ? 1 : 0;
    const isYanfa = String(s.category || '').indexOf('1') >= 0 ? 1 : 0;
    await pool.request()
      .input('username', sql.NVarChar, username)
      .input('isShishi', sql.Int, isShishi)
      .input('isYanfa', sql.Int, isYanfa)
      .query('UPDATE sys_user SET isShishi = @isShishi, isYanfa = @isYanfa WHERE username = @username');
    matched++;
    if (isShishi) shishi++;
    if (isYanfa) yanfa++;
    if (isShishi && isYanfa) both++;
    console.log('回填:', s.xingming, '→', username, '实施=' + isShishi, '研发=' + isYanfa);
  }

  // 4. 汇总
  const chk = await pool.request().query("SELECT SUM(isShishi) AS s, SUM(isYanfa) AS y FROM sys_user WHERE isShishi = 1 OR isYanfa = 1");
  console.log('---');
  console.log('匹配回填:', matched, '人 | 实施:', shishi, '研发:', yanfa, '双角色:', both);
  console.log('sys_user 中实施人员总数:', chk.recordset[0].s || 0, '研发人员总数:', chk.recordset[0].y || 0);
  await pool.close();
})().catch(e => { console.error('失败:', e.message); process.exit(1); });
