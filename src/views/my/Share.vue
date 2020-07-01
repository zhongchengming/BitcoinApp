<template>
  <div class="page-about">
    <yd-navbar title="好友分享" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <div class="qrcode">
       <img src="@/assets/images/share_code.png" />
    </div>
  </div>
</template>

<script>
    export default {
        name: "Share"
    }
</script>

<style scoped>
 .page-about{
   background: url("/static/images/share_bg.jpg") no-repeat center center;
   background-size: 100% 100%;
 }
  .qrcode{
    margin-top: 70px;
    text-align: center;
  }
  .qrcode img{
    width: 100px;
    height: 100px;
  }
</style>
