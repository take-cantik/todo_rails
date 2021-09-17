<template>
  <div>
    <h1>This is User Page</h1>
    <div v-for="user in users" :key="user.id">
      <h2>{{ user.name }}</h2>
    </div>
    <router-link to='/'>ahiahi</router-link>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data () {
    return {
      users: {}
    }
  },
  mounted () {
    axios
      .get('/api/users')
      .then(response => (this.users = response.data))
  }
}
</script>


<style scoped>

</style>
