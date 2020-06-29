<template>
  <div class="page-about">
    <yd-navbar title="新手指导" fixed bgcolor="rgba(0,0,0,.8)" height="45px" color="#fff" fontsize="15px">
      <router-link to="/" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <div class="about-wrap">
      <div class="about-info">
        <div class="logo">
          <img src="@/assets/images/logo.png">
        </div>
        <div class="article">
          <h1> 新手指导 </h1>
          <div class="box">
            <img src="@/assets/images/new_step1.png">
            <img style="margin-top: 10px;" src="@/assets/images/new_step2.png">
          </div>
        </div>
      </div>
      <div class="slogon-footer">
        <img src="@/assets/images/slogon_blue.png">
      </div>
    </div>
  </div>
</template>

<script>
    export default {
        name: "About"
    }
</script>

<style scoped>
  .about-wrap{
    height: 100%;
  }
  .about-info{
    background: url("/static/images/about-bg.jpg") no-repeat center center;
    background-size:100% 100%;
    width: 100%;
    padding: 15px;
    box-sizing: border-box;
  }
  .about-info .logo{text-align: right;}
  .about-info .logo img{
    width: 33%;
  }
  .about-info .article {
    min-height:360px;
    background: #fff;
    text-align: center;
    border-radius: .4rem;
    padding: 1px 5px 20px;
    box-shadow: 0.053333rem 0.053333rem 0.08rem #eee;
  }
  .about-info .article h1{
    margin: 15px;
    font-size: 16px;
    font-weight: bold;
  }
  .about-info .article h1:before {
    content: "";
    background: #56b3f6;
    display: inline-block;
    vertical-align: middle;
    height: 10px;
    width: 4px;
    border-radius: 3px;
    margin-right: 3px;
  }
  .about-info .article .box{
    text-align: left;
    padding: 15px;
    box-shadow: 0.053333rem 0.053333rem 0.08rem #eee;
    width: 90%;
    margin: 0 auto;
    border-radius: .266667rem;
    box-sizing: border-box;
  }
  .about-info .article .box img{width: 100%;}
  .slogon-footer {
    text-align: center;
    padding: .8rem 0;
  }
  .slogon-footer img{width: 60%;}
</style>
