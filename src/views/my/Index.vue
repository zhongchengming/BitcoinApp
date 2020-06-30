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
        <li>
          <i class="icon iconfont iconemaxcitygerenxinxitubiaoji03" style="color:#62c6f5"></i>
          <h3 class="name">智投鼠投注记录</h3>
          <i class="icon iconfont iconiconfontjiantou5"></i>
        </li>
        <li @click="goIntegral">
          <i class="icon iconfont icongoumai" style="color: #c6b909;"></i>
          <h3 class="name">积分兑换</h3>
          <i class="icon iconfont iconiconfontjiantou5"></i>
        </li>
        <li>
          <i class="icon iconfont iconchongzhijilu" style="color: #65bb71;"></i>
          <h3 class="name">充值</h3>
          <i class="icon iconfont iconiconfontjiantou5"></i>
        </li>
        <li @click="goWithdrawal">
          <i class="icon iconfont icontixian1" style="color: #ff7c81;"></i>
          <h3 class="name">提现</h3>
          <i class="icon iconfont iconiconfontjiantou5"></i>
        </li>
        <li>
          <i class="icon iconfont iconcaozuorizhi" style="color: #ffa640;"></i>
          <h3 class="name">日志查看</h3>
          <i class="icon iconfont iconiconfontjiantou5"></i>
        </li>
        <li>
          <i class="icon iconfont iconcaozuorizhi" style="color: #ffa640;"></i>
          <h3 class="name">充值记录</h3>
          <i class="icon iconfont iconiconfontjiantou5"></i>
        </li>
        <li>
          <i class="icon iconfont iconcaozuorizhi" style="color: #ffa640;"></i>
          <h3 class="name">提现记录</h3>
          <i class="icon iconfont iconiconfontjiantou5"></i>
        </li>
        <li>
          <i class="icon iconfont iconhuokefenxiang" style="color: #fa0795;"></i>
          <h3 class="name">好友分享</h3>
          <i class="icon iconfont iconiconfontjiantou5"></i>
        </li>
        <li>
          <i class="icon iconfont iconwoderenwu" style="color: #1ec026;"></i>
          <h3 class="name">我的任务</h3>
          <i class="icon iconfont iconiconfontjiantou5"></i>
        </li>
        <li>
          <i class="icon iconfont iconmima" style="color: #24a7ff;"></i>
          <h3 class="name">登录密码</h3>
          <i class="icon iconfont iconiconfontjiantou5"></i>
        </li>
        <li>
          <i class="icon iconfont iconmima" style="color: #24a7ff;"></i>
          <h3 class="name">提现密码</h3>
          <i class="icon iconfont iconiconfontjiantou5"></i>
        </li>
        <li>
          <i class="icon iconfont icongoumai" style="color: #c6b909;"></i>
          <h3 class="name">我的积分</h3>
          <i class="icon iconfont iconiconfontjiantou5"></i>
        </li>
        <li>
          <i class="icon iconfont iconyinxingqia" style="color: #24a7ff;;"></i>
          <h3 class="name">银行管理</h3>
          <i class="icon iconfont iconiconfontjiantou5"></i>
        </li>
      </ul>
    </div>
    <div class="logout-btn">
       <button  @click="logout()">退出登录</button>
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
        titleModel:false,
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
      goIntegral(){
        this.$router.push('/my/integral')
      },
      goWithdrawal(){
        this.$router.push('/my/withdrawal')
      },
      goPassword(){
        this.$router.push('/forgot/password')
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
    padding: 15px 10px 25px;
  }
  .logout-btn button{
    color: #24a7ff;
    display: inline-block;
    width: 100%;
    border: .026667rem solid #24a7ff;
    background-color: transparent;
    padding: 12px 0;
    font-size: 14px;
    border-radius: 4px;
  }

</style>
