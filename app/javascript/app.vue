<template>
  <div id="app">
    <Header />
    <div>
      <router-view />
    </div>
  </div>
</template>

<script>
import Header from './packs/components/Header.vue';

export default {
  components: {
    Header
  },
  data () {
    return {
      message: "Hello Vue!"
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
