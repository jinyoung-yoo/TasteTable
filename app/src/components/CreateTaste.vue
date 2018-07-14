<template>
  <div class="hello">
    당신의 취향을 선택해주세요 <br>
    빨강 : 싫은것 <br>
    노랑 : 보통 <br>
    파랑 : 좋은것 <br>
      <TastetableEdit v-bind:score="scores" v-bind:name="tableId" v-bind:mode="edit">
          </TastetableEdit>
  </div>
</template>

<script>
export default {
  name: 'CreateTaste1',
  props: ['tableId'],
  components: {
    'TastetableEdit': () => import('./TastetableEdit')
  },
  data () {
    return {
      scores: [0, 0, 0, 0, 0, 0, 0, 0, 0],
      edit: true,
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
