<template>
  <div class="page-about">
    <yd-navbar title="提现" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <div class="integral-top">
      <div class="total">
        <p>我的余额</p>
        <yd-countup class="number" :endnum="integral" duration="2"></yd-countup>
        <p class="duihuan">可兑换<span style="color: #ff7c81;margin: 0 5px;">0</span>元</p>
      </div>
    </div>
    <div class="my-form-box">
      <ul class="my-form-list">
        <li>
          <i class="icon iconfont iconwode"></i>
          <yd-input v-model="query.account" placeholder="请输入真实姓名"></yd-input>
        </li>
        <li>
          <i class="icon iconfont iconyinxingqia"></i>
          <yd-input v-model="query.money" placeholder="请输入银行卡号"></yd-input>
        </li>
        <li>
          <i class="icon iconfont iconyinxingqia"></i>
          <yd-input v-model="query.money" placeholder="请输入银行名称"></yd-input>
        </li>
        <li>
          <i class="icon iconfont icongoumai"></i>
          <yd-input v-model="query.money" placeholder="请输入提现金额"></yd-input>
        </li>
        <li>
          <i class="icon iconfont iconmima"></i>
          <yd-input v-model="query.money" placeholder="请输入提现密码"></yd-input>
        </li>
      </ul>
      <p class="tips">提现时间中午12点-晚上12点</p>
      <button class="btn">提交申请</button>
    </div>
  </div>
</template>

<script>
    export default {
        name: "Withdrawal",
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
.tips{
  margin-top:15px ;
  color: red;
  text-align: center;
  font-size: 12px;
}
</style>
