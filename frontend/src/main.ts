import { createApp } from 'vue'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import * as ElementPlusIconsVue from '@element-plus/icons-vue'
import App from './App.vue'
import router from './router'

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
