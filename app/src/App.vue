<template>
  <div id='app'>
    <router-link to="/">Home</router-link>
    <router-link to="/new">Create New Tamplate</router-link>
    <router-link to="/matching">Matching with Friend</router-link>
    <router-link to="/me">Create My Tates</router-link>

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
