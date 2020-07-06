<template>
  <div class="page-about">
    <yd-navbar title="积分充值记录" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <van-pull-refresh v-model="isLoading" @refresh="onRefresh">
      <div class="container">
        <p v-if='noData' class="no-data">
          暂无数据
        </p>
        <template v-else>
          <van-list
            v-model="loading"
            :finished="finished"
            finished-text="没有更多了数据了"
            @load="onLoad"
          >
            <ul class="money-record">
              <li class="p-order-item" v-for="item,index in myList" :key="index">
                <p>
                  <span class="name">充值了多少钱：</span>
                  <span class="price"><i v-text="item.value">1000</i></span>
                </p>
                <p>
                  <span class="name">充值时间：</span>
                  <span v-text="item.createtime"></span>
                </p>
              </li>
            </ul>
          </van-list>
        </template>
      </div>
    </van-pull-refresh>

  </div>
</template>

<script>
    import {dhHistory} from '@/api/my'
    export default {
        name: "WithdrawalRecord",
        data() {
            return {
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
                let params = {
                    type:0,
                    userid:this.$store.getters.userId,
                    pageSize: 10,
                    pageNumber: this.page
                }
                dhHistory(params).then(res => {
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
            onLoad() {
                setTimeout(() => {
                    this.load()
                    this.loading = true
                }, 500)
            },
            onRefresh() {
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
  .p-order-item {
    padding: 10px 20px;
    background: #fff;
    font-size: 13px;
    color: #333;
  }
  .p-order-item:not(:last-child){border-bottom: 1px solid #f5f5f5;}
  .p-order-item .name {margin-right: 3px;}
  .p-order-item p {margin-bottom: 5px;}
  .p-order-item .price {color: #FE4444;}
</style>
