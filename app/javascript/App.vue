<template>
  <div id="app">
    <h1>~~~以下Vueです~~~</h1>
    <Header />
    <div>
      <div>userName : {{ userName }}</div>
      <router-view />
    </div>
  </div>
</template>

<script>
import Header from "./packs/components/Header.vue";
import { mapGetters } from "vuex";

export default {
  components: {
    Header
  },
  created() {
    this.$store.dispatch('auth/googleLogin')
  },
  computed: {
    ...mapGetters({
      userId: 'auth/userId',
      userName: 'auth/userName',
    }),
  },
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
