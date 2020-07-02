<template>
<div class="page-about">
  <yd-navbar title="在线客服" fixed>
    <div slot="left" @click="goback">
      <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
    </div>
  </yd-navbar>
  <div class="kefu-box">
    <iframe src="https://aihecong.com/"></iframe>
  </div>
</div>
</template>

<script>
    export default {
        name: "Service",
      data(){
          return{}
      },
      methods:{
          goback(){
            this.$router.go(-1)
          }
      }
    }
</script>

<style scoped>
.kefu-box{
  height: 100%;
}
  .kefu-box iframe{
    height: 100%;
    width: 100%;
    border: none;
  }
</style>
