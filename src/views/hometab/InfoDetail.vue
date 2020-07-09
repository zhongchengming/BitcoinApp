<template>
  <div class="page-about">
    <yd-navbar title="资讯详情" fixed>
      <router-link to="/" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <div class="about-info">
      <!--<div class="logo">
        <img src="@/assets/images/logo.png">
      </div>-->
      <div class="article">
        <h1>{{lists.title}} </h1>
        <p>{{lists.creattime}}</p>
        <div class="box" v-html="lists.content">

        </div>
      </div>
    </div>
    <!--<div class="about-wrap">

    </div>-->
  </div>
</template>

<script>
    import {queryArticleDeatil} from '@/api/common/user'
    export default {
        name: "About",
        data(){
            return{
                lists:{}
            }
        },
        mounted(){
            this.load()
        },
        methods:{
            load(){
                let params={
                    articleid:this.$route.query.id
                }
                queryArticleDeatil(params).then(response => {
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
  .page-about{
    min-height: 100%;
    box-sizing: border-box;
    background: url(/static/images/bg_about.png)no-repeat;
    background-size: 100% 100%;
  }
  .about-info{
    background: url(/static/images/bg_about.png)no-repeat;
    background-size: 100% 100%;
    width: 100%;
    padding:15px;
    box-sizing: border-box;
    min-height: 100%;
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
    font-size: 14px;
    font-weight: bold;
  }
 /* .about-info .article h1:before {
    content: "";
    background: #56b3f6;
    display: inline-block;
    vertical-align: middle;
    height: 10px;
    width: 4px;
    border-radius: 3px;
    margin-right: 3px;
  }*/
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
