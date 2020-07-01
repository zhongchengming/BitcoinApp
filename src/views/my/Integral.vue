<template>
  <div class="page-about">
    <yd-navbar title="我的积分" fixed>
      <router-link to="/my" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
      <div class="nav-fitter-text" slot="right" @click="fitterPopup= true">
        筛选<i class="icon iconfont iconshaixuan"></i>
      </div>
    </yd-navbar>
    <p class="no-data">暂无数据</p>
    <!--筛选弹窗-->
    <yd-popup v-model="fitterPopup" position="right" width="85%">
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
    </yd-popup>
  </div>
</template>

<script>

  import api from '@/api'

  export default {
    name: "integral",
    data() {
      return {
        fitterPopup:false,
        query: {
          userName: '',
          userId:'',
          startDate: '',
          endDate:''
        }
      }
    },
    methods: {
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
  .nav-fitter-text{color:#fff;}
.search-box{
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
  }
</style>
