<template>
  <div class="page-about">
    <yd-navbar title="登录密码" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <yd-cell-group>
      <yd-cell-item>
        <span slot="left">旧密码：</span>
        <yd-input slot="right" v-model="form.oldPassword"  placeholder="请输入旧密码"></yd-input>
      </yd-cell-item>
      <yd-cell-item>
        <span slot="left">新密码：</span>
        <yd-input slot="right" v-model="form.newPassword" placeholder="请输入新密码"></yd-input>
      </yd-cell-item>
    </yd-cell-group>
    <div class="btn-box">
      <button class="btn" @click="submitBtn">确认修改</button>
    </div>
  </div>
</template>

<script>
    import {changePwd} from '@/api/my'
    export default {
        name: "LoginPassword",
      data(){
        return{
          form:{
            oldPassword:'',
            newPassword:''
          }
        }
      },
      methods:{
          submitBtn() {
              let termList = {
                  oldPassword:this.form.oldPassword,
                  userid: this.$store.getters.userId,
                  newPassword:this.form.newPassword
              }
              changePwd(termList).then(res => {})
          }
      }
    }
</script>

<style scoped>

</style>
