<template>
  <div class="page-about">
    <yd-navbar title="我的任务" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <van-pull-refresh v-model="refreshing" @refresh="onRefresh">
      <van-list
        v-model="loading"
        :finished="finished"
        finished-text="没有更多了"
        @load="onLoad"
      >
        <ul class="share-list">
          <li class="item" v-for="(item,index) in list" :key="index">
            <h3 class="title">分享任务</h3>
            <div class="msg">
              <p>已分享任务：<span v-text="item.count">0</span></p>
              <p>完成可领取积分：<span class="price" v-text="item.integral">0</span></p>
            </div>
          </li>
          <ul>
          </ul>
        </ul>
      </van-list>
    </van-pull-refresh>
  </div>
</template>

<script>
    export default {
        name: "Task",
      data() {
        return {
          loading: false,
          finished: false,
          refreshing: false,
          list: [
            {
              count: '0',
              integral: '0'
            }
          ]
        }
      },
      methods:{
        onLoad() {
          setTimeout(() => {
            if (this.refreshing) {
              this.list = [];
              this.refreshing = false;
            }
            for (let i = 0; i < 5; i++) {
              this.list.push(this.list.length + 1);
            }
            this.loading = false;

            if (this.list.length >= 5) {
              this.finished = true;
            }
          }, 1000);
        },
        onRefresh() {
          // 清空列表数据
          this.finished = false;

          // 重新加载数据
          // 将 loading 设置为 true，表示处于加载状态
          this.loading = false;
          this.onLoad();
        }
      }
    }
</script>

<style scoped>
  .share-list{
    margin: 15px;
  }
  .share-list .item{
    background: #fff;
    font-size: 13px;
    color: #666;
    margin-bottom: 10px;
    box-shadow: 0 0 5px rgba(0,0,0,.1);
    border-radius: 6px;
  }
  .share-list .item .title {
    font-size: 15px;
    color: #333;
    font-weight: bold;
    border-bottom: 1px solid #eee;
    padding: 7px 15px;
  }
  .share-list .item .msg {padding: 7px 15px;}
  .share-list .item .msg p {margin-bottom: 5px;}
  .share-list .item .price {color: #FE4444;}
</style>
