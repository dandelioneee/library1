<template>
  <div style="height: 50px; line-height:50px; border-bottom: 1px solid #ccc; display: flex">
    <div style="width: 300px; padding-left:30px; font-weight: bold; color:lightseagreen">
      <img :src="imgUrl" class="icon" style="width: 50px">
      易财图书管理系统
    </div>
    <div style="flex: 1"></div>
    <div style="width: 200px; display: flex; align-items: center; justify-content: space-between">
      <el-button v-if="computedUser.role === 1" type="primary" @click="exportData" round>导出数据</el-button>
      <el-dropdown>
        <span class="el-dropdown-link">
          {{ computedUser.nickName }} <el-icon class="el-icon--right">
            <arrow-down />
          </el-icon>
        </span>
        <template #dropdown>
          <el-dropdown-menu>
            <el-dropdown-item @click="exit">退出系统</el-dropdown-item>
          </el-dropdown-menu>
        </template>
      </el-dropdown>
    </div>
  </div>
</template>

<script>
import { ElMessage } from "element-plus";
import axios from 'axios';

export default {
  name: "Header",
  props: ['user'],
  data() {
    return {
      imgUrl: require("../assets/icon/login2.png")
    };
  },
  computed: {
    computedUser() {
      return JSON.parse(sessionStorage.getItem("user") || "{}");
    }
  },
  methods: {
    exit() {
      sessionStorage.removeItem("user");
      this.$router.push("/login");
      ElMessage.success("退出系统成功");
    },
    exportData() {
      axios({
        url: 'http://localhost:9090/report/export',
        method: 'GET',
        responseType: 'blob'
      })
        .then(response => {
          const url = window.URL.createObjectURL(new Blob([response.data]));
          const link = document.createElement('a');
          link.href = url;
          link.setAttribute('download', 'book_report.xlsx');
          document.body.appendChild(link);
          link.click();
          document.body.removeChild(link);
          ElMessage.success("数据导出成功");
        })
        .catch(error => {
          ElMessage.error("数据导出失败");
          console.error("导出数据失败: ", error.response ? error.response.data : error.message);
        });
    }
  }
}
</script>

<style scoped>
.icon {
  width: 40px;
  height: 40px;
  padding-top: 5px;
  padding-right: 10px;
}
</style>
