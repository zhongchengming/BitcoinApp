<template>
  <div class="bottom-distance">
    <div class="trade-box">
      <p v-if="noData" class="no-data">
        暂无数据
      </p>
      <template v-else>
        <ul class="trade-list">
          <li class="item" v-for="(item,index) in myList" :key="index">
            <img class="pic" :src="item.jysurl">
            <div class="item-info">
              <p>{{item.jysname}}</p>
              <yd-button type="primary" @click.native="bindBtn(item)">绑定</yd-button>
            </div>
          </li>
        </ul>
      </template>
    </div>
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
      <yd-tabbar-item title="交易" active link="">
        <yd-icon name="discount" slot="icon" size="1.5rem"></yd-icon>
      </yd-tabbar-item>
    </yd-tabbar>
  </div>
</template>

<script>
  import {queryAlljys} from '@/api/trade'

  export default {
    name: "Index",
    data() {
      return {
        noData:false,
        myList: []
      }
    },
    mounted() {
      this.queryTradeList()
    },
    methods:{

        /*查询脚本列表*/
        queryTradeList() {
          queryAlljys().then(res => {
            if (res.resultCode == 1) {
              this.myList = this.myList.concat(res.resultBody)
              if (this.myList.length === 0) {
                this.noData = true
              }
            }
          })
        },
      bindBtn(item){
          if(item.isable==0){
            this.$router.push('/trade/next')
          }
          if(item.isable==1){
            this.$dialog.toast({ mes: item.message || '出错了' })
          }
      }
    }
  }
</script>

<style scoped>
  .bottom-distance {
    min-height: 100%;
    background: #121619;
    padding: 20px 0 60px;
    box-sizing: border-box;
  }
  .trade-list{
    padding: 0 15px;
  }
  .trade-list .item{
    position: relative;
    height: 85px;
    background: #444;
    border-radius: 6px;
    margin-bottom: 10px;
  }
  .trade-list .item .pic{
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    border-radius: 6px;
    z-index: 0;
  }
  .item-info{
    position: absolute;
    top: 0;
    left: 0;
    z-index: 1;
    width: 100%;
    height: 100%;
    color: #979797;
    border-radius: 6px;
    padding:12px;
    box-sizing: border-box;
    text-align: center;
    font-size: 14px;
  }
  .item-info .yd-btn-primary{
    margin-top: 10px;
    background-color: transparent;
    border:1px solid #56b3f6;
    border-bottom: 2px solid #56b3f6;
    height: 25px;
    line-height: 25px;
    padding: 0 15px;
    color: #56b3f6;
  }
</style>
