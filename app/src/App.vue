<template>
  <div id='app'>
    <router-view></router-view>
    <h2>취향 테이블 : 데이트</h2>
    <ol>
      <li v-for='cell in tables' 
      v-bind:class='{ null : cell.taste == 0, good : cell.taste == 1, soso : cell.taste == 2,  hate : cell.taste == 3}' 
      v-on:click='cell.taste = (cell.taste + 1) % 4'>
        {{ cell.text }}
      </li>
    </ol>
  </div>
</template>

<script>
export default {
  name: 'app',
  tables: [
    { i: 1, text: '와인', taste: 0 },
    { i: 2, text: '양주', taste: 0 },
    { i: 3, text: '도심 산택', taste: 0 },
    { i: 4, text: '야경', taste: 0 },
    { i: 5, text: '해외 여행', taste: 0 },
    { i: 6, text: '코엑스', taste: 0 },
    { i: 7, text: '놀이 공원', taste: 0 },
    { i: 7, text: '소주', taste: 0 },
    { i: 8, text: '막걸리', taste: 0 },
    { i: 9, text: '스키/보드', taste: 0 },
    { i: 10, text: '겔러리', taste: 0 },
    { i: 11, text: '계곡', taste: 0 },
    { i: 12, text: '드라이브', taste: 0 },
    { i: 13, text: '공원산책', taste: 0 },
    { i: 14, text: '칵테일', taste: 0 },
    { i: 15, text: '농구', taste: 0 },
    { i: 16, text: '맥주', taste: 0 },
    { i: 17, text: '스테이크', taste: 0 },
    { i: 18, text: '만화카페', taste: 0 },
    { i: 19, text: '바다', taste: 0 },
    { i: 20, text: '등산', taste: 0 },
    { i: 21, text: '자전거', taste: 0 },
    { i: 22, text: '축구', taste: 0 },
    { i: 23, text: '오리', taste: 0 },
    { i: 24, text: '치킨', taste: 0 },
    { i: 25, text: '전통 시장', taste: 0 },
    { i: 26, text: '체험', taste: 0 },
    { i: 27, text: '한강', taste: 0 },
    { i: 28, text: '수영', taste: 0 },
    { i: 29, text: '런닝', taste: 0 },
    { i: 30, text: '녹차', taste: 0 },
    { i: 31, text: '삼겹살', taste: 0 },
    { i: 32, text: '불닭발', taste: 0 },
    { i: 33, text: '봉사 활동', taste: 0 },
    { i: 34, text: '온라인채팅', taste: 0 },
    { i: 35, text: '야구', taste: 0 },
    { i: 36, text: '테니스', taste: 0 },
    { i: 37, text: '커피', taste: 0 },
    { i: 38, text: '피자', taste: 0 },
    { i: 39, text: '떡쉬순', taste: 0 },
    { i: 40, text: '노래방', taste: 0 },
    { i: 41, text: '고양이카페', taste: 0 },
    { i: 42, text: '클럽', taste: 0 },
    { i: 42, text: '스윙바', taste: 0 },
    { i: 42, text: '이마트', taste: 0 },
    { i: 42, text: '파스타', taste: 0 },
    { i: 42, text: '라면', taste: 0 },
    { i: 42, text: '째즈바', taste: 0 },
    { i: 42, text: '강아지카페', taste: 0 },
    { i: 42, text: 'DVD방', taste: 0 },
    { i: 42, text: '도서관', taste: 0 },
    { i: 42, text: '극장', taste: 0 },
    { i: 42, text: '사무실', taste: 0 },
    { i: 42, text: 'PC방', taste: 0 },
    { i: 42, text: '카페', taste: 0 },
    { i: 42, text: '찝질방', taste: 0 }
  ]
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
