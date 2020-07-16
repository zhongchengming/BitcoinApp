<template>
  <div class="page-about white">
    <yd-navbar title="充值" fixed>
      <!--<div @click="goback" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </div>-->
      <router-link to="/" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <div class="money-page">
      <ul class="package-list">
        <li v-for="(item,index) in lists" @click="goDetail(item,index)" :class="{active:checkIndex == index}">
          <p v-text="item.title">包月</p>
          <p v-text="item.money">1000元</p>
        </li>
      </ul>
      <ul class="money-list">
        <li class="item" v-for="(item,$index) in cards" @click="showSeting">
          <div @click="settingEvent($event)">
            <div class="title" @click="msgClose($index)">
              <div class="left" v-if="item.type==='001'">
                <!--<img class="icon" slot="icon" src="@/assets/images/union-pay.svg">-->
                <img class="icon" slot="icon" :src="item.img?item.img:'@/assets/images/union-pay.svg'">
                <span v-text="item.bankname">中国农业银行</span>
              </div>
              <div class="left" v-if="item.type==='002'"><!--支付宝-->
                <i slot="icon" class="icon iconfont iconzhifubaozhifu" style="font-size: 25px;color: #24a7ff;"></i>
                <span v-text="item.bankname">中国农业银行</span>
              </div>
              <div class="left" v-if="item.type==='003'"><!--微信-->
                <i slot="icon" class="icon iconfont iconweixinzhifu" style="font-size: 25px;color: green;"></i>
                <span v-text="item.bankname">中国农业银行</span>
              </div>
              <i class="icon iconfont iconiconfontjiantou5 arrow"></i>
            </div>
          </div>
          <div v-show="$index==i" class="back-detail-box">
            <div v-if="item.type==='001'">
              <p class="item-text">
                <span class="bank-title">收款银行：</span>
                <span class="bank-text" v-text="item.bankname">
                农业银行
              </span>
                <!--<button class="copy-btn copy-cardname" :data-clipboard-text="listBank.bankname"
                        @click="copyText('bankname')">复制
                </button>-->
              </p>
              <p class="item-text">
                <span class="bank-title">收款账号：</span>
                <span class="bank-text" v-text="item.bankcno">
                6228480318401674276
              </span>
                <!-- <button class="copy-btn copy-cardno" :data-clipboard-text="listBank.bankcno"
                         @click="copyText('bankcno')">复制
                 </button>-->
              </p>
              <p class="item-text">
                <span class="bank-title">收 款 人：</span>
                <span class="bank-text" v-text="item.name">
                董梦强
              </span>
                <!-- <button class="copy-btn copy-username" :data-clipboard-text="listBank.name"
                         @click="copyText('name')">复制
                 </button>-->
              </p>
              <p class="item-text">
                <span class="bank-title">充值金额：￥</span>
                <span class="bank-text" v-text="listBank.money?listBank.money:'0'"></span>
              </p>
            </div>
            <div class="wechat-box" v-if="item.type==='002'">
              <img :src="item.img" />
            </div>
            <div class="wechat-box" v-if="item.type==='003'">
              <img :src="item.img" />
            </div>
            <button class="btn-blue" @click="moneyBtn(item.id,)">我已充值</button>
            <div class="notices-list">
              <p>转账成功后截图发给客服，在此页面提交充值申请。</p>
            </div>
          </div>
        </li>
        <li class="item" @click="goKefu">
          <div class="title">
            <div class="left">
              <i slot="icon" class="icon iconfont iconkefu"></i>
              <span>人工客服</span>
            </div>
            <i class="icon iconfont iconiconfontjiantou5 arrow"></i>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>
<script>
    import {queryBankList, selectBank, updateOrderApp} from '@/api/my'
    import Clipboard from 'clipboard'

    export default {
        name: "money",
        data() {
            return {
                backTextBox: false,
                listBank: {money: ''},
                w_bankid: '',//套餐id
                lists: [],
                checkIndex: '',

                cards: [],
                i: -1
            }
        },
        computed: {
            resultNum() {
                return this.num;
            }
        },
        mounted() {
            this.load()
        },
        methods: {
            goback() {
                this.$router.go(-1)
            },
            showSeting() {
                this.i = -1
            },
            settingEvent(event) {
                event.stopPropagation();
            },
            msgClose(index) {
                /*this.activeIndex = index;*/
                if (this.i !== -1) {
                    this.i = -1
                } else {
                    this.i = index
                }
            },
            load() {
                queryBankList().then(res => {
                    if (res.resultCode == 1) {
                        if (res.resultBody != null) {
                            this.lists = res.resultBody
                            this.listBank.money = res.resultBody[0].money
                            this.w_bankid = res.resultBody[0].id
                        }
                    }
                })
                selectBank().then(res => {
                    if (res.resultCode == 1) {
                        if (res.resultBody != null) {
                            this.cards = res.resultBody
                        }
                    }
                })
            },
            goDetail(item, index) {
                console.log(item)
                this.checkIndex = index
                this.listBank.money = item.money
                this.w_bankid = item.id
            },
            moneyBtn(id) {
                event.stopPropagation();
                let params = {
                    userid: this.$store.state.user.userId,
                    w_bankid: this.w_bankid,
                    w_bankidTwo:id
                }
                console.log(params)
                updateOrderApp(params).then(res => {
                    console.log(res)
                })
            },
            // 复制
            copyText(str) {
                if (str == 'bankname') {
                    var clipboard = new Clipboard('.copy-bankname')
                } else if (str == 'bankcno') {
                    var clipboard = new Clipboard('.copy-bankcno')
                } else if (str == 'name') {
                    var clipboard = new Clipboard('.copy-name')
                }
                clipboard.on('success', e => {
                    let instance = this.$toast('复制成功');
                    setTimeout(() => {
                        instance.close();
                    }, 1000);

                    // 释放内存
                    clipboard.destroy()
                })
                clipboard.on('error', e => {
                    // 不支持复制
                    let instance = this.$toast('该浏览器不支持自动复制');
                    setTimeout(() => {
                        instance.close();
                    }, 1000);

                    // 释放内存
                    clipboard.destroy()
                })
            },
            goKefu() {
                this.$router.push({path: '/service'})
            }
        }
    }
</script>

<style scoped>
  .page-about {
    height: 100%;
    background: url("/static/images/bg_money.png") no-repeat;
    background-size: 100% 100%;
    box-sizing: border-box;
  }

  .money-page {
    padding: 20px;
  }

  .package-list {
    display: flex;
  }

  .package-list li {
    width: 70px;
    background: #56b3f6;
    color: #fff;
    font-weight: 700;
    border-radius: 6px;
    border: 1px solid #95d3ff;
    font-size: 12px;
    text-align: center;
    position: relative;
    overflow: initial;
    margin-right: 10px;
    padding: 12px;
  }

  .package-list li.active {
    background-color: #0579cc;
    border: 1px solid #0579cc;
  }
.money-list{
  margin-top: 20px;
}
  .money-list .item .title {
    border-bottom: 1px solid #d9d9d9;
    padding: 10px 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 14px;
    color: #fff;
  }

  .money-list .item .title .left {
    flex: 1;
    display: flex;
    align-items: center;
  }

  .money-list .item .title .left .icon {
    margin-right: 10px;
    width: 25px;
    height: 25px;
  }

  .money-list .iconkefu {
    font-size: 25px;
    color: #ff4200;
  }

  .money-list .arrow {
    color: #fff;
  }

  .back-detail-box {
    padding: 12px 0;
  }

  .item-text {
    display: flex;
    align-items: center;
    font-size: 12px;
    color: #fff;
    margin-bottom: 5px;
  }

  .item-text .bank-text {
    margin: 0 5px;
  }

  .copy-btn {
    color: #24a7ff;
  }

  .btn-blue {
    display: inline-block;
    padding: 10px;
    width: 100%;
    box-sizing: border-box;
    color: #fff;
    font-size: 14px;
    border-radius: 4px;
    background: #24a7ff;
    text-align: center;
    margin: 10px 0;
  }

  .notices-list {
    font-size: 10px;
    color: red;
    text-align: center;
  }

 .wechat-box{
   text-align: center;
 }
  .wechat-box img{
    width: 120px;
    height: 100px;
  }
</style>
