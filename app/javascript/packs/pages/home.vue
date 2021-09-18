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
import { mapGetters } from "vuex";

export default {
  data () {
    return {
      columns: {}
    }
  },
  mounted() {
    axios
      .get(`api/columns?id=${this.userId}`)
      .then(response => (this.columns = response.data))
  },
}
</script>

<style scoped>

</style>
