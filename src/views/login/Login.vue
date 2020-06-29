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
              <yd-input v-model="query.account" placeholder="请输入用户名/手机号"></yd-input>
            </li>
            <li>
              <img class="icon" src="@/assets/images/icon_password.png"/>
              <yd-input type="password" v-model="query.oldPassword" placeholder="请输入密码"></yd-input>
            </li>
            <li>
              <img class="icon" src="@/assets/images/icon_code.png"/>
              <div class="right">
                <yd-input type="text" class="code" v-model="query.code" placeholder="请输入验证码"></yd-input>
                <div class="code-wrap" @click="changeCode">
                  <img :src="imgCode" style="width:84px"/>
                </div>
               <!-- <yd-sendcode class="send-btn" v-model="sendCode"
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
          <button class="login-btn" @click="login()">立即登录</button>
          <button class="login-btn sign-btn" @click="goSign()">我还没有账号 马上注册</button>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
  import api from '@/api'
  import md5 from 'md5'

  export default {
    name: "login",
    data() {
      return {
        imgCode:'/static/images/code_img.png',
        query: {
          account: '',
          oldPassword:'',
          code: ''
        },
      }
    },
    methods: {
      sendCode1() {
        if(!this.query.mobilePhone){
          this.$dialog.toast({
            mes:'请输入手机号'
          })
          return
        }
        if(!/^((13|14|15|17|18)[0-9]{1}\d{8})$/.test(this.query.mobilePhone)){
          this.$dialog.toast({
            mes:'手机号格式不正确'
          })
          return
        }
        this.$dialog.loading.open('发送中...');
        setTimeout(() => {
          api.account.loginCode(this.query.mobilePhone).then(response => {
            if (response.code == 200) {
              this.sendCode = true;
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
      login() {
        this.$dialog.loading.open('加载中...');
        this.$router.push('/')
        this.$dialog.loading.close()
        /*if (this.sendCode == false) {
          this.account.password = md5(this.oldPassword)
          api.account.login(this.account).then(response => {
            this.$dialog.loading.close()
            if(response.code==200){
              this.$store.dispatch('addPrincipal', response.data).then(() => {
                if(this.$route.query.lastPath){
                  this.$router.push(this.$route.query.lastPath)
                }else {
                  this.$router.push('/')
                }
              })
            }
          },()=>{
            this.$dialog.loading.close()
          })
        } else {
          api.account.login(this.query).then(response => {
            this.$dialog.loading.close()
            if(response.code==200){
              this.$store.dispatch('addPrincipal', response.data).then(() => {
                this.$router.push('/')
              })
            }
          },()=>{
            this.$dialog.loading.close()
          })
        }*/
      },
      goSign(){
        this.$store.dispatch('clearAccount').then(()=>{
          this.$router.push('/registered')
        })
      }
    }
  }
</script>

<style scoped>
</style>
