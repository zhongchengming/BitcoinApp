<template>
  <div>
    <div class="login-banner">
      <img src="@/assets/images/logo.png"/>
    </div>
    <div class="login-box">
      <div class="login-form">
        <ul class="login-list">
          <li>
            <img class="icon" src="@/assets/images/icon_user.png"/>
            <yd-input type="text" v-model="query.username" placeholder="请输入用户名"></yd-input>
          </li>
          <li>
            <img class="icon" src="@/assets/images/icon_password.png"/>
            <yd-input type="password" v-model="query.password" placeholder="请输入密码"></yd-input>
          </li>
          <li>
            <img class="icon" src="@/assets/images/icon_code.png"/>
            <yd-input type="text" v-model="query.invitationcode" placeholder="请输入邀请码"></yd-input>
          </li>
          <li>
            <img class="icon" src="@/assets/images/icon_code.png"/>
            <div class="right">
              <yd-input type="text" class="code" v-model="query.code" placeholder="请输入验证码"></yd-input>
              <div class="code-wrap" @click="changeCode()">
                <identify :identifyCode="identifyCode"></identify>
              </div>
            </div>
          </li>
        </ul>
        <button class="login-btn" @click="gosign()">立即注册</button>
        <button class="login-btn sign-btn" @click="gologin()">我已有账号 马上登录</button>
      </div>
    </div>
  </div>
</template>

<script>
 /* import api from '@/api'
  import {mapGetters} from 'vuex'*/
 import identify from "@/components/identify"
 import {register} from '@/api/login'

  export default {
    name: "register",
    components: {
        identify
    },
    data() {
      return {
        query: {
          username: '',
          password: '',
          code: '',
          invitationcode: '',
        },
        // 验证码初始值
        identifyCode: 'm6a8',
        // 验证码的随机取值范围
        identifyCodes: '123456789abcdefghjkmnpqrstuvwxyz'
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
      gosign() {
        if (!this.query.username) {
          this.$dialog.toast({
            mes: '用户名不能为空'
          })
          return
        }
        if (!this.query.password) {
          this.$dialog.toast({
            mes: '密码不能为空'
          })
          return
        }
        if (!this.query.invitationcode) {
          this.$dialog.toast({
            mes: '邀请码不能为空'
          })
          return
        }
        if (!this.query.code) {
          this.$dialog.toast({
            mes: '验证码不能为空'
          })
          return
        }
        this.$dialog.loading.open('加载中...');
          register(this.query).then(response => {
          this.$dialog.loading.close()
          if (response.resultCode == 1) {
              this.$router.push('/login')
              this.$dialog.loading.close()
          }
        },()=>{
          this.$dialog.loading.close()
        })
      },
      gologin() {
        this.$router.push('/login')
      }
    }
  }
</script>

<style scoped>
  .right {
    position: relative;
  }

  .sex {
    width: 100px;
    font-size: 14px;
    color: #999;
  }

  .select-date {
    position: absolute;
    top: 0;
    left: 0;
    width: 100px;
    z-index: 1;
    font-size: 14px;
    color: #999;
    height: 19px;
    line-height: 19px;
    display: block;
  }

  .icon-date {
    position: absolute;
    top: 0;
    right: 0;
    width: 19px;
    z-index: 1;
    height: 19px;
    line-height: 19px;
    display: block;
  }

  .hregister-info {
    padding: 35px 0;
    font-size: 17px;
    color: #333;
    text-align: center;
  }

  .r-footer-btn {
    display: flex;
  }

  .r-footer-btn button {
    background: #37A6F5;
    display: inline-block;
    width: 50%;
    text-align: center;
    height: 44px;
    line-height: 44px;
    color: #fff;
  }

  .r-footer-btn .cancel-btn {
    color: #666;
    background: #eee;
  }
</style>
