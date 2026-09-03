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
    rollupOptions: { output: { entryFileNames: 'assets/index-[hash].js' } }
  }
})
