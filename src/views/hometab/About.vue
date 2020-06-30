<template>
  <div class="page-about">
    <yd-navbar title="智投鼠介绍" fixed>
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
          <h1> 智投鼠介绍 </h1>
          <div class="box">
            智投鼠介绍；全球知名的科技公司MAJ旗下的“智投鼠”互联网智能理财机器人—是一款互联网+量化的智能理财软件，
            这是以用户服务为出发点的第一款智能理财机器人。”智投鼠是一个用于运行智投鼠智能投注自动赚钱的安全操作系统，
            智投鼠侧重于安全、稳定、高效、收益，这种理念与智投鼠提供一键理财初衷是一致的。如果理财是金融的代名词的话，那么智投鼠就是新金融的代表，
            智投鼠平均每天可以获得的净收益为3%，能够持续的24小时为用户的资产增值保驾护航。用户不需要频繁的登陆，
            只需要每天点击开始工作，即可百分百实现资产增值。
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
    padding:15px;
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
</style>
