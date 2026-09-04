/**
 * 版本号递增脚本：每次编译（npm run dev / build）前运行，小版本（末位）自动 +1
 */
const fs = require('fs');
const path = require('path');

const file = path.join(__dirname, '..', 'src', 'version.ts');

let version = '0.0.0';
if (fs.existsSync(file)) {
  const m = fs.readFileSync(file, 'utf8').match(/'([\d.]+)'/);
  if (m) version = m[1];
}

const parts = version.split('.').map(p => parseInt(p, 10) || 0);
while (parts.length < 3) parts.push(0);
parts[2] += 1; // 小版本（末位）+1

const next = parts.join('.');
fs.writeFileSync(file, `export const APP_VERSION = '${next}'\n`, 'utf8');
console.log('[bump-version] 版本: ' + next);
