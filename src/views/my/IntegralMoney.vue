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
        <p class="msg" style="color: red;font-size: 10px;margin-top: 2px;">
          注意：1元等于<span v-text="baseNumber">2</span>积分
        </p>
      </div>
    </div>
    <div class="my-form-box">
      <ul class="my-form-list">
        <li>
          <i class="icon iconfont icongoumai"></i>
          <yd-input v-model="form.number" placeholder="请输入金额"></yd-input>
        </li>
      </ul>
      <button class="btn" @click="confirmBtn">充值</button>
    </div>
  </div>
</template>

<script>
    import {queryAppSetup, integralDuiH} from '@/api/my'

    export default {
        name: "IntegralExchange",
        data() {
            return {
                integral: this.$store.getters.integral ? this.$store.getters.integral : 0,
                baseNumber: '',
                form: {
                    number: ''
                }
            }
        },
        mounted() {
            this.load()
        },
        methods: {
            load() {
                queryAppSetup().then(res => {
                    if (res.resultCode == 1) {
                        this.baseNumber = res.resultBody.integral
                    }
                })
            },
            confirmBtn() {
                let termList = {
                    type: 0,//0是充值积分，1是积分兑换金额
                    userid: this.$store.getters.userId,
                    number: this.form.number
                }
                integralDuiH(termList).then(res => {
                    if (res.resultCode == 1) {
                        this.integral= res.resultBody.integral
                        this.$store.commit('SET_INTEGRAL',res.resultBody.integral)
                        this.$dialog.toast({
                            mes:'充值成功'
                        })
                    }

                })
            }
        }
    }
</script>
<style scoped>

</style>
