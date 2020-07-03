<template>
  <div class="page-about">
    <yd-navbar title="提现记录" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <!--<van-pull-refresh v-model="refreshing" @refresh="onRefresh">
      <van-list
        v-model="loading"
        :finished="finished"
        finished-text="没有更多了"
        @load="onLoad"
      >-->
        <ul class="money-record">
          <li class="p-order-item" v-for="item,index in lists" :key="index">
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
    <!--  </van-list>
    </van-pull-refresh>-->
  </div>
</template>

<script>
  import {withdrawalHistroy} from '@/api/my'
  export default {
    name: "WithdrawalRecord",
    data() {
      return {
        loading: false,
        finished: false,
        refreshing: false,
        lists: []
      }
    },
      mounted() {
          this.load()
      },
      methods:{
          load() {
              this.loading = true
              let params={
                  userid:this.$store.getters.userId
              }
              withdrawalHistroy(params).then(res => {
                  if (res.resultCode == 1) {
                      this.lists = res.resultBody
                  }
              })
          }
      /*onLoad() {
        setTimeout(() => {
          if (this.refreshing) {
            this.list = [];
            this.refreshing = false;
          }
          for (let i = 0; i < 5; i++) {
            this.list.push(this.list.length + 1);
          }
          this.loading = false;

          if (this.list.length >= 5) {
            this.finished = true;
          }
        }, 1000);
      },
      onRefresh() {
        // 清空列表数据
        this.finished = false;

        // 重新加载数据
        // 将 loading 设置为 true，表示处于加载状态
        this.loading = false;
        this.onLoad();
      }*/
    }
  }
</script>

<style scoped>
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
