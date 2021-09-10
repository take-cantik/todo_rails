<template>
  <div>
    <h1>Todo List</h1>
    <nav>
      <p>About(home)</p>
      <a rel="nofollow" data-method="post" href="/users/auth/google">Google Login</a>
      <button @click="reload()">Log out</button>
    </nav>
  </div>
</template>

<script>
export default {
  methods: {
    reload () {
      window.location.href = "/logout";
    }
  }
}
</script>
