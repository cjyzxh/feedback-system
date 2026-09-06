/**
 * 生成编译变更清单：每次 npm run build 后自动运行。
 * 1) 基于 Git 差异对比「上次编译基线」与当前工作区，生成单次变更清单 md
 * 2) 将本次变更追加到本地累积「升级记录.md」，便于后期核对/查看
 */
const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const root = path.join(__dirname, '..', '..'); // 项目根 New_wtfk
const stateFile = path.join(root, 'changelog-state.json');
// 归档规则：变更清单/升级记录统一输出到 docs/文档（用户约定，见项目根 AGENTS.md）
const outDir = path.join(root, 'docs', '文档');

// 当前版本号
const vFile = path.join(__dirname, '..', 'src', 'version.ts');
const ver = (fs.readFileSync(vFile, 'utf8').match(/'([\d.]+)'/) || [, '0.0.0'])[1];

// 当前 HEAD
let head = '';
try { head = execSync('git rev-parse HEAD', { cwd: root, encoding: 'utf8' }).trim(); } catch (e) { head = 'unknown'; }

// 读取上次编译基线
let state = {};
try { state = JSON.parse(fs.readFileSync(stateFile, 'utf8')); } catch (e) {}
const base = state.lastHead || head;

const run = (cmd) => { try { return execSync(cmd, { cwd: root, encoding: 'utf8' }); } catch (e) { return (e.stdout || '') + (e.stderr || ''); } };

const nameOnly = run(`git diff --name-only ${base}`).split('\n').filter(Boolean);
const stat = run(`git diff --stat ${base}`).trim();
const isFirst = !state.lastHead;

if (!fs.existsSync(outDir)) fs.mkdirSync(outDir, { recursive: true });
const now = new Date();
const time = now.toLocaleString('zh-CN', { hour12: false });
const dateStr = `${now.getFullYear()}-${String(now.getMonth() + 1).padStart(2, '0')}-${String(now.getDate()).padStart(2, '0')}`;

/* ---------- 1. 单次变更清单 ---------- */
let md = `# 编译变更清单  v${ver}\n\n`;
md += `- 编译时间：${time}\n`;
md += `- 基线：\`${base}\`  →  当前：\`${head}\`\n`;
md += `- 说明：${isFirst ? '首次生成，基线=当前提交（列出其后的所有未提交改动）' : '对比上次编译基线，列出期间的改动'}\n`;
md += `- 变更文件数：${nameOnly.length}\n\n`;
md += `## 变更文件统计\n\n\`\`\`\n${stat || '(无变更)'}\n\`\`\`\n\n`;
md += `## 变更文件明细\n\n`;
if (nameOnly.length) {
  nameOnly.forEach(f => { md += `- \`${f}\`\n`; });
} else {
  md += `（无文件变更）\n`;
}
md += `\n---\n*本清单由 frontend/scripts/gen-changelog.cjs 在编译后自动生成。*\n`;

const outFile = path.join(outDir, `变更清单-v${ver}.md`);
fs.writeFileSync(outFile, md, 'utf8');

/* ---------- 2. 累积升级记录 ---------- */
const historyFile = path.join(outDir, '升级记录.md');
let history = '';
if (fs.existsSync(historyFile)) {
  history = fs.readFileSync(historyFile, 'utf8');
}

// 该版本已记录则不重复追加（按版本号判断，防止重复编译/测试时重复写入）
if (!history.includes(`## v${ver}（`)) {
  const entry = `## v${ver}（${dateStr}）\n\n` +
    `- 编译时间：${time}\n` +
    `- 变更文件数：${nameOnly.length}\n` +
    `- 变更文件明细：\n` +
    (nameOnly.length ? nameOnly.map(f => `  - \`${f}\``).join('\n') : '  -（无文件变更）') +
    `\n\n---\n\n`;

  if (!history.startsWith('# 系统升级记录')) {
    history = `# 系统升级记录\n\n${entry}`;
  } else {
    // 新版本插入到最新版本之前（顶部）
    const idx = history.indexOf('## ');
    history = history.slice(0, idx) + entry + history.slice(idx);
  }
  fs.writeFileSync(historyFile, history, 'utf8');
  console.log('[gen-changelog] 升级记录已更新: ' + historyFile);
}

// 更新基线为当前 HEAD
state.lastHead = head;
state.lastVersion = ver;
fs.writeFileSync(stateFile, JSON.stringify(state, null, 2), 'utf8');

console.log('[gen-changelog] 变更清单已生成: ' + outFile);
