<template>
  <div class="bottom-distance">
    <div class="my-top">
        <div class="title-box-wrap">
          <img class="logo" src="@/assets/images/logo.png"/>
          <div class="title-text">
            <p v-text="username">zhongchengming</p>
            <p class="name" v-text="this.$store.getters.btbname">盘口用户名:小小张</p>
          </div>
        </div>
    </div>
    <ul class="my-link-list">
      <li>
        <div>
          <p class="number" v-text="this.$store.getters.invitationcode">702900</p>
          <p>邀请码</p>
        </div>
      </li>
      <li>
        <div>
          <p class="number" v-text="this.$store.getters.integral">0</p>
          <p>平台积分</p>
        </div>
      </li>
      <li>
        <div>
          <p class="number" v-text="this.$store.getters.btbmoney?this.$store.getters.btbmoney:'0'">0</p>
          <p>盘口余额</p>
        </div>
      </li>
      <li>
        <div>
          <p class="number" v-text="this.$store.getters.endDay">2020.07.01</p>
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
      <yd-tabbar-item title="购买" link="/my/money" >
        <yd-icon name="shopcart" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
      <yd-tabbar-item title="账户" active link="">
        <yd-icon name="ucenter-outline" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
      <yd-tabbar-item title="交易" link="/trade">
        <yd-icon name="discount" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
    </yd-tabbar>
  </div>
</template>

<script>
  export default {
    name: "index",
    data() {
      return {
         /* username:'',*/
          lists:[
              /*{
                  url:'' ,
                  iconLeftColor:'#62c6f5',
                  name:'智投鼠投注记录',
                  icon:'iconemaxcitygerenxinxitubiaoji03'
              },*/
              {
                  url:'/my/integralExchange' ,
                  iconLeftColor:'#c6b909',
                  name:'积分兑换',
                  icon:'icongoumai'
              },
              {
                  url:'/my/integralMoney' ,
                  iconLeftColor:'#c6b909',
                  name:'积分充值',
                  icon:'iconchongzhijilu'
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
              {
                  url:'/my/tradAmount' ,
                  iconLeftColor:'#ff7c81',
                  name:'交易账户金额',
                  icon:'iconREXyinliankajiesuandantuikuan_'
              },
              {
                  url:'/my/integralExchangeRecord' ,
                  iconLeftColor:'#ffa640',
                  name:'积分兑换记录',
                  icon:'iconcaozuorizhi'
              },
              {
                  url:'/my/integralMoneyRecord' ,
                  iconLeftColor:'#ffa640',
                  name:'积分充值记录',
                  icon:'iconcaozuorizhi'
              },
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
                  name:'修改密码',
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
             /* {
                  url:'/my/bankMgt' ,
                  iconLeftColor:'#24a7ff',
                  name:'银行卡管理',
                  icon:'iconyinxingqia'
              }*/
          ]
      }
    },
      computed:{
          username(){
              return this.$store.state.user.username
          }
      },
    mounted(){
      /*this.load()
      this.countCustomer()*/
    },
    methods:{
      logout(){
          let params={
              userid:this.$store.state.user.userId,
              token:this.$store.state.user.token
          }
        this.$dialog.confirm({
          title: '确定要退出吗？',
          opts: [
            {
              txt: '取消',
              color: false,
              callback: () => {
                this.$dialog.toast({mes: '已取消', timeout: 1000});
              }
            },
            {
              txt: '确定',
              color: true,
              callback: () => {
                this.$store.dispatch('LogOut',params).then(()=>{
                 /* this.$router.push('/login')*/
                  location.reload()
                })

              }
            }
          ],
        });
        /*this.$router.push('/login')*/
      },
      load() {

      }
    }
  }
</script>

<style scoped>
  .my-top {
    height: 100px;
    /*background:url("/static/images/banner_agent.png") no-repeat center center;*/
    background-size: cover;
    width: 100%;
    box-sizing: border-box;
    background: linear-gradient(top, #37A6F5, #8DCDFA);
    background: -webkit-linear-gradient(top, #37A6F5, #8DCDFA);
    background: -o-linear-gradient(top, #37A6F5, #8DCDFA);
    background: -moz-linear-gradient(top, #37A6F5, #8DCDFA);
  }
  .title-box-wrap{
    display: flex;
    align-items: center;
    /*justify-content: center;*/
    text-align: center;
    padding: 12px 20px;
    color: #333;
    font-size: 16px;
    height: 100%;
    font-weight: bold;
  }
  .title-box-wrap .logo {width: 80px;margin-right: 20px;}
  .title-box-wrap .title-text{text-align: left;}
  .title-text .name{color: #999;font-size: 12px;margin-top: 5px;font-weight: normal;}
  .my-link-list{
    display: flex;
    margin-bottom: 10px;
    background: #fff;
   /* border-radius: 6px;*/
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
    margin: 10px 0;
   /* border-radius: 6px;*/
    background: #fff;
  }
  .my-list ul li{
    display: flex;
    align-items: center;
    height: 44px;
    margin:0 20px;
    border-bottom: 1px solid #eee;
  }
  .my-list ul /deep/a:last-child li{
    border-bottom: 0;
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
    border-bottom:2px solid #24a7ff ;
    padding: 12px 0;
    font-size: 16px;
    border-radius: 6px;
  }

</style>
