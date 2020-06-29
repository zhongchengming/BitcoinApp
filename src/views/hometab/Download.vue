<template>
  <div class="page-about">
    <yd-navbar title="APP下载" fixed bgcolor="rgba(0,0,0,.8)" height="45px" color="#fff" fontsize="15px">
      <router-link to="/" slot="left">
        <yd-navbar-back-icon color="#fff"></yd-navbar-back-icon>
      </router-link>
    </yd-navbar>
    <div class="download-page">
      <main class="mainbody">
        <img src="@/assets/images/logo_download.png" class="logo">
        <div class="app-link">
          <div class="app-link-item">
            <i class="icon iconfont iconios"></i>
            <span>iPhone下载</span>
          </div>
        </div>
        <div class="app-link" style="margin-top: 20px">
          <div class="app-link-item">
            <i class="icon iconfont iconanzhuo"></i>
            <span>android下载</span>
          </div>
        </div>
      </main>
      <div  class="slogon-footer">
        <img src="@/assets/images/slogon_blue.png">
      </div>
    </div>
  </div>
</template>

<script>
    export default {
        name: "Download"
    }
</script>

<style scoped>
  .page-about .yd-navbar:after{
    border-bottom: none;
  }
  .download-page {
    height: 100%;
    background: url(/static/images/download_bg.png) no-repeat;
    background-size: 100% 100%;
    text-align: center;
  }
  .mainbody{
    padding-top: 60px;
  }
  .app-link {
    width: 200px;
    padding: 8px 0;
    margin: 40px auto 0;
    font-size: 16px;
    border-radius: 6px;
    color: #56b3f6;
    border: 1px solid #56b3f6;
  }
  .app-link-item{
    display: flex;
    align-items: center;
    justify-content: center;
  }
  .app-link-item .icon{margin-right: 7px;}
  .slogon-footer {
    text-align: center;
    margin-top: 60px;
  }
  .slogon-footer img{width: 60%;}
</style>
