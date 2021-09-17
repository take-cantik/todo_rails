<template>
  <div id="app">
    <h1>~~~以下Vueです~~~</h1>
    <Header />
    <div>
      <div v-if="current_user">
        <h1>{{ current_user.name }}</h1>
      </div>
      <router-view
        :current_user = "current_user"
      />
    </div>
  </div>
</template>

<script>
import Header from "./packs/components/Header.vue";
import axios from "axios";

export default {
  components: {
    Header
  },
  data() {
    return {
      current_user: {}
    };
  },
  created() {
    this.current_user = store.dispatch('auth/googleLogin')
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
