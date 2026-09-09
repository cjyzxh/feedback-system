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

  for (const col of ['isShishi', 'isYanfa']) {
    const r = await pool.request().query(
      "SELECT COUNT(*) AS n FROM sys.columns WHERE object_id = OBJECT_ID('sys_user') AND name = '" + col + "'"
    );
    if (r.recordset[0].n === 0) {
      await pool.request().query('ALTER TABLE sys_user ADD ' + col + ' int NOT NULL DEFAULT 0');
      console.log('sys_user 已加列:', col);
    } else {
      console.log(col, '已存在，跳过');
    }
  }

  const v = await pool.request().query(
    "SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME='sys_user' AND COLUMN_NAME IN ('isShishi','isYanfa')"
  );
  console.log('当前字段:', v.recordset.map(r => r.COLUMN_NAME).join(', '));
  await pool.close();
})().catch(e => { console.error('失败:', e.message); process.exit(1); });
