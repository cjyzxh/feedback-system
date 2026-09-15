import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import { resolve } from 'path'

export default defineConfig({
  plugins: [vue()],
  resolve: { alias: { '@': resolve(__dirname, 'src') } },
  server: {
    port: 5173,
    // 强制所有响应不缓存，避免浏览器加载旧代码
    headers: {
      'Cache-Control': 'no-store',
      'Pragma': 'no-cache'
    },
    proxy: {
      '/api': {
        target: 'http://localhost:3001',
        changeOrigin: true
      }
    }
  },
  build: {
    rollupOptions: {
      output: {
        entryFileNames: 'assets/index-[hash].js',
        // vendor 分包：框架/UI/图表/请求库各自独立成包，浏览器长期缓存，
        // 业务代码更新后用户只下载 app 包，大幅减少花生壳外网流量与首屏等待
        manualChunks: {
          'vendor-vue': ['vue', 'vue-router'],
          'vendor-element': ['element-plus', '@element-plus/icons-vue'],
          'vendor-echarts': ['echarts'],
          'vendor-axios': ['axios'],
        }
      }
    }
  }
})
