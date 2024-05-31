import { createApp } from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import '@/assets/css/global.css'

import zhCn from 'element-plus/es/locale/lang/zh-cn'
import ElementPlus from 'element-plus'
import 'element-plus/dist/index.css'
import '@/assets/icon/iconfont.js' // 图标
import '@/assets/icon/iconfont.css'
const app =createApp(App)
import * as ElIconModules from '@element-plus/icons'
// main.js 或 main.ts
import axios from 'axios';

// 设置全局的Content-Type头为text/plain
axios.interceptors.request.use(config => {
    if (config.method === 'post') {
        config.headers['Content-Type'] = 'text/plain';
    }
    return config;
}, error => {
    // 请求错误处理
    return Promise.reject(error);
});
for(let iconName in ElIconModules){
    app.component(iconName,ElIconModules[iconName])
}
app.use(store).use(router).use(ElementPlus,{locale: zhCn,size:"small"}).mount('#app')
