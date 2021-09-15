<template>
  <div>
    <h1>This is Home Page</h1>
    <router-link to='/users'>ahiahi</router-link>
    <h1>{{ user.name }}</h1>
    <div v-for="column in user.columns" :key="column.id">
      <h2>{{ column.name }}</h2>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  props: ['current_user'],
  data () {
    return {
      user: {}
    }
  },
  created() {
    axios
      .get("api/users?id=${this.current_user.id}.json")
      .then(response => (this.user = response.data))

    console.log(this.user.name)
  }
}
</script>

<style scoped>

</style>
