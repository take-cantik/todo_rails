<template>
  <div id="app">
    <h1>~~~以下Vueです~~~</h1>
    <Header />
    <div>
      <div v-if="current_user">
        <h1>{{ current_user.name }}</h1>
      </div>
      <router-view />
    </div>
  </div>
</template>

<script>
import Header from './packs/components/Header.vue';
import axios from 'axios';

export default {

  components: {
    Header
  },
  data () {
    return {
      current_user: {}
    }
  },
  created () {
    axios
      .get('api/auth.json')
      .then(response => (this.current_user = response.data))
  },
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
