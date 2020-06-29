<template></template>
<script>
  import api from '@/api'

  export default {
    mounted(){
      api.account.logout().then(response=>{
        if(response.code==200) {
          this.$store.dispatch('logout').then(() => {
            this.$router.push("/login")
          })
        }
      })

    }
  }
</script>
