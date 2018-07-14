<template>
  <div class="hello">
    ttt
      {{ msg }}
      <tastetable v-bind:score="scores" v-bind:name="tableId">
          </tastetable>
  </div>
</template>

<script>
export default {
  name: 'CreateTaste1',
  props: ['tableId'],
  components: {
    'tastetable': () => import('./tastetable')
  },
  data () {
    return {
      scores: [0, 0, 0, 0, 0, 0, 0, 0, 0],
      msg: 'Welcome to Your Vue.js App' + this.tableId
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
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

a {
  color: #42b983;
}
</style>
