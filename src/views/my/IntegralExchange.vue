<template>
  <div class="page-about">
    <yd-navbar title="积分兑换" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <div class="integral-top">
      <div class="total">
        <p>我的积分</p>
        <yd-countup class="number" :endnum="integral" duration="2"></yd-countup>
        <p class="duihuan">可兑换<span style="color: #ff7c81;margin: 0 5px;">0</span>元</p>
      </div>
    </div>
    <div class="my-form-box">
      <ul class="my-form-list">
        <li>
          <i class="icon iconfont icongoumai"></i>
          <yd-input v-model="query.account" placeholder="请输入积分"></yd-input>
        </li>
        <li>
          <i class="icon iconfont iconchongzhijilu"></i>
          <yd-input v-model="query.money" placeholder="请输入金额"></yd-input>
        </li>
      </ul>
      <button class="btn">确认兑换</button>
    </div>
  </div>
</template>

<script>

  import api from '@/api'

  export default {
    name: "IntegralExchange",
    data() {
      return {
        integral: 20,
        query: {
          account: '',
          money:''
        }
      }
    },
    methods: {
    }
  }
</script>
<style scoped>

</style>
