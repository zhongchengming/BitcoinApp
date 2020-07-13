<template>
  <div class="page-home home-wrap">
    <div class="box-container" v-if="isBindText">
      <!--v-if="isBindText"-->
      <p v-if="noData" class="no-data">暂无数据</p>
      <ul v-else class="money-record">
        <li class="p-order-item" v-for="(item,index) in myList" :key="index">
          <div class="title row">
            <p class="no">
              <span class="name">盘口名称：</span>
              <span v-text="item.btbname">202006292154067460</span>
            </p>
            <span class="state">
                   币种：{{item.coin}}
              </span>
          </div>
          <div class="msg">
            <p>
              <span class="name">额度：</span>
              <span class="price">￥<i v-text="item.balance">1000</i></span>
            </p>
          </div>
        </li>
      </ul>
    </div>
    <div class="login-box">
      <!--<div v-if="isBindText" class="bind-box">-->
        <!--<div class="bind-text">
          <yd-icon name="checkoff"></yd-icon>
          <p>绑定成功</p>
        </div>-->
      <!--</div>-->
      <div class="login-form" v-if="!isBindText">
        <ul class="login-list">
          <li>
            <img class="icon" src="@/assets/images/icon_tel.png"/>
            <yd-input v-model="query.username" placeholder="请输入手机号或者邮箱"></yd-input>
          </li>
          <li>
            <img class="icon" src="@/assets/images/icon_password.png"/>
            <yd-input type="password" v-model="query.password" placeholder="请输入密码"></yd-input>
          </li>
        </ul>
        <button class="login-btn" @click="bindBtn()">立即绑定</button>
      </div>
    </div>
    <yd-popup v-model="fitterPopup" position="center" width="50%">
      <div class="fitter-popup-box">
        <p class="list-item" v-for="(item,index) in lists">
          {{item}}
        </p>
      </div>
    </yd-popup>
    <yd-tabbar fixed active-color="#56b3f6">
      <yd-tabbar-item title="首页" link="/">
        <yd-icon name="home" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
      <yd-tabbar-item title="购买" link="/my/money">
        <yd-icon name="shopcart" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
      <yd-tabbar-item title="账户" link="/my">
        <yd-icon name="ucenter-outline" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
      <yd-tabbar-item title="交易" link="#" active>
        <yd-icon name="discount" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
    </yd-tabbar>
  </div>
</template>

<script>
  import {mapGetters} from 'vuex'
  import {messagelist, saveOrUpdateCoin} from '@/api/common/user'
  import {queryCoin} from '@/api/my'

  export default {
    name: "trade",
    data() {
      return {
        isBindText:this.$store.getters.isbind,
          myList:[],
          noData:false,
        query: {
          username: '',
          password:''
        },
        fitterPopup: false,
        lists: [],
        item: "",
      }
    },
    computed:{
      ...mapGetters([
        'isbind'
      ])
     /* getIsBindState(){
        return this.$store.getters.isbind
      }*/
    },
    mounted() {
        /*if(this.$store.getters.isbind){*/
            this.amountLoad()
        /*}*/
    },
    methods: {
        amountLoad() {
            let params = {
                userid:this.$store.getters.userId,
            }
            queryCoin(params).then(res => {
                if (res.resultCode == 1) {
                    this.myList = this.myList.concat(res.resultBody)
                    if (this.myList.length === 0) {
                        this.noData = true
                    }
                }
            })
        },
      load() {
        this.fitterPopup=true
        messagelist().then(response => {
          this.lists = response.resultBody
          let setTime= setInterval(()=>{
            this.fitterPopup = false
            /*this.$store.dispatch('GetIsBind',true);*/
            this.isBindText=true
              this.amountLoad()
          },3000)
        /*  clearInterval(setTime)*/
        })
      },
      bindBtn() {
        if (!this.query.username) {
          this.$dialog.toast({
            mes: '请输入手机号或者邮箱'
          })
          return
        }
          if (!this.query.password) {
              this.$dialog.toast({
                  mes: '请输入密码'
              })
              return
          }
        /*this.$dialog.loading.open('绑定中...');*/
        let params = {
          username: this.query.username,
          userid: this.$store.getters.userId
        }
        saveOrUpdateCoin(params).then(response => {
         /* this.$dialog.loading.close()*/
          if (response.resultCode == 1) {
            this.load()
          }
        })
      }
    }
  }
</script>

<style scoped>
  .home-wrap {
    min-height: 100%;
    background: url("/static/images/bg_trade.png") no-repeat;
    background-size: 100% 100%;
    position: relative;
    display: flex;
    align-items: center;
    padding: 20px 0 60px;
    box-sizing: border-box;
  }
.box-container{width: 100%;}
  .no-data {
    color: #666;
    font-size: 20px;
    margin-top: 70px;
    text-align: center;
  }

  .row {
    display: flex;
    align-items: center;
    justify-content: space-between;
  }

  .p-order-item {
    padding: 7px 15px;
    font-size: 13px;
    color: #fff;
  }
  .p-order-item:not(:last-child){
    border-bottom: 1px solid #f5f5f5;
  }

  .p-order-item .no {
    font-size: 14px;
    font-weight: bold;
  }

  .p-order-item .name {
    margin-right: 3px;
  }

  .p-order-item .msg {
    padding: 10px 5px;
  }

  .p-order-item .msg p {
    margin-bottom: 5px;
  }

  .p-order-item .price {
    color: #FE4444;
  }

  .p-order-item .state {
    color: #37A6F5
  }

  .login-box {
    margin-top: 130px;
    height: 400px;
  }
  /*.bind-box{
    width: 120px;
    height: 120px;
    border: 2px dashed #fff;
    border-radius: 50%;
    text-align: center;
    margin: 20px auto;
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .bind-text{
    font-size: 14px;
    color: #fff;
  }
  .bind-text .yd-icon-checkoff{
    font-size: 30px!important;
  }*/
  .fitter-popup-box {
    width: 100%;
    height: 150px;
    background: #fff;
    padding: 15px;
    box-sizing: border-box;
    border-radius: 4px;
    text-align: center;
  }
  .fitter-popup-box .list-item{margin-bottom: 3px;}
  .fitter-popup-box .list-item:not(:first-child){
    visibility: hidden;
    animation: listAni 2s ease both;
  }
  @keyframes listAni {
    0% {
      opacity: 0;
      visibility: hidden;
    }
    100% {
      opacity: 1;
      visibility: visible;
    }
  }
  .list-item:nth-child(1) {
    animation-delay: 0s;
  }
  .list-item:nth-child(2) {
    animation-delay: 5s;
  }
  .list-item:nth-child(3) {
    animation-delay: 10s;
  }
  .list-item:nth-child(4) {
    animation-delay:15s;
  }
  .list-item:nth-child(5) {
    animation-delay: 20s;
  }
  .list-item:nth-child(6) {
    animation-delay: 25s;
  }
</style>
