<template>
  <div class='container'>
    <div class='row'>
      <div class='col-xs-12 col-sm-8 col-sm-push-2'>
        <h1 class='text-center'>My page</h1>
        <hr/>
        <br/>
        <ul>
        <select v-model="selected">
          <option disabled value="">Please select one</option>
          <option name="tastelist" value="date">Date</option>
          <option name="tastelist" value="travel">Travel</option>
          <option name="tastelist" value="food">Food</option>
        </select>
        </ul>
      </div>
    </div>
    <div class='col-xs-12 col-sm-8 col-sm-push-2>
      <ol>
        <li v-for='cell in tables' 
        v-bind:class='{ null : cell.taste == 0, good : cell.taste == 1, soso : cell.taste == 2,  hate : cell.taste == 3}' 
        v-on:click='cell.taste = (cell.taste + 1) % 4'>
            {{ cell.text }}
        </li>
      </ol>
        
    </div>
  </div>

</template>
<style>
  .taste{
    
  }
</style>
<script>

export default {

  name: 'datatable',
  data () {
    return {
      toAddress: null,
      toAmount: 0,
      web3: null,
      web3Provider: null,
      balance: 0,
      contracts: {},
      account: null,
      tables: [
        { i: 1, text: '', taste: 0 },
        { i: 2, text: '', taste: 0 },
        { i: 3, text: '', taste: 0 },
        { i: 4, text: '', taste: 0 },
        { i: 5, text: '', taste: 0 },
        { i: 6, text: '', taste: 0 },
        { i: 7, text: '', taste: 0 },
        { i: 8, text: '', taste: 0 },
        { i: 9, text: '', taste: 0 }
      ],
      datetable: [
        { i: 1, text: '놀이공원', taste: 0 },
        { i: 2, text: '카페', taste: 0 },
        { i: 3, text: '도시산책', taste: 0 },
        { i: 4, text: '찜질방', taste: 0 },
        { i: 5, text: '극장', taste: 0 },
        { i: 6, text: '바다', taste: 0 },
        { i: 7, text: '술', taste: 0 },
        { i: 8, text: '노래방', taste: 0 },
        { i: 9, text: '운동', taste: 0 }
      ],
      foodtable: [
        { i: 1, text: '짜장면', taste: 0 },
        { i: 2, text: '초밥', taste: 0 },
        { i: 3, text: '삼겹살', taste: 0 },
        { i: 4, text: '커리', taste: 0 },
        { i: 5, text: '스테이크', taste: 0 },
        { i: 6, text: '냉면', taste: 0 },
        { i: 7, text: '치킨', taste: 0 },
        { i: 8, text: '라면', taste: 0 },
        { i: 9, text: '떡볶이', taste: 0 }
      ],
      traveltable: [
        { i: 1, text: '나홀로여행', taste: 0 },
        { i: 2, text: '디지털디톡스여행', taste: 0 },
        { i: 3, text: '트레킹여행', taste: 0 },
        { i: 4, text: '홈스테이여행', taste: 0 },
        { i: 5, text: '힐링여행', taste: 0 },
        { i: 6, text: '수상스포츠여행', taste: 0 },
        { i: 7, text: '자선여행', taste: 0 },
        { i: 8, text: '음주여행', taste: 0 },
        { i: 9, text: '애완동물과여행', taste: 0 }
      ]
    }
  }
}
</script>
<style lang='css' scoped>
</style>