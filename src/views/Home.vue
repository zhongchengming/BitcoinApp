<template>
  <div class="page-home">
    <div class="header">
      <div class="logo">
        <img  src="@/assets/images/logo.png"/>
      </div>
      <div class="user" @click="goMy">
        <img  src="@/assets/images/slogon.png"/>
      </div>
    </div>
    <div class="swiper-box">
      <yd-slider autoplay="3000">
        <yd-slider-item>
            <img src="@/assets/images/banner1.png">
        </yd-slider-item>
        <yd-slider-item>
          <img src="@/assets/images/banner1.png">
        </yd-slider-item>
        <yd-slider-item>
          <img src="@/assets/images/banner1.png">
        </yd-slider-item>
      </yd-slider>
    </div>
    <div class="notice-box">
      <div class="notice">
        <img src="@/assets/images/icon_notic.png" />
        智投鼠公告：
      </div>
      <div class="notice-info">
        <div class="text">尊敬的智投鼠用户:  因银行转账需要银行详细的开户网点，
          请广大用户在提现时填写开户支行的具体信息。
          避免您的积分提现无法到账。感谢您对智投鼠的支持!2020年6月29日</div>
      </div>
    </div>
    <ul class="router-tab">
      <li>
        <router-link to="/about">
          <div class="wrap"><i class="icon iconfont iconjieshao"></i></div>
          <p>智投鼠介绍</p>
        </router-link>
      </li>
      <li>
        <router-link to="/guide">
        <div class="wrap"><i class="icon iconfont iconxinshouyindao"></i></div>
        <p>新手指导</p>
        </router-link>
      </li>
      <li @click="kefu()">
        <!--<router-link to="https://aihecong.com/">-->
        <div class="wrap"><i class="icon iconfont iconkefu"></i></div>
        <p>在线客服</p>
       <!-- </router-link>-->
      </li>
      <li>
        <router-link to="/download">
        <div class="wrap"><i class="icon iconfont iconxiazai"></i></div>
        <p>APP下载</p>
        </router-link>
      </li>
    </ul>
    <div class="culture-box">
      <h3 class="title">企业文化</h3>
      <ul class="culture-list">
        <li>
          <img src="@/assets/images/test_img1.png">
          <div class="bottom">
            <p>对客户诚信不做伤害</p>
            <p>客户利益的事情</p>
          </div>
        </li>
        <li>
          <img src="@/assets/images/test_img2.png">
          <div class="bottom">
            <p>有巩固的专业事项</p>
            <p>热爱本职工作，尽职守</p>
          </div>
        </li>
        <li>
          <img src="@/assets/images/test_img3.png">
          <div class="bottom">
            <p>对待工作，全身心提升</p>
            <p>全身心投入对待客户</p>
          </div>
        </li>
        <li>
          <img src="@/assets/images/test_img4.png">
          <div class="bottom">
            <p>不墨守成规</p>
            <p>自我突破逆境求生存</p>
          </div>
        </li>
        <li>
          <img src="@/assets/images/test_img5.png">
          <div class="bottom">
            <p>笨人先起身</p>
            <p>笨鸟早出林</p>
          </div>
        </li>
        <li>
          <img src="@/assets/images/test_img6.png">
          <div class="bottom">
            <p>三人行，必有我师</p>
            <p>习补自己短板</p>
          </div>
        </li>
      </ul>
    </div>
    <yd-tabbar fixed active-color="#56b3f6">
      <yd-tabbar-item title="首页" link="#" active>
        <yd-icon name="home" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
      <yd-tabbar-item title="购买" link="/money" >
        <yd-icon name="shopcart" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
      <yd-tabbar-item title="账户" link="/my">
        <yd-icon name="ucenter-outline" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
    </yd-tabbar>
    <!--<footer class="footer-tab">
      <ul>
        <li class="active">
          <router-link to="/">
            <img src="@/assets/images/icon_tab_home.png" />
            &lt;!&ndash;<i class="icon "></i>&ndash;&gt;
            <p>首页</p>
          </router-link>
        </li>
        <li>
          <router-link to="/order">
            <img src="@/assets/images/icon_tab_user.png" />
            <p>购买</p>
          </router-link>
        </li>
        <li>
          <router-link to="/my">
            <img src="@/assets/images/icon_tab_my.png" />
            <p>账户</p>
          </router-link>
        </li>
      </ul>
    </footer>-->
    </div>
</template>

<script>
  /*import api from '@/api'*/

  export default {
    name: "home",
    mounted(){
      /*this.countCustomer()*/
    },
    data(){
      return{
      }
    },
    methods:{
      goMy(){
        this.$router.push('/my')
      },
        kefu(){
            window.location.href = 'https://aihecong.com/'

            //   this.kefurl=
            /*if (navigator.userAgent.indexOf("Html5Plus") > -1) {
                //判断是否在APP内，由APP封装的方法调用浏览器打开
                plus.runtime.openURL(this.settings.KEFU);
            } else {
                //不在APP内
                var u = navigator.userAgent;
                var isiOS = !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/); //ios终端
                if(isiOS){
                    location.href=this.settings.KEFU;
                }else {
                    //打开新页面
                    window.open(this.settings.KEFU);
                }
            }*/
        },
      /*countCustomer() {
        api.my.countCustomer().then(response => {
          if (response.code == 200) {
            this.customerCount = response.data
          }
        })
      }*/
    }
  }
</script>

<style scoped>
  .page-home{
    padding-bottom:60px;
  }
  .page-home .header{
   /* background: #56b3f6;*/
    background: rgba(0,0,0,.8);
    padding: 1.2rem .5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    box-sizing: border-box;
  }
  .page-home .header .logo{
    flex-basis: 30%;
  }
  .page-home .header .user{
    flex-basis: 42%;
  }
  .page-home .header img{width: 100%;}
  .notice-box{
   /* position: relative;*/
    display: flex;
    align-items: center;
    padding:15px 15px 15px 110px;
    width: 100%;
    box-sizing: border-box;
    font-size: 13px;
    color: #333;
  }
  .notice{
    position: absolute;
    left: 15px;
    display: flex;
    align-items: center;
  }
  .notice img{margin-right: 5px;}
  .notice-info {
    flex: 1;
    overflow: hidden;
  }
  .notice-info .text{
    width: 100%;
    display: inline-block;
    white-space: nowrap;
    animation: 15s wordsLoop linear infinite;
  }
  @keyframes wordsLoop {
    0% {
      transform: translateX(0px);
      -webkit-transform: translateX(0px);
    }
    100% {
      transform: translateX(-100%);
      -webkit-transform: translateX(-100%);
    }
  }
  @-webkit-keyframes wordsLoop {
    0% {
      transform: translateX(0px);
      -webkit-transform: translateX(0px);
    }
    100% {
      transform: translateX(-100%);
      -webkit-transform: translateX(-100%);
    }
  }
 .router-tab{
   background: #fff;
   display: flex;
   justify-content: space-around;
   font-size: 14px;
   color: #333;
   text-align: center;
   padding: 15px 0;
 }
  .router-tab li{
    padding: 0 10px;
    box-sizing: border-box;
  }
  .router-tab li .wrap{
    display: inline-block;
    border-radius: 50%;
    width: 40px;
    height: 40px;
    line-height: 40px;
    background: #ed4d65;
    color:#fff;
    margin-bottom: 5px;
  }
  .router-tab li .wrap .icon{font-size: 20px;}
 .router-tab li:not(:last-child){border-right: 1px solid #eee;}
  .router-tab li:nth-child(2) .wrap{
    background: #45bde6;
  }
  .router-tab li:nth-child(3) .wrap{
    background: #00dbb4;
  }
  .router-tab li:last-child .wrap{
    background: #eda04b;
  }
  .culture-box{padding: 15px;}
  .culture-box .title{
   /* margin: 15px;*/
    margin-bottom: 12px;
    font-size:16px;
    color: #333;
    font-weight: bold;
  }
  .culture-list{
    padding:0 15px;
    width: 100%;
    box-sizing: border-box;
   /* display: flex;
    flex-direction: row;
    flex-wrap: wrap;
    justify-content: space-around;*/
    border-radius: 10px;
    background: #fff;
  }
 /* .culture-list li{
    width: 48.5%;
    height: 200px;
    background: #fff;
    border-radius: 10px;
    padding: 15px;
    box-sizing: border-box;
    margin-bottom: 5px;
    font-size: .5rem;
    color: #333;
    position: relative;
    text-align: center;
  }*/
  .culture-list li{
    padding: 10px;
    font-size: 14px;
    color: #333;
    display: flex;
    align-items: center;
  }
  .culture-list li:not(:last-child){
    border-bottom: 1px solid #eee;
  }
  .culture-list li img{
    display: inline-block;
    width: 50px;
    height: 70px;
    margin-right: 20px;
  }
  .culture-list li p{line-height: 20px;}


  /*.footer-tab{
    position: fixed;
    height: 55px;
    width: 100%;
    bottom: 0;
    left: 0;
    background: #fff;
    box-shadow: 0 0 15px rgba(153,153,153,.5);
  }
  .footer-tab ul{
    height: 100%;
    width: 100%;
    display: flex;
    justify-content: space-between;
  }
  .footer-tab ul li{
    width: 33.3%;
    text-align: center;
    color: #999;
    padding: 7px 0 5px;
    box-sizing: border-box;
  }
  .footer-tab ul li img{width: 24px;}
  .footer-tab ul li .add-user-icon{
    width: 38px;
    margin-top: -14px;
    padding: 2px;
    background: #fff;
    border-radius: 50%;
    -webkit-border-radius: 50%;
  }
  .footer-tab ul .active{color: #37A6F5;}*/
</style>
