<template>
<div class="page-about">
  <yd-navbar title="银行理" fixed>
    <router-link to="/" slot="left">
      <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
    </router-link>
  </yd-navbar>
  <div class="kefu-box">
    <iframe src="https://aihecong.com/"></iframe>
  </div>
</div>
</template>

<script>
    export default {
        name: "Service"
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
