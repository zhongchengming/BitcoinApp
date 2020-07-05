<template>
  <div id="app">
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App',
    /*问题：当页面刷新时store的值丢失了。
原因：当页面刷新时，vue实例重新加载，所以store也会被重置。
解决办法：
监听 beforeunload 让页面在刷新前将数据存到 sessionStorage 中，在页面刷新时，读取 sessionStorage 中的数据到 store 中。*/
    created() {
        let state = sessionStorage.getItem("state");
        if (state) {
            this.$store.replaceState(
                Object.assign(this.$store.state, JSON.parse(state))
            );
            sessionStorage.clear();
        }
    },

    mounted() {
        window.addEventListener("beforeunload", () => {
            sessionStorage.setItem("state", JSON.stringify(this.$store.state));
        });
    },
    beforeDestroy() {
        window.removeEventListener("beforeunload");
    }
}
</script>
<style scoped>
#app{
  height: 100%;
}
</style>
