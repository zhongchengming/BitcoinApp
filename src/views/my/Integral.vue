<template>
  <div class="page-about">
    <yd-navbar title="我的积分" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
      <!--<div class="nav-fitter-text" slot="right" @click="fitterPopup= true">
        筛选<i class="icon iconfont iconshaixuan"></i>
      </div>-->
    </yd-navbar>
    <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
      <div class="container">
        <div v-if='noData' class="no-data">
          暂无数据
        </div>
        <template v-else>
          <van-list
            v-model="loading"
            :finished="finished"
            finished-text="没有更多了数据了"
            @load="onLoad"
          >
            <ul class="money-record">
              <li class="p-order-item" v-for="(item,index) in myList" :key="index">
                <div class="row">
                  <p>
                    <span class="name">充值时间：</span>
                    <span v-text="item.createtime">2018-07-08 15:13:14</span>
                  </p>
                  <p>
                    <span class="name">积分：</span>
                    <span class="price" v-text="item.integral">1000</span>
                  </p>
                </div>
              </li>
            </ul>
          </van-list>
        </template>
      </div>
    </van-pull-refresh>
    <!--筛选弹窗-->
    <!--<yd-popup v-model="fitterPopup" position="right" width="85%">
       <div class="fitter-popup-box">
         <ul class="search-box">
           <li>
             <p class="name">用户名</p>
             <yd-input v-model="query.userName"></yd-input>
           </li>
           <li>
             <p class="name">用户ID</p>
             <yd-input v-model="query.userId"></yd-input>
           </li>
           <li>
             <p class="name">起止日期</p>
             <div class="group">
               <yd-datetime type="date" v-model="query.startDate"></yd-datetime>
               <span style="margin: 0 5px;">~</span>
               <yd-datetime type="date" v-model="query.endDate"></yd-datetime>
             </div>
           </li>
         </ul>
         <div class="btns-box">
           <button class="cancenl-btn" @click="fitterPopup = false">取消</button>
           <button  @click="fitterPopup = false">确认</button>
         </div>
       </div>
    </yd-popup>-->
  </div>
</template>

<script>
  import {integralHistory} from '@/api/my'
  export default {
    name: "integral",
    data() {
      return {
        /*fitterPopup:false,
        query: {
          userName: '',
          userId:'',
          startDate: '',
          endDate:''
        }*/
          lists: [],
          page: 1,
          loading: false, // 当loading为true时，转圈圈
          finished: false, // 数据是否请求结束，结束会先显示- 没有更多了 -
          myList:[],
          noData: false, // 如果没有数据，显示暂无数据
          isLoading:false // 下拉的加载图案
      }
    },
      mounted() {
          this.load()
      },
      methods:{
          load() {
              this.loading = true
              let params={
                  userid:this.$store.state.user.userId,
                  pageSize:10,
                  pageNumber:this.page
              }
              integralHistory(params).then(res => {
                  if (res.resultCode == 1) {
                      this.loading = false
                      this.myList = this.myList.concat(res.resultBody)
                      this.page++
                      // 如果没有数据，显示暂无数据
                      if (this.myList.length === 0 && this.page === 1) {
                          this.noData = true
                      }
                      // 如果加载完毕，显示没有更多了
                      if (res.resultBody.length === 0) {
                          this.finished = true
                      }
                  }
              })
          },
          // 列表加载
          onLoad () {
              setTimeout(() => {
                  this.load()
                  this.loading = true
              }, 500)
          },
          onRefresh () {
              setTimeout(() => {
                  // 重新初始化这些属性
                  this.isLoading = false
                  this.myList = []
                  this.page = 1
                  this.loading = false
                  this.finished = false
                  this.noData = false
                  // 请求信息
                  this.load()
              }, 500)
          }
      }
  }
</script>
<style scoped>
  .no-data{
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
    padding:15px;
    background: #fff;
    font-size: 13px;
    color: #333;
  }
  .p-order-item:not(:last-child){
    border-bottom: 1px solid #eee;
  }
  .p-order-item .no {
    font-size: 14px;
    color: #333;
    font-weight: bold;
  }
  .p-order-item .name {margin-right: 3px;}
  .p-order-item .msg {padding: 10px 5px;}
  .p-order-item .msg p {margin-bottom: 5px;}
  .p-order-item .price {color: #FE4444;}
  .p-order-item .state {color: #37A6F5}
  .nav-fitter-text{color:#fff;}
/*.search-box{
  font-size: 12px;
  padding: 30px 0;
}
  .search-box li{padding:15px;}
  .search-box li:not(:last-child){border-bottom: 1px solid #eee;}
  .search-box li .name{
    font-size: 14px;
    color: #333;
    margin-bottom: 10px;
  }
.search-box li .yd-input,.search-box li .yd-datetime-input{
  background: #f7f7f7;
  border-radius: 6px;
  height: 30px;
  line-height: 26px;
  padding:2px 10px;
  box-sizing: border-box;
}
  .search-box li .group{
    display: flex;
    align-items: center;
  }
.fitter-popup-box .btns-box{
  text-align: center;
}
.fitter-popup-box .btns-box button{
  display: inline-block;
  background: #24a7ff;
  border-radius: 3px;
  color:#fff;
  padding: 7px 15px;
}
  .fitter-popup-box .btns-box .cancenl-btn{
    background: #f5f5f5;
    color: #333;
    margin-right: 20px;
  }*/
</style>
