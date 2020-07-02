<template>
  <div class="page-about white">
    <yd-navbar title="充值" fixed>
      <router-link to="/" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <div class="money-page">
      <ul class="package-list">
        <li>
          <p>包月</p>
          <p>1000元</p>
        </li>
      </ul>
      <ul class="money-list">
        <li class="item">
          <div class="title" @click="backTextBox=!backTextBox">
            <div class="left">
              <img class="icon" slot="icon" src="@/assets/images/union-pay.svg">
              <span>中国农业银行</span>
            </div>
            <i class="icon iconfont iconiconfontjiantou5 arrow"></i>
          </div>
          <div v-show="backTextBox" class="back-detail-box">
            <p class="item-text">
              <span class="bank-title">收款银行：</span>
              <span class="bank-text" v-text="listBank.cardname">
                农业银行
              </span>
              <button class="copy-btn copy-cardname" :data-clipboard-text="listBank.cardname"
                      @click="copyText('cardname')">复制
              </button>

            </p>
            <p class="item-text">
              <span class="bank-title">收款账号：</span>
              <span class="bank-text" v-text="listBank.cardno">
                6228480318401674276
              </span>
              <button class="copy-btn copy-cardno" :data-clipboard-text="listBank.cardname"
                      @click="copyText('cardno')">复制
              </button>
            </p>
            <p class="item-text">
              <span class="bank-title">收 款 人：</span>
              <span class="bank-text" v-text="listBank.username">
                董梦强
              </span>
              <button class="copy-btn copy-username" :data-clipboard-text="listBank.cardname"
                      @click="copyText('username')">复制
              </button>
            </p>
            <p class="item-text">
              <span class="bank-title">充值金额：</span>
              <span class="bank-text" v-text="listBank.money" style="color:darkred;">1000</span>
            </p>
            <button class="btn-blue">我已充值</button>
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
      <!--<yd-cell-group class="money-list">
        <yd-cell-item arrow>
          <img class="icon" slot="icon" src="@/assets/images/union-pay.svg">
          <span slot="left">人工客服</span>
        </yd-cell-item>

        <yd-cell-item arrow>
         &lt;!&ndash; <yd-icon slot="icon" name="order"></yd-icon>&ndash;&gt;
          <i slot="icon" class="icon iconfont iconkefu"></i>
          <span slot="left">人工客服</span>
        </yd-cell-item>
      </yd-cell-group>-->
    </div>
  </div>
</template>

<script>
  import Clipboard from 'clipboard'
  export default {
    name: "money",
    data() {
      return {
        backTextBox: false,
        listBank:{
          cardname:'农业银行',
          cardno:'6228480318401674276',
          username:'董梦强',
          money:'1000'
        }
      }
    },
    methods:{
      // 复制
      copyText(str) {
        if(str=='cardname'){
          var clipboard = new Clipboard('.copy-cardname')
        }else if(str=='cardno'){
          var clipboard = new Clipboard('.copy-cardno')
        }else if(str=='username'){
          var clipboard = new Clipboard('.copy-username')
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
      goKefu(){
        this.$router.push({ path:'/service'})
      }
    }
  }
</script>

<style scoped>
  .blue{color: #56b3f6;margin-left: 5px}
  .money-page {
    padding: 20px;
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
    margin-bottom: 10px;
    padding: 12px;
  }

  .money-list .item .title {
    border-bottom: 1px solid #d9d9d9;
    padding: 10px 0;
    display: flex;
    align-items: center;
    justify-content: space-between;
    font-size: 14px;
    color: #333;
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
    color: #999;
  }
  .back-detail-box{
    padding: 12px 0;
  }
  .item-text{
    display: flex;
    align-items: center;
    font-size: 12px;
    color: #666;
    margin-bottom: 5px;
  }
  .item-text .bank-text{margin: 0 5px;}
  .copy-btn{color: #24a7ff;}
  .btn-blue{
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
.notices-list{
  font-size: 10px;
  color: red;
  text-align: center;
}
  /*.money-list /deep/.yd-cell:after{
    border-bottom: none;
  }
  .money-list /deep/.yd-cell-item:after{
    border-bottom: 1px solid #d9d9d9;
  }*/
</style>
