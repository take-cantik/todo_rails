<template>
  <div>
    <h1>This is Home Page</h1>
    <router-link to='/users'>ahiahi</router-link>
    <div v-for="column in columns" :key="column.id">
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
      columns: {}
    }
  },
  created() {
    axios
      .get(`api/columns?id=${this.current_user.id}`)
      .then(response => (this.columns = response.data))
  }
}
</script>

<style scoped>

</style>
