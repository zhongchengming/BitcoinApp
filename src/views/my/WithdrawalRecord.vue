<template>
  <div class="page-about">
    <yd-navbar title="提现记录" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <van-pull-refresh v-model="refreshing" @refresh="onRefresh">
      <van-list
        v-model="loading"
        :finished="finished"
        finished-text="没有更多了"
        @load="onLoad"
      >
        <ul class="money-record">
          <li class="p-order-item" v-for="item,index in list" :key="index">
            <div class="title row">
              <p class="no">
                <span class="name">订单编号：</span>
                <span v-text="item.number">202006292154067460</span>
              </p>
              <span class="state" v-text="item.state">已撤销</span>
            </div>
            <div class="msg">
              <div class="row">
                <p>
                  <span class="name">充值方式：</span>
                  <span v-text="item.moneyType">会员转账</span>
                </p>
                <p>
                  <span class="name">收 款 人：</span>
                  <span v-text="item.username">会员转账</span>
                </p>
              </div>
              <p>
                <span class="name">收款银行：</span>
                <span v-text="item.cardName">中国农业银行</span>
              </p>
              <p>
                <span class="name">收款账号：</span>
                <span v-text="item.card">6228480318401674276</span>
              </p>
              <p>
                <span class="name">充值时间：</span>
                <span v-text="item.time">2018-07-08 15:13:14</span>
              </p>
              <p>
                <span class="name">充值金额：</span>
                <span class="price">￥<i v-text="item.money">1000</i></span>
              </p>
            </div>
          </li>
          <ul>
          </ul>
        </ul>
      </van-list>
    </van-pull-refresh>
  </div>
</template>

<script>
  export default {
    name: "WithdrawalRecord",
    data() {
      return {
        loading: false,
        finished: false,
        refreshing: false,
        list: [
          {
            number: '202006292154067460',
            moneyType: '会员转账',
            money: '1000',
            time: '2020-06-29 21:54:06',
            cardName: '中国农业银行',
            card: '6228480318401674276',
            username: '董梦强',
            state: '已撤销'
          },
          {
            number: '202006292154067460',
            moneyType: '会员转账',
            money: '1000',
            time: '2020-06-29 21:54:06',
            cardName: '中国农业银行',
            card: '6228480318401674276',
            username: '董梦强',
            state: '已撤销'
          },
          {
            number: '202006292154067460',
            moneyType: '会员转账',
            money: '1000',
            time: '2020-06-29 21:54:06',
            cardName: '中国农业银行',
            card: '6228480318401674276',
            username: '董梦强',
            state: '已撤销'
          },
          {
            number: '202006292154067460',
            moneyType: '会员转账',
            money: '1000',
            time: '2020-06-29 21:54:06',
            cardName: '中国农业银行',
            card: '6228480318401674276',
            username: '董梦强',
            state: '已撤销'
          }
        ]
      }
    },
    methods:{
      onLoad() {
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
      }
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
