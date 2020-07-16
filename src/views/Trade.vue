<template>
  <div class="page-home home-wrap">
    <div class="box-container no-show-box" :style="{display:isShowList}">
      <p v-if="noData" class="no-data">暂无数据</p>
      <ul v-else class="money-record">
        <li class="p-order-item" v-for="(item,index) in myList" :key="index">
          <div class="title row">
            <p class="no">
              <span class="name">脚本名称：</span>
              <span v-text="item.transactionname">54067460</span>
            </p>
            <span class="state">{{item.gradescore}}</span>
          </div>
          <div class="msg">
            <p>
              <span class="name">脚本执行额度：</span>
              <span class="price"><i v-text="item.money">1000</i>usdt</span>
            </p>
           <!-- <p>
              <span class="name">脚本执行时长：</span>
              <span v-text="item.transactiontime"></span>
            </p>-->
          </div>
          <div class="bottom-btns">
            <!--<p class="countTime"> <span class="name">倒计时：</span>
             &lt;!&ndash; <van-count-down :time="time" />&ndash;&gt;
             &lt;!&ndash; <van-count-down
                ref="countDownTime"
                :time="time"
                :auto-start="false" />&ndash;&gt;
              <van-count-down
                ref="countDownTime"
                :time="time"
                :auto-start="startFalse"
                @finish="countDownFinish"
              />
            </p>-->
            <yd-button type="primary" @click.native="startBtn(item)" :disabled="item.disable">启动</yd-button>
            <yd-button type="hollow" class="time-btn">执行时长：<span v-text="item.transactiontime"></span>h</yd-button>
          <!--  <yd-button type="primary" @click="startBtn(item)" disabled>启动</yd-button>-->
          </div>
        </li>
      </ul>
    </div>
    <div class="login-box no-show-box" :style="{display:isShowForm}">
      <div class="login-form" >
        <ul class="login-list">
          <li>
            <img class="icon" src="@/assets/images/icon_tel.png"/>
            <yd-input v-model="query.username" placeholder="请输入手机号或者邮箱"></yd-input>
          </li>
          <li>
            <img class="icon" src="@/assets/images/icon_password.png"/>
            <yd-input type="password" v-model="query.jyspassword" placeholder="请输入交易密码"></yd-input>
          </li>
        </ul>
        <button class="login-btn" @click="bindBtn()">立即绑定</button>
      </div>
    </div>
    <!--提示信息弹窗-->
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
  import {queryTransaction,getIsBind,startOrStopTransaction} from '@/api/my'

  export default {
    name: "trade",
    data() {
      return {
        time:3* 60 * 60 * 1000,
        startFalse:false,
        isBindText: false,
        isShowList:'none',
        isShowForm:'none',
        myList: [],
        noData: false,
        query: {
          username: '',
          jyspassword: ''
        },
        fitterPopup: false,
        lists: [],
      }
    },
    computed: {},
    mounted() {
      this.onLoad()
    },
    methods: {
      onLoad() {
        let params = {
          userid: this.$store.getters.userId,
        }
        getIsBind(params).then(res => {
          if (res.resultCode == 1) {
            this.isBindText=res.resultBody.isbind
            /*如果isbind为true执行脚本列表*/
            if(this.isBindText){
              this.queryScript()
                this.isShowList='block'//脚本列表显示
                this.isShowForm='none'//绑定表单隐藏
            }else{
                this.isShowList='none'
                this.isShowForm='block'
            }
          }
        })
      },
      /*查询脚本列表*/
      queryScript() {
        queryTransaction().then(res => {
          if (res.resultCode == 1) {
            this.myList = this.myList.concat(res.resultBody)
            if (this.myList.length === 0) {
              this.noData = true
            }
          }
        })
      },
      /*倒计时按钮*/
      /*countdownBtn(item){
        let params = {
          transactionid: item.id,
          userid: this.$store.getters.userId,
          id: ''
        }
        startOrStopTransaction(params).then(response => {
          if (response.resultCode == 1) {
            console.log('倒计时按钮')
          }
        })
      },*/
      /*启动按钮*/
      startBtn(item){
        /*this.$refs.countDownTime.start();*/
          this.startFalse=true
        let params = {
          transactionid: item.id,
          userid: this.$store.getters.userId,
        }
        startOrStopTransaction(params).then(response => {
          if (response.resultCode == 1) {
            console.log('启动按钮')
          }
        })
      },
      countDownFinish(){

      },
      queryMsgList() {
        this.fitterPopup = true//显示提示弹窗
        messagelist().then(response => {
          this.lists = response.resultBody
          setTimeout(() => {
            this.onLoad()
            this.fitterPopup = false
          }, 1500)
        })
      },
      /*绑定按钮*/
      bindBtn() {
        if (!this.query.username) {
          this.$dialog.toast({
            mes: '请输入手机号或者邮箱'
          })
          return
        }
        if (!this.query.jyspassword) {
          this.$dialog.toast({
            mes: '请输入交易密码'
          })
          return
        }
        let params = {
          username: this.query.username,
          userid: this.$store.getters.userId,
          jyspassword: this.query.jyspassword
        }
        saveOrUpdateCoin(params).then(response => {
          if (response.resultCode == 1) {
            this.queryMsgList()
          }
        })
      }
    }
  }
</script>

<style scoped>
  .home-wrap {
    min-height: 100%;
    background: #121619;
    position: relative;
    padding: 20px 0 60px;
    box-sizing: border-box;
  }

  .box-container {
    width: 100%;
  }

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
    padding: 10px 15px;
    font-size: 13px;
    color: #999;
    border-bottom: 1px dotted #444;
  }

  .p-order-item:not(:last-child) {
    border-bottom: 1px dotted #444;
  }

  .p-order-item .no {
    font-size: 14px;
    font-weight: bold;
  }

  .p-order-item .name {
    margin-right: 3px;
  }
  .p-order-item .msg{margin-top: 7px}
  .p-order-item .msg p {
    margin-bottom: 5px;
  }

  .p-order-item .price {
    color: #FE4444;
  }

  .p-order-item .state {
    color: #37A6F5
  }
  .bottom-btns{
    text-align: right;
    color: #666;
    margin-bottom: 5px;
    display: flex;
    flex-direction: row-reverse;
    align-items: center;
  }
  .bottom-btns .time-btn{border: 1px solid #ddd;color: #333;}
  .bottom-btns .countTime{display: flex;align-items: center;font-size: 12px;color: #999;}
  .bottom-btns .countTime .name{
    display: block;
    line-height: 17px;
    font-size: 12px;
  }
  .bottom-btns .countTime .van-count-down{color: #999;}
  .bottom-btns button{
    border: 1px solid #eee;
    border-radius: 4px;
    color: #fff;
    font-size: 12px;
    margin-left: 10px;
    height: 25px;
  }

  .login-box {
    margin-top: 130px;
    height: 400px;
  }

  .fitter-popup-box {
    width: 100%;
    height: 150px;
    background: #fff;
    padding: 15px;
    box-sizing: border-box;
    border-radius: 4px;
    text-align: center;
  }

  .fitter-popup-box .list-item {
    margin-bottom: 3px;
  }

  /*.fitter-popup-box .list-item:not(:first-child) {
    visibility: hidden;
    animation: listAni 2s ease both;
  }*/

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
    animation-delay: 15s;
  }

  .list-item:nth-child(5) {
    animation-delay: 20s;
  }

  .list-item:nth-child(6) {
    animation-delay: 25s;
  }
</style>
