<template>
  <div>
    <h1>Todo List</h1>
    <nav>
      <p>About(home)</p>
      <a rel="nofollow" data-method="post" href="/users/auth/google">Google Login</a>
      <button @click="logout">Logout</button>
    </nav>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    props: ['current_user'],
    data () {
      return {
        is_logout: {}
      }
    },
    methods: {
      logout () {
        axios
          .delete('api/sign_out.json')
          .then(response => (this.is_logout = response.data))
      }
    }
  }
</script>
