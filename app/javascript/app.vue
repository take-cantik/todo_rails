<template>
  <div id="app">
    <h1>~~~以下Vueです~~~</h1>
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
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
