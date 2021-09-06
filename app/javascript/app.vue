<template>
  <div id="app">
    <h1>feature/header</h1>
    <div>
      <router-view />
    </div>
  </div>
</template>

<script>
export default {
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
