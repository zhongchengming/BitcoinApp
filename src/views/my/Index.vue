<template>
  <div>
    <div class="my-top">
        <div class="title-box-wrap">
          <img class="logo" src="@/assets/images/logo.png"/>
          <div class="title-text">
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
          <p>软件到期时间</p>
        </div>
      </li>
    </ul>
    <div class="my-list">
      <ul>
        <li @click="goWork()">
          <span class="name">工作信息</span>
          <i class="icon iconfont icon-fanhui1 go-icon"></i>
        </li>
      </ul>
    </div>
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
      goWork(){
        this.$router.push('/my/work')
      },
      goDesign(){
        this.$router.push('/my/design')
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
      getFormatDate(value) {
        if (value)
          return this.$moment(value).format('YYYY-MM-DD')
        return ''
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
    height: 100px;
    background:url("/static/images/banner_agent.png") no-repeat center center;
    background-size: cover;
    width: 100%;
    padding: 10px 0;
    box-sizing: border-box;
  }
  .title-box-wrap{
    display: flex;
    align-items: center;
    padding: 12px;
    color: #fff;
    font-size: 16px;
  }
  .title-box-wrap .logo {width: 100px;margin-right: 15px;}
  .go-icon{
    font-size: 18px;
    color: #c9c9c9;
  }
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
  .section{
    margin-top: 10px;
    background: #fff;
  }
  .my-list .name{
    font-size: 14px;
    color: #333;
  }
  .my-list ul li{
    display: flex;
    align-items: center;
    justify-content: space-between;
    height: 44px;
    margin:0 12px;
  }
  .my-list ul li:not(:last-child){
    border-bottom: 1px solid #eee;
  }
  .my-tips{font-size: 14px;color: #37A6F5;padding: 12px;}

</style>
