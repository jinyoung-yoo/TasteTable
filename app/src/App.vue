<template>
  <div id='app'>
    <li><router-link to="/">Home</router-link></li>
    <li><router-link to="/my"> My Tates</router-link></li>
    <li><router-link to="/create_taste">Create Taste</router-link></li>
    <li><router-link to="/create_table">Create New Taste-Table</router-link></li>
    <li><router-link to="/matching">Taste-Matching with Friend</router-link></li>

    <router-view></router-view>
  </div>
</template>

<script>
export default {
  name: 'app'
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
