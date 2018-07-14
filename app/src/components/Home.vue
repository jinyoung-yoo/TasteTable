<template>
  <div class="hello">
    <h3>Table List : </h3>
    <ul id="tables">
      
      <li v-for="table in tables"  v-bind:key='table.id' class="all_hover_button">
        <tastetable  v-bind:score="table.scores" v-bind:name="table.text">
        </tastetable>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'home',
  components: {
    'tastetable': () => import('./tastetable')
  },
  data () {
    return {
      tables: [
        {
          'text': 'Travel',
          'scores': [0, 0, 0, 0, 0, 0, 0, 0, 0]
        },
        {
          'text': 'Food',
          'scores': [0, 0, 0, 0, 0, 0, 0, 0, 0]
        },
        {
          'text': 'Dating',
          'scores': [0, 0, 0, 0, 0, 0, 0, 0, 0]
        }
      ]
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
li.all_hover_button:hover {
    background-color: #aac1ff;
    cursor: pointer;
}
h1, h2 {
  font-weight: normal;
}
body {
    background: #20262E;
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
