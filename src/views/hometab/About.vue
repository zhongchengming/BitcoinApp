<template>
  <div class="page-about">
    <yd-navbar title="智投魔方介绍" fixed>
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
          <h1> 智投魔方介绍 </h1>
          <div class="box">
           <ul class="content">
             <li v-for="(item,index) in lists" :key="index">
                <h5 class="title">{{index+1}}、{{item.title}}</h5>
                <div v-html="item.content"></div>
             </li>
           </ul>
            <!--智投魔方介绍；全球知名的科技公司MAJ旗下的“智投魔方”互联网智能理财机器人—是一款互联网+量化的智能理财软件，
            这是以用户服务为出发点的第一款智能理财机器人。”智投魔方是一个用于运行智投魔方智能投注自动赚钱的安全操作系统，
            智投魔方侧重于安全、稳定、高效、收益，这种理念与智投魔方提供一键理财初衷是一致的。如果理财是金融的代名词的话，那么智投魔方就是新金融的代表，
            智投魔方平均每天可以获得的净收益为3%，能够持续的24小时为用户的资产增值保驾护航。用户不需要频繁的登陆，
            只需要每天点击开始工作，即可百分百实现资产增值。-->
          </div>
        </div>
      </div>
      <!--<div class="slogon-footer">
        <img src="@/assets/images/slogon_blue.png">
      </div>-->
    </div>
  </div>
</template>

<script>
    import {queryArticle} from '@/api/common/user'
    export default {
        name: "About",
        data(){
            return{
                lists:[]
            }
        },
        mounted(){
            this.queryCulture()
        },
        methods:{
            queryCulture(){
                let params={
                    type:'004'
                }
                queryArticle(params).then(response => {
                    if (response.resultCode == 1) {
                        console.log(response)
                        this.lists =response.resultBody
                    }
                })
            }
        }
    }
</script>

<style scoped>
  .about-wrap{
    height: 100%;
    min-height: 100%;
    box-sizing: border-box;
    background: url(/static/images/bg_about.png)no-repeat;
    background-size: 100% 100%;
  }
  .about-info{
   /* background: url("/static/images/about-bg.jpg") no-repeat center center;
    background-size:100% 100%;*/
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
    color: #666;
  }
  .about-info .article .box img{width: 100%;}
  .box .title{
    font-size: 14px;
    color: #444;
    margin-bottom: 10px;
  }
</style>
