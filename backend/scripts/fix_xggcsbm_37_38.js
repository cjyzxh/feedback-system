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
    server: m.DB_HOST || '192.168.2.5', port: Number(m.DB_PORT || 1433),
    user: m.DB_USERNAME || 'SA', password: m.DB_PASSWORD || '1',
    database: m.DB_DATABASE || 'New_WTFK',
    options: { encrypt: false, trustServerCertificate: true }
  });
  const r = await pool.request().query(
    "UPDATE f SET f.xggcsBM = u.username FROM yw_wentilb f INNER JOIN sys_user u ON u.realName = f.xggcs WHERE (f.xggcsBM IS NULL OR f.xggcsBM = '') AND f.xggcs IS NOT NULL AND f.xggcs <> N''"
  );
  console.log('回填 xggcsBM:', r.rowsAffected[0], '条');
  const chk = await pool.request().query('SELECT ID, xggcs, xggcsBM FROM yw_wentilb WHERE ID IN (37,38)');
  chk.recordset.forEach(x => console.log(JSON.stringify(x)));
  await pool.close();
})().catch(e => { console.error('失败:', e.message); process.exit(1); });
