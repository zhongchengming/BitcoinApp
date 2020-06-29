<template>
  <div>
    <div class="login-banner">
      <img src="@/assets/images/logo.png"/>
    </div>
    <div class="login-wrap">
      <div class="login-box">
        <div class="login-form">
          <ul class="login-list">
            <li>
              <img class="icon" src="@/assets/images/icon_user.png"/>
              <yd-input type="text" v-model="query.username" placeholder="请输入用户名"></yd-input>
            </li>
            <li>
              <img class="icon" src="@/assets/images/icon_password.png"/>
              <yd-input type="password" v-model="query.oldPassword" placeholder="请输入密码"></yd-input>
            </li>
            <li>
              <img class="icon" src="@/assets/images/icon_password.png"/>
              <yd-input type="password" v-model="query.oldPasswordConfirm" placeholder="请输入确认密码"></yd-input>
            </li>
            <li>
              <img class="icon" src="@/assets/images/icon_code.png"/>
              <yd-input type="text" v-model="query.yqcode" placeholder="请输入邀请码"></yd-input>
            </li>
            <li>
              <img class="icon" src="@/assets/images/icon_code.png"/>
              <div class="right">
                <yd-input type="text" class="code" v-model="query.code" placeholder="请输入验证码"></yd-input>
                <div class="code-wrap" @click="changeCode">
                  <img :src="imgCode" style="width:84px"/>
                 </div>
                <!--<yd-sendcode class="send-btn" v-model="sendCode"
                             @click.native="sendCode1"
                             init-str="获取验证码"
                             second="60"
                             run-str="重新发送({%s})"
                             reset-str="重新发送"
                             type="warning">
                </yd-sendcode>-->
              </div>
            </li>
          </ul>
          <button class="login-btn" @click="gosign()">立即注册</button>
          <button class="login-btn sign-btn" @click="gologin()">我已有账号 马上登录</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import api from '@/api'
  import {mapGetters} from 'vuex'

  export default {
    name: "register",
    data() {
      return {
        imgCode:'/static/images/code_img.png',
        query: {
          username: '',
          oldPassword: '',
          oldPasswordConfirm: '',
          code: '',
          yqcode: '',
        }
      }
    },
    methods: {
      sendCode() {
        if (!this.query.mobilePhone) {
          this.$dialog.toast({
            mes: '请输入手机号'
          })
          return
        }
        if (!/^((13|14|15|17|18)[0-9]{1}\d{8})$/.test(this.query.mobilePhone)) {
          this.$dialog.toast({
            mes: '手机号格式不正确'
          })
          return
        }
        this.$dialog.loading.open('发送中...');
        setTimeout(() => {
          api.account.sendCode(this.query.mobilePhone).then(response => {
            if (response.code == 200) {
              this.sendMsg = true;
              this.$dialog.loading.close();
              this.$dialog.toast({
                mes: '已发送',
                icon: 'success',
                timeout: 1500
              });
            } else {
              this.$dialog.loading.close();
            }
          })
        }, 1000);
      },
      changeCode(){
        var num=Math.ceil(Math.random()*10);//生成一个随机数（防止缓存）
        this.imgCode = "url?" + num;
      },
      gosign() {
        if (!this.query.username) {
          this.$dialog.toast({
            mes: '用户名不能为空'
          })
          return
        }
        if (!this.query.oldPassword) {
          this.$dialog.toast({
            mes: '密码不能为空'
          })
          return
        }
        if (!this.query.oldPasswordConfirm) {
          this.$dialog.toast({
            mes: '确认密码不能为空'
          })
          return
        }
        if (!this.query.yqcode) {
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
       /* this.preQuery.code = this.query.code
        this.preQuery.mobilePhone = this.query.mobilePhone*/
        this.$dialog.loading.open('加载中...');
        this.$router.push('/login')
        this.$dialog.loading.close()
       /* api.account.preRegister(this.query).then(response => {
          this.$dialog.loading.close()
          if (response.code == 200) {
            if (response.data == '1') {
              this.submitModel = true
              this.hregistered = true
            } else if (response.data == '0') {
              this.submitModel = true
              this.review = true
            } else {
              this.$router.push('/registered/second')
            }
          }
        },()=>{
          this.$dialog.loading.close()
        })*/
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
