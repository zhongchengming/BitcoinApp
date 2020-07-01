<template>
  <div class="bottom-distance">
    <div class="my-top">
        <div class="title-box-wrap">
          <div class="title-text">
            <img class="logo" src="@/assets/images/logo.png"/>
            <p>zhongchengming</p>
            <p>盘口用户名xxx</p>
          </div>
        </div>
    </div>
    <ul class="my-link-list">
      <li>
        <div>
          <p class="number">702900</p>
          <p>邀请码</p>
        </div>
      </li>
      <li>
        <div>
          <p class="number">0</p>
          <p>平台积分</p>
        </div>
      </li>
      <li>
        <div>
          <p class="number">0</p>
          <p>盘口余额</p>
        </div>
      </li>
      <li>
        <div>
          <p class="number">2020.07.01</p>
          <p>到期时间</p>
        </div>
      </li>
    </ul>
    <div class="my-list">
      <ul>
        <router-link v-for="(item,index) in lists" :to="item.url" :key="index">
          <li>
            <i class="icon iconfont" :class="item.icon" :style="{color:item.iconLeftColor}" ></i>
            <h3 class="name">{{item.name}}</h3>
            <i class="icon iconfont iconiconfontjiantou5"></i>
          </li>
        </router-link>
      </ul>
    </div>
    <div class="logout-btn">
       <button  @click="logout()">退出登录</button>
    </div>
    <div class="slogon-footer">
      <img src="@/assets/images/slogon_blue.png">
    </div>
    <yd-tabbar fixed active-color="#56b3f6">
      <yd-tabbar-item title="首页" link="/">
        <yd-icon name="home" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
      <yd-tabbar-item title="购买" link="/money" >
        <yd-icon name="shopcart" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
      <yd-tabbar-item title="账户" active link="">
        <yd-icon name="ucenter-outline" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
    </yd-tabbar>
  </div>
</template>

<script>
  import api from '@/api'

  export default {
    name: "index",
    data() {
      return {
          lists:[
              {
                  url:'' ,
                  iconLeftColor:'#62c6f5',
                  name:'智投鼠投注记录',
                  icon:'iconemaxcitygerenxinxitubiaoji03'
              },
              {
                  url:'/my/integralExchange' ,
                  iconLeftColor:'#c6b909',
                  name:'积分兑换',
                  icon:'icongoumai'
              },
              {
                  url:'/my/money' ,
                  iconLeftColor:'#65bb71',
                  name:'充值',
                  icon:'iconchongzhijilu'
              },
              {
                  url:'/my/withdrawal' ,
                  iconLeftColor:'#ff7c81',
                  name:'提现',
                  icon:'icontixian1'
              },
              /*{
                  url:'/my/integral' ,
                  iconLeftColor:'#ffa640',
                  name:'日志查看',
                  icon:'iconcaozuorizhi'
              },*/
              {
                  url:'/my/moneyRecord' ,
                  iconLeftColor:'#ffa640',
                  name:'充值记录',
                  icon:'iconcaozuorizhi'
              },
              {
                  url:'/my/withdrawalRecord' ,
                  iconLeftColor:'#ffa640',
                  name:'提现记录',
                  icon:'iconcaozuorizhi'
              },
              {
                  url:'/my/share' ,
                  iconLeftColor:'#fa0795',
                  name:'好友分享',
                  icon:'iconhuokefenxiang'
              },
              {
                  url:'/my/task' ,
                  iconLeftColor:'#1ec026',
                  name:'我的任务',
                  icon:'iconwoderenwu'
              },
              {
                  url:'/my/loginPassword' ,
                  iconLeftColor:'#24a7ff',
                  name:'登录密码',
                  icon:'iconmima'
              },
              {
                  url:'/my/withdrawalPassword' ,
                  iconLeftColor:'#c6b909',
                  name:'提现密码',
                  icon:'iconmima'
              },
              {
                  url:'/my/integral' ,
                  iconLeftColor:'#c6b909',
                  name:'我的积分',
                  icon:'icongoumai'
              },
              {
                  url:'/my/bankMgt' ,
                  iconLeftColor:'#24a7ff',
                  name:'银行卡管理',
                  icon:'iconyinxingqia'
              }
          ],
        agent: {
          agentName: '',
          company: '',
          companyAddress: '',
          companyPhone: '',
          proofImg: '',
          birthday: '',
          mobilePhone: '',
          agentType: '',
          province:'',
          provinceName:'',
          city:'',
          cityName:'',
          district:'',
          districtName:'',
          agentSite: '',
          avatar: ''
        },
        customerCount:0
      }
    },
    mounted(){
      /*this.load()
      this.countCustomer()*/
    },
    methods:{
      logout(){
        this.$router.push('/login')
      },
      load() {
        api.my.get().then(response => {
          if (response.code == 200) {
            this.agent = response.data
            this.agent.birthday = this.getFormatDate(this.agent.birthday)
          }
        })
      },
      countCustomer() {
        api.my.countCustomer().then(response => {
          if (response.code == 200) {
            this.customerCount = response.data
          }
        })
      }
    }
  }
</script>

<style scoped>
  .my-top {
    height: 120px;
    background:url("/static/images/banner_agent.png") no-repeat center center;
    background-size: cover;
    width: 100%;
    box-sizing: border-box;
  }
  .title-box-wrap{
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    padding: 12px;
    color: #fff;
    font-size: 16px;
    height: 100%;
  }
  .title-box-wrap .logo {width: 100px;margin-bottom: 10px;}
  .my-link-list{
    display: flex;
    margin: 10px;
    background: #fff;
    border-radius: 6px;
    height: 70px;}
  .my-link-list li{
    flex-basis: 25%;
    display: flex;
    justify-content: center;
    align-items: center;
    text-align: center;
    color: #666;
    font-size: 12px;
  }
  .my-link-list li .number{color: #56b3f6;margin-bottom: 3px;}
  .my-list{
    margin: 10px;
    border-radius: 6px;
    background: #fff;
  }
  .my-list ul li{
    display: flex;
    align-items: center;
    height: 44px;
    margin:0 12px;
  }
  .my-list ul li:not(:last-child){
    border-bottom: 1px solid #eee;
  }
  .my-list li .name{
    font-size: 14px;
    color: #333;
    flex: 1;
    margin: 0 7px;
  }
  .my-list li .icon{font-size: 20px;}
  .my-list li .iconiconfontjiantou5{font-size: 16px;color: #999;}
  .logout-btn{
    padding: 15px 10px 5px;
  }
  .logout-btn button{
    color: #24a7ff;
    display: inline-block;
    width: 100%;
    border: 1px solid #24a7ff;
    padding: 12px 0;
    font-size: 16px;
    border-radius: 6px;
  }

</style>
