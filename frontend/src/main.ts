import { createApp } from 'vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import './styles/theme.css'  // 清新简约主题样式
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import App from './App.vue'
import router from './router'

// 应用已保存的界面风格（莫兰迪/浅色/深色）
// 类似于 VB6 中读取 INI 配置加载窗体主题
const savedTheme = localStorage.getItem('themeMode') || 'light'
if (savedTheme === 'light') {
  document.body.classList.add('theme-light')
} else if (savedTheme === 'dark') {
  document.body.classList.add('theme-dark')
}
// morandi 为默认主题，不加 class

// 创建 Vue 应用实例
// 类似于 VB6 中启动应用程序
const app = createApp(App)

// 注册所有 Element Plus 图标组件
// 类似于 VB6 中将控件添加到工具箱
for (const [key, component] of Object.entries(ElementPlusIconsVue)) {
  app.component(key, component)
}

// 使用 Element Plus UI 组件库
app.use(ElementPlus)

// 使用 Vue Router 路由
app.use(router)

// 挂载应用到 index.html 中的 #app 元素
// 类似于 VB6 中显示主窗体
app.mount('#app')
