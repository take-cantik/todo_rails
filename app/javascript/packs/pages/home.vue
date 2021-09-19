<template>
  <div>
    <h1>This is Home Page</h1>
    <router-link to='/users'>ahiahi</router-link>
    <div>userId -> {{ userId }}</div>
    <div>user.name -> {{ user.name }}</div>
    <div>user.columns -> {{ user.columns }}</div>
    <div v-for="column in user.columns" :key="column.id">
      <h2>{{ column.name }}</h2>
    </div>
  </div>
</template>

<script>
import axios from "axios";
import { mapGetters } from "vuex";

export default {
  data () {
    return {
      user: {},
    }
  },
  mounted() {
    axios
      .get(`api/users/1`)
      .then(response => (this.user = response.data))

    console.log(this.user)
  },
  computed: {
    ...mapGetters({
      userId: 'auth/userId',
      userName: 'auth/userName',
    })
  }
}
</script>

<style scoped>

</style>
