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
          Tastes Address :<input v-model="log.address"></input>

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
          'address': '5add42c2-87ba-11e8-9a94-a6cf71072f73',
          'scores': [1, -1, 1, 0, -1, 0, 1, 1, -1]
        },
        {
          'text': 'Food',
          'address': '6667fe3e-87ba-11e8-9a94-a6cf71072f73',
          'scores': [0, 0, 0, 1, -1, 0, 1, 1, -1]
        },
        {
          'text': 'Dating',
          'address': '6e434050-87ba-11e8-9a94-a6cf71072f73',
          'scores': [1, 1, 0, 0, -1, 0, 1, 1, -1]
        }
      ]
    }
  }
}
</script>
<style lang='css' scoped>
</style>