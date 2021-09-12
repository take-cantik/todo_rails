<template>
  <div>
    <h1>Todo List</h1>
    <nav>
      <p>About(home)</p>
      <a rel="nofollow" data-method="post" href="/users/auth/google"
        >Google Login</a
      >
      <a href="#" @click="logout">Log out</a>
    </nav>
  </div>
</template>

<script>
import axios from "axios";
export default {
  methods: {
    async logout(e) {
      e.preventDefault();
      await axios.get("/logout");
      location.reload();
    }
  }
};
</script>
