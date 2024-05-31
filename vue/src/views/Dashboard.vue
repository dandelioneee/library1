<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="6" v-for="item in cards" :key="item.title">
        <el-card class="box-card">
          <div slot="header" class="clearfix">{{ item.title }}</div>
          <div class="text item">
            <svg class="icon" aria-hidden="true">
              <use :xlink:href="item.icon" style="width: 100px"></use>
            </svg>
            <span class="text">{{ item.data }}</span>
          </div>
        </el-card>
      </el-col>
    </el-row>
    <div id="myTimer" style="margin-left: 15px;font-weight: 550;"></div>
    <!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
    <div id="main" style="margin-left: 5px"></div>
  </div>
</template>

<script>
import * as echarts from 'echarts'
import {ElMessage} from "element-plus";
import request from "../utils/request";

export default {
  data() {
    return {
      cards: [
        { title: '已借阅', data: 100, icon: '#iconlend-record-pro' },
        { title: '总访问', data: 100, icon: '#iconvisit' },
        { title: '图书数', data: 100, icon: '#iconbook-pro' },
        { title: '用户数', data: 1000, icon: '#iconpopulation' }
      ],
      timer: null // 添加一个变量用于存储定时器的引用
    }
  },
  mounted() {
    this.circleTimer()

    request.get("/dashboard").then(res=>{
      if(res.code == 0)
      {
        this.cards[0].data = res.data.lendRecordCount
        this.cards[1].data = res.data.visitCount
        this.cards[2].data = res.data.bookCount
        this.cards[3].data = res.data.userCount

        // 初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'))

        // 绘制图表
        myChart.setOption({
          title: {
            text: '统计'
          },
          tooltip: {
            trigger: 'axis'
          },
          grid: {
            left: '3%',
            right: '4%',
            bottom: '3%',
            containLabel: true
          },
          xAxis: {
            type: 'category',
            data: this.cards.map(item => item.title),
            axisTick: {
              alignWithLabel: true
            }
          },
          yAxis: {
            type: 'value'
          },
          series: [
            {
              type: 'bar',
              label: { show: true },
              barWidth: '25%',
              data: this.cards.map(item => ({
                value: item.data,
                itemStyle: { color: item.color }
              }))
            }
          ]
        })

        window.addEventListener('resize', () => {
          myChart.resize()
        })
      }
      else
      {
        ElMessage.error(res.msg)
      }
    })
  },
  beforeUnmount() {
    // 在组件销毁前清除定时器
    if (this.timer) {
      clearInterval(this.timer)
    }
  },
  methods: {
    circleTimer() {
      this.getTimer()
      this.timer = setInterval(() => {
        this.getTimer()
      }, 1000)
    },
    getTimer() {
      var d = new Date()
      var t = d.toLocaleString()
      document.getElementById('myTimer').innerHTML = t
    }
  }
}
</script>

<style scoped>
.box-card {
  width: 80%;
  margin-bottom: 25px;
  margin-left: 10px;
}

.clearfix {
  text-align: center;
  font-size: 15px;
}

.text {
  text-align: center;
  font-size: 24px;
  font-weight: 700;
  vertical-align: super;
}

#main {
  width: 100%;
  height: 450px;
  margin-top: 20px;
}

.icon {
  width: 50px;
  height: 50px;
  padding-top: 5px;
  padding-right: 10px;
}
</style>
