<template>
    <div class="page-home home-wrap">
     <!-- <div class="lb-canvas-back-wrap">
        <vue-particles
          class="lb-canvas-box"
          color="#9CD9F9"
          :particleOpacity="0.7"
          :particlesNumber="300"
          shapeType="circle"
          :particleSize="4"
          linesColor="#9CD9F9"
          :linesWidth="1"
          :lineLinked="true"
          :lineOpacity="0.4"
          :linesDistance="150"
          :moveSpeed="2"
          :hoverEffect="true"
          hoverMode="grab"
          :clickEffect="true"
          clickMode="push"
        >
        </vue-particles>
      </div>-->
      <div class="login-box">
        <div class="login-banner">
          <img src="@/assets/images/logo.png"/>
        </div>
        <div class="login-form">
          <ul class="login-list">
            <li>
              <img class="icon" src="@/assets/images/icon_tel.png"/>
              <yd-input v-model="query.username" placeholder="请输入手机号或者邮箱"></yd-input>
            </li>
          </ul>
          <button class="login-btn" @click="bindBtn()">立即绑定</button>
        </div>
      </div>
      <yd-tabbar fixed active-color="#56b3f6">
        <yd-tabbar-item title="首页" link="/" >
          <yd-icon name="home" slot="icon" size="1.5rem"></yd-icon>
        </yd-tabbar-item>
        <yd-tabbar-item title="购买" link="/my/money" >
          <yd-icon name="shopcart" slot="icon" size="1.5rem"></yd-icon>
        </yd-tabbar-item>
        <yd-tabbar-item title="账户" link="/my">
          <yd-icon name="ucenter-outline" slot="icon" size="1.5rem"></yd-icon>
        </yd-tabbar-item>
        <yd-tabbar-item title="交易" link="#" active>
          <yd-icon name="discount" slot="icon" size="1.5rem"></yd-icon>
        </yd-tabbar-item>
      </yd-tabbar>
    </div>
</template>

<script>
    import {saveOrUpdateCoin} from '@/api/common/user'
    export default {
        name: "trade",
        data() {
            return {
                query: {
                    username: '',
                },
            }
        },
        methods: {
            bindBtn() {
                if (!this.query.username) {
                    this.$dialog.toast({
                        mes: '请输入手机号或者邮箱'
                    })
                    return
                }
                /*this.$dialog.loading.open('加载中...');*/
                let params = {
                    username: this.query.username,
                    userid:this.$store.getters.userId
                }
                saveOrUpdateCoin(params).then(response => {
                    if (response.resultCode == 1) {
                    }
                })
            },

        }
    }
</script>

<style scoped>
  .home-wrap{
    height: 100%;
    background: url(/static/images/bg.jpg)no-repeat;
    background-size: 100% 100%;
    position: relative;
    /*background: linear-gradient(top, #37A6F5, #8DCDFA);
    background: -webkit-linear-gradient(top, #37A6F5, #8DCDFA);
    background: -o-linear-gradient(top, #37A6F5, #8DCDFA);
    background: -moz-linear-gradient(top, #37A6F5, #8DCDFA);*/
    display: flex;
    align-items: center;
  }
  .login-box{
    margin-top: 100px;
    height: 400px;
  }
</style>
