<template>
  <div id='app'>
    <!-- Navigation -->
    <nav class="navbar navbar-light bg-light static-top">
      <div class="container">
        <li class="navbar-brand"><router-link to="/">Home</router-link></li>
        <li class="navbar-brand"><router-link to="/my">My Tastes</router-link></li>
        <li class="navbar-brand"><router-link to="/create_taste">Create Taste</router-link></li>
        <li class="navbar-brand"><router-link to="/create_table">Create New Taste-Table</router-link></li>
        <li class="navbar-brand"><router-link to="/matching">Taste-Matching with Friend</router-link></li>
        <a class="btn btn-primary" href="#">Sign In</a>
      </div>
    </nav>
    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'app'
}
</script>

<style>
h1, h2 {
  font-weight: normal;
}
body {
    padding: 20px;
    font-family: Helvetica;
}
ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}


#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
