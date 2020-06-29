<template>
  <div>
    <div class="my-work-list">
      <yd-cell-group>
        <yd-cell-item>
          <span class="name" slot="left">经纪人类型</span>
          <span slot="right" v-text="category[agent.agentType]">中介</span>
        </yd-cell-item>
        <yd-cell-item arrow>
          <span class="name" slot="left">隶属公司</span>
          <yd-input slot="right" type="text" v-model="agent.company" placeholder=""></yd-input>
        </yd-cell-item>
        <yd-cell-item arrow @click.native="selectArea = true">
          <span class="name" slot="left">所在地区</span>
          <input slot="right" type="text" readonly
                 :value="`${agent.provinceName}${agent.cityName}${agent.districtName}`" placeholder=""/>
        </yd-cell-item>
        <yd-cell-item arrow>
          <span class="name" slot="left">详细地址</span>
          <yd-input slot="right" type="text" v-model="agent.companyAddress" placeholder=""></yd-input>
        </yd-cell-item>
        <yd-cell-item arrow>
          <span class="name" slot="left">公司联系电话</span>
          <yd-input slot="right" type="text" v-model="agent.companyPhone" placeholder=""></yd-input>
        </yd-cell-item>
        <yd-cell-item arrow>
          <span class="name" slot="left">服务片区</span>
          <yd-input slot="right" type="text" v-model="agent.agentSite" placeholder=""></yd-input>
        </yd-cell-item>
      </yd-cell-group>
      <div class="my-work-btns">
        <button @click="modify" v-show="saveBtn">保存</button>
        <button class="cancel-btn" @click="goBack()">取消</button>
      </div>
    </div>
    <yd-cityselect v-model="selectArea"
                   :provance="agent.province"
                   :city="agent.city"
                   :area="agent.district"
                   :callback="onAreaSelect" :items="district"></yd-cityselect>
  </div>
</template>

<script>
  import District from '@/api/common/area'
  import api from '@/api'

  export default {
    name: "index",
    mounted() {
      this.load()
    },
    data() {
      return {
        saveBtn: false,
        selectArea: false,
        district: District,
        category: [
            '中介',
            '物业'
        ],
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
          avatar: ''
        }
      }
    },
    methods: {
      onAreaSelect(ret) {
        console.log(ret)
        this.agent.province = ret.itemValue1
        this.agent.provinceName = ret.itemName1
        this.agent.city = ret.itemValue2
        this.agent.cityName = ret.itemName2
        this.agent.district = ret.itemValue3
        this.agent.districtName = ret.itemName3
      },
      goBack() {
        this.$router.push('/my')
      },
      load() {
        api.my.get().then(response => {
          if (response.code == 200) {
            this.agent = response.data
            this.agent.birthday = this.getFormatDate(this.agent.birthday)
            this.saveBtn = true
          }
        })
      },
      getFormatDate(value) {
        if (value)
          return this.$moment(value).format('YYYY-MM-DD')
        return ''
      },
      modify() {
        api.my.modify(this.agent).then(response => {
          if (response.code == 200) {
            this.$dialog.toast({
              mes: response.message,
              icon: 'success'
            });
          }
        })
      },
    }
  }
</script>
