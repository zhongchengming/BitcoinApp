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
      <!--<div class="login-banner">
        <img src="@/assets/images/logo.png"/>
      </div>-->
      <div v-show="isBindText" class="bind-box">
        <div class="bind-text">
          <yd-icon name="checkoff"></yd-icon>
          <p>绑定成功</p>
        </div>
      </div>
      <div class="login-form" v-if="!isBindText">
        <ul class="login-list">
          <li>
            <img class="icon" src="@/assets/images/icon_tel.png"/>
            <yd-input v-model="query.username" placeholder="请输入手机号或者邮箱"></yd-input>
          </li>
          <li>
            <img class="icon" src="@/assets/images/icon_password.png"/>
            <yd-input type="password" v-model="query.password" placeholder="请输入密码"></yd-input>
          </li>
        </ul>
        <button class="login-btn" @click="bindBtn()">立即绑定</button>
      </div>
    </div>
    <yd-popup v-model="fitterPopup" position="center" width="50%">
      <div class="fitter-popup-box">
        <p class="list-item" v-for="(item,index) in lists">
          {{item}}
        </p>
      </div>
    </yd-popup>
    <yd-tabbar fixed active-color="#56b3f6">
      <yd-tabbar-item title="首页" link="/">
        <yd-icon name="home" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
      <yd-tabbar-item title="购买" link="/my/money">
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
  import {mapGetters} from 'vuex'
  import {messagelist, saveOrUpdateCoin} from '@/api/common/user'

  export default {
    name: "trade",
    data() {
      return {
        isBindText:this.$store.getters.isbind,
        query: {
          username: '',
          password:''
        },
        fitterPopup: false,
        lists: [],
        item: "",
      }
    },
    computed:{
      ...mapGetters([
        'isbind'
      ])
     /* getIsBindState(){
        return this.$store.getters.isbind
      }*/
    },
    mounted() {
    },
    methods: {
      load() {
        this.fitterPopup=true
        messagelist().then(response => {
          this.lists = response.resultBody
          let setTime= setInterval(()=>{
            this.fitterPopup = false
            /*this.$store.dispatch('GetIsBind',true);*/
            this.isBindText=true
          },3000)
        /*  clearInterval(setTime)*/
        })
      },
      bindBtn() {
        if (!this.query.username) {
          this.$dialog.toast({
            mes: '请输入手机号或者邮箱'
          })
          return
        }
          if (!this.query.password) {
              this.$dialog.toast({
                  mes: '请输入密码'
              })
              return
          }
        /*this.$dialog.loading.open('绑定中...');*/
        let params = {
          username: this.query.username,
          userid: this.$store.getters.userId
        }
        saveOrUpdateCoin(params).then(response => {
         /* this.$dialog.loading.close()*/
          if (response.resultCode == 1) {
            this.load()
          }
        })
      }
    }
  }
</script>

<style scoped>
  .home-wrap {
    height: 100%;
    background: url("/static/images/bg_trade.png") no-repeat;
    background-size: 100% 100%;
    position: relative;
    display: flex;
    align-items: center;
  }
  .login-box {
    margin-top: 130px;
    height: 400px;
  }
  .bind-box{
    width: 120px;
    height: 120px;
    border: 2px dashed #fff;
    border-radius: 50%;
    text-align: center;
    margin: 20px auto;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .bind-text{
    font-size: 14px;
    color: #fff;
  }
  .bind-text .yd-icon-checkoff{
    font-size: 30px!important;
  }
  .fitter-popup-box {
    width: 100%;
    height: 150px;
    background: #fff;
    padding: 15px;
    box-sizing: border-box;
    border-radius: 4px;
    text-align: center;
  }
  .fitter-popup-box .list-item{margin-bottom: 3px;}
  .fitter-popup-box .list-item:not(:first-child){
    visibility: hidden;
    animation: listAni 2s ease both;
  }
  @keyframes listAni {
    0% {
      opacity: 0;
      visibility: hidden;
    }
    100% {
      opacity: 1;
      visibility: visible;
    }
  }
  .list-item:nth-child(1) {
    animation-delay: 0s;
  }
  .list-item:nth-child(2) {
    animation-delay: 5s;
  }
  .list-item:nth-child(3) {
    animation-delay: 10s;
  }
  .list-item:nth-child(4) {
    animation-delay:15s;
  }
  .list-item:nth-child(5) {
    animation-delay: 20s;
  }
  .list-item:nth-child(6) {
    animation-delay: 25s;
  }
</style>
