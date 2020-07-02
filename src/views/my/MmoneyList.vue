<template>
  <div class="mainbody">
    <ul class="flex flex--between taocan">
      <li class="flex__item"
          v-for="(x,index) in model.list"
          :key="index"
          @click="selectTaocan(x)"
          :class="{active: x.ID === taocan.ID}">
        <p>{{x.NAME}}
        <p>
        <p><span class="money-n">{{x.MONEY}}</span><span class="money-u">/元</span></p>
        <div class="bedge">{{x.Memo}}</div>
      </li>
      <li class="flex__item placeholder"
          v-for="x in 2"
          :key="'p' + x"></li>
    </ul>
    <div class="money-wrapper">
      <div class="money-in">
        <div class="type"
             v-for="x in model.listBank"
             :key="x.ID"
             :class="{ opened: x.ID === bank.ID}">
          <div class="type-title kd-container"
               @click="selectBank(x)">
            <i class="icon icon--2"
               :class="'icon-' + x.ATTR6"></i>
            <h5 class="title">{{x.Name}}</h5>
          </div>
          <div class="type-body method-wyzz"
               v-show="bank.ID === x.ID">
            <div class="bank-order-list">
              <p>
                <span class="bank-order__title">收款银行：</span>
                <span class="bank-order__text">{{x.Bank_Detail_Name}}
                <a class="bank-order-item-copy blue"
                   @click="copy(x.Bank_Detail_Name)">复制</a>
                </span>
              </p>
              <p>
                <span class="bank-order__title">收款账号：</span>
                <span class="bank-order__text">
                {{x.Bank_Account_Number}}
                  <a class="bank-order-item-copy blue"
                     @click="copy(x.Bank_Account_Number)">复制</a></span>
              </p>
              <p><span class="bank-order__title">收 款 人：</span>
                <span class="bank-order__text">{{x.Bank_Account_Name}}
                  <a class="bank-order-item-copy blue"
                     @click="copy(x.Bank_Account_Name)">复制</a></span>
              </p>
              <p>
                <span class="bank-order__title blue">充值金额：</span>
                <span class="bank-order__text blue"
                      v-if="taocan.MONEY">{{ taocan.MONEY }}元</span>
              </p>
            </div>
            <button class="btn-lg" type="button" @click="pay(x)">我已充值</button>
            <div>
              <div class="nostyle notices-list">
                <p>{{x.ATTR2}}</p>
                <p>{{x.ATTR3}}</p>
              </div>
            </div>
          </div>
        </div>

        <div class="type"
             v-for="x in model.listPay"
             :key="x.ID"
             :class="{ opened: x.ID === bank.ID}">
          <div class="type-title kd-container"
               @click="selectBank(x, 1)"><i class="icon icon--2"
                                            :class="'icon-' + x.ATTR6"></i>
            <h5 class="title">{{x.ATTR1}}</h5>
            <p class="info">{{x.ATTR2}}</p>
          </div>
          <div class="type-body method-zfbqrcode"
               v-show="bank.ID === x.ID">
            <figure class="qrcode"><img :src="x.Url"></figure>
            <div class="notices-list--qrcode">{{x.ATTR4}}</div>

            <div class="kd-field flex flex--mc"><label class="kd-field-title">您的{{x.Name}}账号：</label>
              <div class="kd-textinput text">
                <input type="text"
                       :placeholder="'请输入您的'+ x.Name + '账号'"
                       v-model="x.remark"></div>

            </div>
            <p style="margin-bottom: 20px;">
              <span class="bank-order__title blue">充值金额：</span>
              <span class="bank-order__text blue"
                    v-if="taocan.MONEY">{{ taocan.MONEY }}元</span></p>
            <button class="btn-lg"
                    type="button"
                    @click="pay(x, 1)">我已充值
            </button>
            <div>
              <div class="nostyle notices-list">
                <p>{{x.ATTR2}}</p>
                <p>{{x.ATTR3}}</p>
              </div>
            </div>
          </div>
        </div>

        <div class="type">
          <div class="type-title kd-container"
               @click="selectKefu()"><i class="icon icon--2 icon-payservice"></i>
            <h5 class="title">人工客服</h5>
            <p class="info"></p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
  import * as axios from "@/api";

  export default {
    name: "MoneyIn",
    data() {
      return {
        taocan: {},
        bank: {},
        model: {
          list: [],
          listBank: [],
          listPay: []
        }
      };
    },
    mounted() {
      this.getInfo();
    },
    methods: {
      selectTaocan(item) {
        this.taocan = item;
      },
      async pay(item, type = 0) {
        if (this.taocan.MONEY > 0) {
          if (type == 1 && !item.remark) {
            this.$msg({
              text: "请输入您的" + item.Name + "账号",
              type: "warning"
            });
            return;
          }
          const result = await axios.apiPostReacharge({
            t: type,
            id: this.bank.ID,
            payment_amount: this.taocan.MONEY,
            remark: item.remark,
            pid: this.taocan.ID,
            pn: this.taocan.NAME
          });
          let data = result.data;
          if (data && data.ORDER_NO) {
            this.$router.push({name: "MoneyInRecord"});
          } else {
            this.$msg({
              type: "error",
              text: data.D
            });
          }
        } else {
          this.$msg({
            text: "请先选择套餐",
            type: "warning"
          });
        }
      },
      selectBank(item) {
        if (item.ID === this.bank.ID) {
          this.bank = {};
          return;
        }
        this.bank = item;

      },
      selectKefu() {
        this.bank = {};
        this.$router.push({name: "Contact"});
      },
      async getInfo() {
        const result = await axios.apiGetReacharge();
        if (result.data) {

          this.model = result.data;
          if (this.model != null) {
            if (this.model.list != null) {
              this.taocan = this.model.list[0];
            }
          }
        }


        console.log(this.model.list[0]);
      },
      copy(str) {
        // 复制
        window.copy(str);
      }
    }
  };
</script>

<style lang="scss" scoped>
  .mainbody {
    width: 88%;
    margin: 0 auto;
    padding: 60px 40px;
  }

  .notices-list {
    color: red;
    text-align: center;
  }

  .taocan {
    width: 94%;
    margin: 0 auto;

    li {
      width: 30%;
      background: #56b3f6;
      color: #fff;
      font-weight: bold;
      border-radius: 8px;
      border: 3px solid #95d3ff;
      font-size: 32px;
      text-align: center;
      position: relative;
      overflow: initial;
      margin-bottom: 40px;
      padding: 22px 0 10px;

      &.active {
        background: darken(
          $color: (
            #56b3f6
          ),
          $amount: 20
        );
      }

      .bedge {
        background: #ff3c3c;
        position: absolute;
        right: -3px;
        font-size: 12px;
        top: -20px;
        padding: 0 10px;
        border-radius: 10px;
      }

      .money-n {
        font-size: 50px;
      }

      .money-u {
        font-size: 20px;
      }
    }
  }

  .blue {
    color: #56b3f6;
  }

  /* copy */
  .money-in {
    border-left-width: 0;
    border-right-width: 0;
  }

  .money-in .type {
    background: #fff;
  }

  .money-in .type-title {
    display: block;
    border-bottom: 1px solid #ced2d4;
    padding: 32px 0 20px 116px;

    position: relative;
    cursor: pointer;
  }

  .money-in .type:last-child .type-title {
    border-bottom-width: 0;
  }

  .money-in .type-title .icon {
    font-size: 96px;
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    left: 0;
  }

  .money-in .type-title .title {
    display: block;
    font-size: 32px;
    color: #666;
    font-weight: 400;
  }

  .money-in .type-title .info {
    display: block;
    font-size: 24px;
    color: #999;
    margin-top: 10px;
    padding-right: 32px;
  }

  .money-in .type-title:after {
    font-family: "iconfont2";
    content: "\EA33";
    color: #b1b7ba;
    position: absolute;
    right: 32px;
    top: 50%;
    transform: translateY(-50%);
  }

  .icon-payunion1,
  .money-in .icon-payunion {
    width: 96px;
    height: 96px;
    background: url(../assets/iconfont2/images/union-pay.svg) no-repeat 50%;
  }

  .money-in .icon-payunion:before {
    content: "";
  }

  .money-in__head {
    padding: 9px 32px;
  }

  .money-in__title {
    vertical-align: middle;
  }

  .money-in__head .icon {
    color: #ff8082;
    font-size: 90px;
    height: 90px;
    line-height: 90px;
    vertical-align: middle;
    margin-right: 8px;
  }

  .icon-online-moneyin:before {
    font-family: "iconfont2";
    content: "\EF75";
  }

  .icon-offline-moneyin:before {
    font-family: "iconfont2";
    content: "\EF76";
  }

  .money-in .opened .type-title:after {
    transform: rotate(90deg);
  }

  .money-in-closed {
    font-size: 32px;
    padding: 32px 16px;
    line-height: 1.2;
    color: red;
  }

  .money-in-closed .icon {
    font-size: 100px;
    float: left;
    margin: -10px 16px 0;
  }

  .type-body {
    font-size: 24px;
    line-height: 2;
    padding: 20px 0 10px;
  }

  .bank-order-item-copy {
    margin-left: 20px;
  }

  .method-zfbqrcode {
    text-align: center;

    .kd-field {
      margin: 30px 10px 20px;
    }

    .kd-textinput {
      box-shadow: inset 0 0 4px #bbb;
      border-radius: 10px;
      background: #fdfbfb;
      flex: 1 1 0;

      input {
        text-indent: 10px;
        width: 100%;
        background: transparent;
      }
    }
  }

  .qrcode img {
    max-width: 80%;
  }
</style>
