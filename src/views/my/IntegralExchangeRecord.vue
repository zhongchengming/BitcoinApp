<template>
  <div class="page-about">
    <yd-navbar title="积分兑换记录" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <ul class="money-record">
      <li class="p-order-item" v-for="item,index in lists" :key="index">
        <p>
          <span class="name">兑换多少积分：</span>
          <span class="price"><i v-text="item.value">1000</i></span>
        </p>
        <p>
          <span class="name">兑换时间：</span>
          <span v-text="item.createtime"></span>
        </p>
      </li>
    </ul>
  </div>
</template>

<script>
    import {dhHistory} from '@/api/my'
    export default {
        name: "WithdrawalRecord",
        data() {
            return {
                lists: []
            }
        },
        mounted() {
            this.load()
        },
        methods:{
            load() {
                let params={
                    type:1,
                    userid:this.$store.getters.userId
                }
                dhHistory(params).then(res => {
                    if (res.resultCode == 1) {
                        this.lists = res.resultBody
                    }
                })
            }
        }
    }
</script>

<style scoped>
  .p-order-item {
    padding: 10px 20px;
    background: #fff;
    font-size: 13px;
    color: #333;
  }
  .p-order-item:not(:last-child){border-bottom: 1px solid #f5f5f5;}
  .p-order-item .name {margin-right: 3px;}
  .p-order-item  p {margin-bottom: 5px;}
  .p-order-item .price {color: #FE4444;}
</style>
