<template>
  <div class="home-wrap">
    <div class="lb-canvas-back-wrap">
      <vue-particles
        class="lb-canvas-box"
        color="#9CD9F9"
        :particleOpacity="0.6"
        :particlesNumber="280"
        shapeType="circle"
        :particleSize="4"
        linesColor="#dedede"
        :linesWidth="1"
        :lineLinked="true"
        :lineOpacity="0.4"
        :linesDistance="150"
        :moveSpeed="3"
        :hoverEffect="true"
        hoverMode="grab"
        :clickEffect="true"
        clickMode="push"
      >
      </vue-particles>
    </div>
    <div class="login-box">
      <div class="login-banner">
         <img src="@/assets/images/logo.png"/>
       </div>
      <div class="login-form">
        <ul class="login-list">
          <li>
            <img class="icon" src="@/assets/images/icon_user.png"/>
            <yd-input v-model="query.username" placeholder="请输入用户名/手机号"></yd-input>
          </li>
          <li>
            <img class="icon" src="@/assets/images/icon_password.png"/>
            <yd-input type="password" v-model="query.password" placeholder="请输入密码"></yd-input>
          </li>
          <li>
            <img class="icon" src="@/assets/images/icon_code.png"/>
            <div class="right">
              <yd-input type="text" v-model="query.code" placeholder="请输入验证码"></yd-input>
              <div class="code-wrap" @click="changeCode()">
                <identify :identifyCode="identifyCode"></identify>
              </div>
            </div>
          </li>
        </ul>
        <button class="login-btn" @click="login()">立即登录</button>
        <button class="login-btn sign-btn" @click="goSign()">我还没有账号 马上注册</button>
      </div>
    </div>
  </div>
</template>

<script>
    import identify from "@/components/identify"
    export default {
        name: "login",
        components: {
            identify
        },
        data() {
            return {
                /*width:null,
                height:null,
                largeHeader:null,
                canvas:null,
                ctx:null,
                points:null,
                target: null,
                animateHeader: true,*/
                RAF :null,
                canvas :null,
                ctx:null,
                warea:null,
                dots :[],
                len  :300,
                query: {
                    username: '',
                    password: '',
                    code: ''
                },
                // 验证码初始值
                identifyCode: 'm6a8',
                // 验证码的随机取值范围
                identifyCodes: '123456789abcdefghjkmnpqrstuvwxyz',
            }
        },
        mounted() {
            // 刷新页面就生成随机验证码
            this.identifyCode = ''
            this.makeCode(this.identifyCodes, 4)
        },
        methods: {
            // 点击验证码刷新验证码
            changeCode() {
                this.identifyCode = ''
                this.makeCode(this.identifyCodes, 4)
            },
            // 生成一个随机整数  randomNum(0, 10) 0 到 10 的随机整数， 包含 0 和 10
            randomNum(min, max) {
                max = max + 1
                return Math.floor(Math.random() * (max - min) + min)
            },
            // 随机生成验证码字符串
            makeCode(data, len) {
                for (let i = 0; i < len; i++) {
                    this.identifyCode += data[this.randomNum(0, data.length - 1)]
                }
            },
            login() {
                if (!this.query.username) {
                    this.$dialog.toast({
                        mes: '请输入用户名/手机号'
                    })
                    return
                }
                if (!this.query.password) {
                    this.$dialog.toast({
                        mes: '请输入密码'
                    })
                    return
                }
                if (!this.query.code) {
                    this.$dialog.toast({
                        mes: '请输入验证码'
                    })
                    return
                }
                if (this.identifyCode != this.query.code) {
                    this.$toast("验证码不正确");
                    this.changeCode();// 改变验证码
                    return
                }
                this.$dialog.loading.open('加载中...');
                this.$store.dispatch("Login", this.query).then((response) => {
                    console.log(response)
                    this.$dialog.loading.close()
                    if (response.resultCode == 1) {
                        this.$router.push('/')
                        console.log(this.$store.state.user.userId)
                    }
                }, () => {
                    this.$dialog.loading.close()
                })
            },
            goSign() {
                this.$router.push('/registered')
            }
        }
    }
</script>

<style scoped>
  .home-wrap{
    height: 100%;
    background: url(/static/images/bg.jpg)no-repeat;
    background-size: 100% 100%;
    position: relative;
  }
  .lb-canvas-back-wrap{
    position: fixed;
    top: 0;
    left: 0;
    bottom: 0;
    right: 0;
    height: 100%;
    width: 100%;
    z-index: 2;
  }
  .lb-canvas-back-wrap .lb-canvas-box{
    height: 100%;
    width: 100%;
    opacity: .4;
  }
</style>
