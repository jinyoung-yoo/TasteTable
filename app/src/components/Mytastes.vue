<template>
  <div class='container'>
    <div class='row'>
      <div class='col-xs-12 col-sm-8 col-sm-push-2'>
        <h1 class='text-center'>My page</h1>
        <hr/>
        </div>
    </div>
    <div class=''>
      <ol class="my">
        <li class="my" v-for='log in logs' v-bind:key='log.id'>
          <tastetable v-bind:score="log.scores" v-bind:name="log.text">
          </tastetable>
        </li>
      </ol>      
    </div>
  </div>

</template>
<style>
 li.my {
    display: inline-block;
}
ol.my {
    display: initial;
}
</style>
<script>
// 좋아, 소소, 선택안함, 싫어
// 2, 1, 0, -2

export default {

  name: 'datatable',
  components: {
    'tastetable': () => import('./tastetable')
  },
  data () {
    return {
      logs: [
        {
          'text': 'Travel',
          'scores': [1, -1, 1, 0, -1, 0, 1, 1, -1]
        },
        {
          'text': 'Food',
          'scores': [0, 0, 0, 1, -1, 0, 1, 1, -1]
        },
        {
          'text': 'Dating',
          'scores': [1, 1, 0, 0, -1, 0, 1, 1, -1]
        }
      ]
    }
  }
}
</script>
<style lang='css' scoped>
</style>