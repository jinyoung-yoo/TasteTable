<template>
  <div class="hello">
    Please choose your taste <br>
<span class="hate">Red</span>: Hate<br>
<span class="soso">Yellow</span>: Normal<br>
<span class="like">Blue</span>: Like<br>
<div class="center">
      <TastetableEdit v-bind:score="scores" v-bind:name="tableId" v-bind:mode="edit">
          </TastetableEdit>
  </div>
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

span.hate{
   background: rgba(248, 114, 104, 0.425);
}
span.soso{
   background: rgba(239, 248, 104, 0.425);
}
span.like{
   background: rgba(104, 167, 248, 0.425);
}
body {
    padding: 20px;
    font-family: Helvetica;
}
.center {
    width: 400px;
    margin-left: auto;
    margin-right: auto;
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
