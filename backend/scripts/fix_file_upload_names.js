// 修复已上传文件附件的中文文件名乱码（multer latin1 误读导致）
// 用法: node scripts/fix_file_upload_names.js
// 作用: 扫描 fileUploadPath 目录（database-config.json 配置，默认 ./file-uploads），
//       把 {id}-{序号}#{乱码原文件名} 中的原文件名部分还原为 UTF-8 并重命名。
const fs = require('fs');
const path = require('path');

// 与后端 controller 相同的修复逻辑
function fixName(name) {
  let hasHigh = false;
  for (let i = 0; i < name.length; i++) {
    if (name.charCodeAt(i) > 255) { hasHigh = true; break; }
  }
  if (hasHigh) return name;
  try {
    const fixed = Buffer.from(name, 'latin1').toString('utf8');
    if (fixed.includes('\uFFFD')) return name;
    return fixed;
  } catch {
    return name;
  }
}

function getFileUploadPath() {
  const cfgPath = path.join(__dirname, '..', 'database-config.json');
  try {
    if (fs.existsSync(cfgPath)) {
      const cfg = JSON.parse(fs.readFileSync(cfgPath, 'utf-8'));
      if (cfg.fileUploadPath) return cfg.fileUploadPath;
    }
  } catch (e) {
    console.error('读取 database-config.json 失败:', e.message);
  }
  return './file-uploads';
}

const dir = getFileUploadPath();
const absDir = path.isAbsolute(dir) ? dir : path.join(__dirname, '..', dir);
if (!fs.existsSync(absDir)) {
  console.log('目录不存在:', absDir);
  process.exit(0);
}

const files = fs.readdirSync(absDir);
let fixed = 0;
for (const f of files) {
  const hashIdx = f.indexOf('#');
  if (hashIdx === -1) continue; // 无 # 的文件（非本功能命名）不动
  const prefix = f.substring(0, hashIdx + 1);
  const namePart = f.substring(hashIdx + 1);
  const fixedName = fixName(namePart);
  if (fixedName === namePart) continue;

  let target = prefix + fixedName;
  // 目标已存在时加 _1/_2 后缀避免覆盖
  let suffix = 1;
  while (fs.existsSync(path.join(absDir, target))) {
    const dot = fixedName.lastIndexOf('.');
    if (dot > 0) target = prefix + fixedName.substring(0, dot) + '_' + suffix + fixedName.substring(dot);
    else target = prefix + fixedName + '_' + suffix;
    suffix++;
  }
  fs.renameSync(path.join(absDir, f), path.join(absDir, target));
  console.log(`修复: ${f}  ->  ${target}`);
  fixed++;
}
console.log(`完成，共修复 ${fixed} 个文件。`);
