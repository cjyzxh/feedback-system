// 临时排查脚本：查跟进人 cjyzxh 的全部问题记录，对比报表统计差异
const sql = require('mssql')
const config = {
  server: '192.168.2.5',
  port: 1433,
  user: 'SA',
  password: '1',
  database: 'New_WTFK',
  options: { encrypt: false, trustServerCertificate: true }
}

async function main() {
  const pool = await sql.connect(config)
  const r = await pool.request().query(
    `SELECT ID, lvrusj, cssj, gongchengsbz, shouhoubz, taolunbz, shishiry, shishiryBM
     FROM yw_wentilb WHERE shishiryBM = 'cjyzxh' ORDER BY lvrusj DESC`
  )
  console.log('=== 全部记录 (' + r.recordset.length + ' 条) ===')
  r.recordset.forEach(row => {
    const lv = row.lvrusj ? new Date(row.lvrusj).toISOString().slice(0, 19) : '-'
    const cs = row.cssj ? new Date(row.cssj).toISOString().slice(0, 19) : '-'
    const last30 = row.lvrusj && (Date.now() - new Date(row.lvrusj).getTime()) <= 30 * 24 * 3600 * 1000
    console.log(
      `ID=${row.ID} 录入=${lv} 测试=${cs} gongchengsbz=${row.gongchengsbz} shouhoubz=${row.shouhoubz} taolunbz=${row.taolunbz} shishiry=${row.shishiry} 近30天=${last30 ? '是' : '否'}`
    )
  })
  const cnt = await pool.request().query(`SELECT COUNT(*) AS cnt FROM yw_wentilb WHERE shishiryBM = 'cjyzxh'`)
  console.log('总数:', cnt.recordset[0].cnt)
  await pool.close()
}

main().catch(e => { console.error(e); process.exit(1) })
