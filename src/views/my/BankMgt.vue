<template>
  <div class="page-about">
    <yd-navbar title="银行卡管理" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <yd-cell-group>
      <yd-cell-item>
        <span slot="left">银行名称：</span>
        <yd-input slot="right" v-model="form.bankName" ref="bankName" required  placeholder="请输入银行名称"></yd-input>
      </yd-cell-item>
      <yd-cell-item>
        <span slot="left">真实姓名：</span>
        <yd-input slot="right" v-model="form.userName" placeholder="请输入真实姓名"></yd-input>
      </yd-cell-item>
      <yd-cell-item>
        <span slot="left">银行卡号：</span>
        <yd-input slot="right" v-model="form.bankCard" ref="bankCard" regex="bankcard" placeholder="请输入银行卡号"></yd-input>
      </yd-cell-item>
    </yd-cell-group>
    <div class="btn-box">
      <button class="btn" @click="submitBtn">确认修改</button>
    </div>
  </div>
</template>

<script>
    export default {
        name: "bankMgt",
      data(){
          return{
            form:{
              bankName:'',
              userName:'',
              bankCard:''
            }
          }
      },
      methods:{
        submitBtn() {
          const input = this.$refs.bankName;
          console.log(input)
          this.$dialog.toast({
            mes:`${input.errorMsg}`
          })
        }
      }
    }
</script>

<style scoped>

</style>
