<template>
  <div class="page-about">
    <yd-navbar title="我的任务" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <div class="container">
      <p v-if="noData" class="no-data">暂无数据</p>
      <ul class="share-list" v-else>
        <li class="item" v-for="(item,index) in myList" :key="index">
          <div class="title">
            <h3>{{item.title}}</h3>
            <p class="time" v-text="item.creattime"></p>
          </div>
          <div class="msg" v-html="item.content"></div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
    import {queryArticle} from '@/api/common/user'

    export default {
        name: "Task",
        data() {
            return {
                myList: [],
                noData: false,
                list: [
                    {
                        count: '0',
                        integral: '0'
                    }
                ]
            }
        },
        mounted() {
            this.queryCulture()
        },
        methods: {
            queryCulture() {
                let params = {
                    type: '005'
                }
                queryArticle(params).then(response => {
                    if (response.resultCode == 1) {
                        this.myList = response.resultBody
                        // 如果没有数据，显示暂无数据
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

  .share-list {
    margin: 15px;
  }

  .share-list .item {
    background: #fff;
    font-size: 13px;
    color: #666;
    margin-bottom: 10px;
    box-shadow: 0 0 5px rgba(0, 0, 0, .1);
    border-radius: 6px;
  }

  .share-list .item .title {
    font-size: 12px;
    border-bottom: 1px solid #eee;
    padding: 7px 15px;
    text-align: center;
  }
  .share-list .item .title h3{
    font-size: 13px;
    color: #333;
    font-weight: bold;
    margin-bottom: 5px;
  }
  .share-list .item .time{
    color: #9a6e3a;
    text-align: right;
  }

  .share-list .item .msg {
    padding: 10px 15px;
    font-size: 12px;
  }

  .share-list .item .msg p {
    margin-bottom: 5px;
  }

</style>
