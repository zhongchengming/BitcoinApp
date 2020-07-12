<template>
  <div class="page-about">
    <yd-navbar title="提现记录" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
      <div class="container">
        <p v-if="noData" class="no-data">暂无数据</p>
        <template v-else>
          <van-list
            v-model="loading"
            :finished="finished"
            finished-text="没有更多了数据了"
            @load="onLoad"
          >
            <ul class="money-record">
              <li class="p-order-item" v-for="item,index in myList" :key="index">
                <div class="title row">
                  <p class="no">
                    <span class="name">真实姓名：</span>
                    <span v-text="item.realname">202006292154067460</span>
                  </p>
                  <span class="state">{{item.state==0?'审核中':item.state==1?'提现成功':''}}</span>
                </div>
                <div class="msg">
                  <p>
                    <span class="name">收款银行：</span>
                    <span v-text="item.bankname">中国农业银行</span>
                  </p>
                  <p>
                    <span class="name">银行卡号：</span>
                    <span v-text="item.bankno">6228480318401674276</span>
                  </p>
                  <p>
                    <span class="name">申请时间：</span>
                    <span v-text="item.createtime">2018-07-08 15:13:14</span>
                  </p>
                  <p>
                    <span class="name">金额：</span>
                    <span class="price">￥<i v-text="item.money">1000</i></span>
                  </p>
                </div>
              </li>
            </ul>
          </van-list>
        </template>
      </div>
    </van-pull-refresh>
  </div>
</template>

<script>
  import {withdrawalHistroy} from '@/api/my'
  export default {
    name: "WithdrawalRecord",
    data() {
        return {
            page: 1,
            loading: false, // 当loading为true时，转圈圈
            finished: false, // 数据是否请求结束，结束会先显示- 没有更多了 -
            myList:[],
            noData: false, // 如果没有数据，显示暂无数据
            isLoading:false // 下拉的加载图案
        }
    },
      mounted() {
          this.load()
      },
      methods:{
          load() {
              this.loading = true
              let params = {
                  userid:this.$store.getters.userId,
                  pageSize: 10,
                  pageNumber: this.page
              }
              withdrawalHistroy(params).then(res => {
                  let dataArr=res.resultBody.list
                  if (res.resultCode == 1) {
                      this.loading = false
                      this.myList = this.myList.concat(dataArr)
                      this.page++
                      // 如果没有数据，显示暂无数据
                      if (this.myList.length === 0) {
                          this.noData = true
                      }
                      // 如果加载完毕，显示没有更多了
                      if (dataArr.length === 0) {
                          this.finished = true
                      }
                  }
              })
          },
          // 列表加载
          onLoad() {
              setTimeout(() => {
                  this.load()
                  this.loading = true
              }, 500)
          },
          onRefresh() {
              setTimeout(() => {
                  // 重新初始化这些属性
                  this.isLoading = false
                  this.myList = []
                  this.page = 1
                  this.loading = false
                  this.finished = false
                  this.noData = false
                  // 请求信息
                  this.load()
              }, 500)
          }
    }
  }
</script>

<style scoped>
  .no-data{
    color: #666;
    font-size: 20px;
    margin-top: 70px;
    text-align: center;
  }
  .row {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }
  .p-order-item {
    padding: 10px 12px;
    background: #fff;
    font-size: 13px;
    color: #333;
    margin: 10px 0;
  }
  .p-order-item .no {
    font-size: 14px;
    color: #333;
    font-weight: bold;
  }
  .p-order-item .name {margin-right: 3px;}
  .p-order-item .msg {padding: 10px 5px;}
  .p-order-item .msg p {margin-bottom: 5px;}
  .p-order-item .price {color: #FE4444;}
  .p-order-item .state {color: #37A6F5}
</style>
