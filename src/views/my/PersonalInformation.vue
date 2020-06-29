<template>
  <div>
    <div class="my-top">
      <div class="title-box" @click="titleModel=true">
        <span class="name">头像</span>
        <div class="right">
          <img class="title" :src="agent.avatar?agent.avatar:'/static/images/avatar.png'"/>
          <i class="icon iconfont icon-fanhui1 go-icon"></i>
        </div>
      </div>
    </div>
    <div class="my-list">
      <section class="section">
        <yd-cell-group>
          <yd-cell-item>
            <span class="name" slot="left">姓名</span>
            <span slot="right" v-text="agent.agentName">叶小爱</span>
          </yd-cell-item>
          <yd-cell-item>
            <span class="name" slot="left">手机号</span>
            <span slot="right" v-text="agent.mobilePhone">18812341234</span>
          </yd-cell-item>
          <yd-cell-item arrow>
            <span class="name" slot="left">生日</span>
            <yd-datetime class="my-birth-text" slot="right" :init-emit="false" :callback="modify"
                         start-date="1900-01-01" :end-date="endDate" type="date" v-model="agent.birthday"></yd-datetime>
          </yd-cell-item>
          <yd-cell-item arrow @click.native="goPassword()">
            <span class="name" slot="left">修改密码</span>
          </yd-cell-item>
          <yd-cell-item arrow @click.native="designerModel=true">
            <span class="name" slot="left">推荐来源</span>
            <!--<yd-input slot="right" type="text" v-model="agent.recommendOrg" placeholder=""></yd-input>-->
            <span slot="right" v-text="agent.recommendOrg"></span>
          </yd-cell-item>
          <yd-cell-item arrow @click.native="proofModel=true">
            <span class="name" slot="left">个人资质证明</span>
            <span slot="right">
             <img class="license-img" :src="agent.proofImg"/>
           </span>
          </yd-cell-item>
        </yd-cell-group>
      </section>
      <div class="title-model-btns">
        <button class="cancel-btn" @click="logout()">退出登录</button>
      </div>
    </div>
    <yd-popup v-if="titleModel" v-model="titleModel" position="bottom" height="100%" class="title-model">
      <div class="title-model-content">
        <div class="my-upload-pic">
          <img class="portrait" :src="agent.avatar?agent.avatar:'/static/images/avatar.png'"/>
        </div>
        <div class="title-model-btns">
          <div class="upload-wrap">
            <vue-core-image-upload
              :class="['btn', 'btn-primary']"
              :crop="'local'"
              inputOfFile="file"
              compress="80"
              @imageuploaded="imageuploaded"
              :max-file-size="10485760"
              :cropBtn="{'ok':'确认生成','cancel':'重新选择'}"
              url="/api/storage/idj/single">
              <button>修改头像</button>
            </vue-core-image-upload>
          </div>
          <button class="cancel-btn" @click="titleModel= false">取消</button>
        </div>
      </div>
    </yd-popup>
    <yd-popup v-if="proofModel" v-model="proofModel" position="bottom" height="100%" class="title-model">
      <div class="title-model-content">
        <div class="my-upload-pic">
          <img class="portrait" :src="agent.proofImg"/>
        </div>
        <div class="title-model-btns">
          <div class="upload-wrap">
            <vue-core-image-upload
              :class="['btn', 'btn-primary']"
              inputOfFile="file"
              compress="80"
              @imageuploaded="proofuploaded"
              :max-file-size="10485760"
              :cropBtn="{'ok':'确认生成','cancel':'重新选择'}"
              url="/api/storage/idj/single">
              <button>修改资质证明</button>
            </vue-core-image-upload>
          </div>
          <button class="cancel-btn" @click="proofModel= false">取消</button>
        </div>
      </div>
    </yd-popup>
    <yd-popup v-if="designerModel" v-model="designerModel" position="center" width="100%" height="100%"
              class="designer-model">
      <div class="designe-model-content">
        <div class="input-wrap">
          <yd-input type="text" v-model="agent.recommendOrg" placeholder="请输入推荐来源" class="input-text"></yd-input>
        </div>
        <div class="my-work-btns">
          <button @click="modify">保存</button>
          <button class="cancel-btn" @click="goBack()">取消</button>
        </div>
      </div>
    </yd-popup>
  </div>
</template>

<script>
  import VueCoreImageUpload from 'vue-core-image-upload'
  import api from '@/api'

  export default {
    name: "index",
    components: {
      'vue-core-image-upload': VueCoreImageUpload
    },
    mounted() {
      this.load()
    },
    data() {
      return {
        titleModel: false,
        designerModel: false,
        proofModel:false,
        endDate:this.$moment().format('YYYY-MM-DD'),
        agent: {
          agentName: '',
          company: '',
          companyAddress: '',
          companyPhone: '',
          proofImg: '',
          birthday: '',
          mobilePhone: '',
          agentType: '',
          province: '',
          provinceName: '',
          city: '',
          cityName: '',
          district: '',
          districtName: '',
          agentSite: '',
          avatar: '',
          recommendOrg: ''
        }
      }
    },
    methods: {
      goBack() {
        this.designerModel = false
      },
      goPassword() {
        this.$router.push('/forgot/password')
      },
      imageuploaded(res) {
        if (res.code == 200) {
          this.agent.avatar = res.data.url;
          this.modify()
        }
      },
      proofuploaded(res) {
        if (res.code == 200) {
          this.agent.proofImg = res.data.url;
          this.modify()
        }
      },
      logout() {
        this.$router.push('/logout')
      },
      getFormatDate(value) {
        if (value)
          return this.$moment(value).format('YYYY-MM-DD')
        return ''
      },
      modify() {
        api.my.modify(this.agent).then(response => {
          if (response.code == 200) {
            this.designerModel = false
          }
        })
      },
      load() {
        api.my.get().then(response => {
          if (response.code == 200) {
            this.agent = response.data
            this.agent.birthday = this.getFormatDate(this.agent.birthday)
          }
        })
      }
    }
  }
</script>

<style scoped>
  .g-core-image-upload-btn {
    width: 100%;
  }

  .my-top {
    background: #fff;
    padding: 10px 0;
  }

  .title-box {
    display: flex;
    align-items: center;
    padding: 0 12px 0 15px;
    justify-content: space-between;
  }

  .title {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    margin-right: 7px;
  }

  .title-box .name {
    font-size: 14px;
    color: #333;
  }

  .title-box .right {
    display: flex;
    font-size: 18px;
    color: #c9c9c9;
    align-items: center;
  }

  .title-model .yd-popup-content > div {
    height: 100%;
  }

  .title-model-content {
    height: 100%;
    box-sizing: border-box;
    background: #f2f2f2;
  }

  .title-model-content .my-upload-pic img {
    width: 100%;
  }

  .title-model-btns {
    padding: 10px 12px;
    text-align: center;
  }

  .title-model-btns button {
    background: #37A6F5;
    height: 40px;
    line-height: 40px;
    width: 100%;
    border-radius: 4px;
    -webkit-border-radius: 4px;
    color: #fff;
    font-size: 18px;
    margin-top: 20px;
  }

  .title-model-btns .cancel-btn {
    color: #333;
    background: #e5e5e5;
    border: 1px solid #d2d2d2;
  }

  .section {
    margin-top: 10px;
    background: #fff;
  }

  .my-list .name {
    font-size: 14px;
    color: #333;
  }

  .license-img {
    width: 25px;
    height: 25px;
  }

  .my-birth-text {
    justify-content: flex-end;
    font-size: 14px;
    color: #999;
  }

</style>
