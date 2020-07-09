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
      <yd-popup v-model="fitterPopup" position="center" width="50%">
        <div class="fitter-popup-box">
<!--          <p v-for="(item,index) in lists">-->
            {{item}}
<!--          </p>-->
        </div>
      </yd-popup>
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
    import {messagelist, saveOrUpdateCoin} from '@/api/common/user'
    export default {
        name: "trade",
        data() {
            return {
                query: {
                    username: '',
                },
                fitterPopup:false,
                lists:[],
                item:"",
            }
        },
        /*mounted() {
            this.load()
        },*/
        methods: {
            load() {
                messagelist().then(response => {
                    let datalist=response.resultBody
                    let dataArr= []
                    this.fitterPopup = true

                      for (let i = 0; i < datalist.length; i++) {
                          // dataArr.push(datalist[i])

                          setTimeout(function(){
                              this.item+= datalist[i];
                          },1000);

                      }


                    console.log(this.item)
                    /* this.fitterPopup = false*/
                })
            },
            timeOut(){
                setInterval(()=>{
                    console.log(123)
                },5000)
            },
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
    background: url("/static/images/bg_my_index.jpg") no-repeat;
    background-size:100% 100%;
    position: relative;
    display: flex;
    align-items: center;
  }
  .login-box{
    margin-top: 100px;
    height: 400px;
  }
  .fitter-popup-box{
    width: 100%;
    background: #fff;
    padding: 50px;
    border-radius: 4px;
  }
</style>
