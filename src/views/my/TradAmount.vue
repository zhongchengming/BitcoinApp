<template>
  <div class="page-about">
    <yd-navbar title="交易账户金额" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>

    <div class="container">
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
  </div>
</template>

<script>
    import {queryCoin} from '@/api/my'
    export default {
        name: "MoneyRecord",
        data() {
            return {
                myList:[],
                noData:false
            }
        },
        mounted() {
            this.load()
        },
        methods:{
            load() {
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
            }
        }
    }
</script>

<style scoped>
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
    background: #fff;
    font-size: 13px;
    color: #333;
    /*margin: 10px 0;*/
  }
  .p-order-item:not(:last-child){
    border-bottom: 1px solid #f5f5f5;
  }

  .p-order-item .no {
    font-size: 14px;
    color: #333;
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
</style>
