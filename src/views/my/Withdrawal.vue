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
        <yd-countup class="number" :endnum="moneyBanlance" duration="2"></yd-countup>
      </div>
    </div>
    <div class="my-form-box">
      <ul class="my-form-list">
        <li>
          <i class="icon iconfont iconwode"></i>
          <yd-input v-model="form.realname" placeholder="请输入真实姓名"></yd-input>
        </li>
        <li>
          <i class="icon iconfont iconyinxingqia"></i>
          <yd-input v-model="form.cardno" placeholder="请输入银行卡号"></yd-input>
        </li>
        <li>
          <i class="icon iconfont iconyinxingqia"></i>
          <yd-input v-model="form.bankName" placeholder="请输入银行名称"></yd-input>
        </li>
        <li>
          <i class="icon iconfont icongoumai"></i>
          <yd-input v-model="form.money" placeholder="请输入提现金额"></yd-input>
        </li>
        <!--<li>
          <i class="icon iconfont iconmima"></i>
          <yd-input v-model="query.money" placeholder="请输入提现密码"></yd-input>
        </li>-->
      </ul>
      <p class="tips">提现时间中午12点-晚上12点</p>
      <button class="btn" @click="confirmBtn">提交申请</button>
    </div>
  </div>
</template>

<script>

    import {withdrawalApply} from '@/api/my'
    export default {
        name: "Withdrawal",
      data() {
        return {
          moneyBanlance:this.$store.getters.balance? this.$store.getters.balance : 0,
          form: {
              realname: '',
              cardno:'',
              bankName: '',
              money:''
          }
        }
      },
      methods: {
          confirmBtn() {
              let termList = {
                  userid: this.$store.getters.userId,
                  realname:this.form.realname,
                  cardno:this.form.cardno,
                  bankName: this.form.bankName,
                  money:this.form.money
              }
              withdrawalApply(termList).then(res => {})
          }
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
