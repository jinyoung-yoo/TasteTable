<template>
    <div>
        <ol class="table" v-for='table in tables' v-bind:key='table.id' v-if="table.tname_en == tname_en" >
        <h5>취향 테이블 : {{table.tname_kr}}</h5>  

        <ol>
    <li v-for="cell in tables" v-bind:class="{ null : cell.taste == 0, good : cell.taste == 1, soso : cell.taste == 2,  hate : cell.taste == 3}" v-on:click="cell.taste = (cell.taste + 1) % 4">
          {{ cell.text }}   
    </li>
  </ol>


        <li v-for='(taste, i) in table.tastes' v-bind:key='i'
        v-bind:class='{ null : scores[i] == 0, good : scores[i] == 1,
            soso : scores[i] == 2,
            hate : scores[i] == 3}' 
>            {{ taste.name_kr }}
        </li>
        </ol>
    </div>
</template>

<script>
/* eslint-disable */
// v-if="table.tname_en == tname_en"
export default {
  name: 'app',
  props: ['score', 'name', 'mode'],
  data () {
    return {
      tname_en: this.name,
      scores: [1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
      tables2: [
    	{ i: 1, text: "와인", taste: 0 },
    	{ i: 2, text: "양주", taste: 0 },
    	{ i: 3, text: "도심 산택", taste: 0 },
    	{ i: 4, text: "야경", taste: 0 },
    	{ i: 5, text: "해외 여행", taste: 0 },
    	{ i: 6, text: "코엑스", taste: 0 },
    	{ i: 7, text: "놀이 공원", taste: 0 },
    	{ i: 7, text: "소주", taste: 0 },
    	{ i: 8, text: "막걸리", taste: 0 },
    	{ i: 9, text: "스키/보드", taste: 0 },
    	{ i: 10, text: "겔러리", taste: 0 },
    	{ i: 11, text: "계곡", taste: 0 },
    	{ i: 12, text: "드라이브", taste: 0 },
    	{ i: 13, text: "공원산책", taste: 0 },
    	{ i: 14, text: "칵테일", taste: 0 },
    	{ i: 15, text: "농구", taste: 0 },
    	{ i: 16, text: "맥주", taste: 0 },
    	{ i: 17, text: "스테이크", taste: 0 },
    	{ i: 18, text: "만화카페", taste: 0 },
    	{ i: 19, text: "바다", taste: 0 },
    	{ i: 20, text: "등산", taste: 0 },
    	{ i: 21, text: "자전거", taste: 0 },
    	{ i: 22, text: "축구", taste: 0 },
    	{ i: 23, text: "오리", taste: 0 },
    	{ i: 24, text: "치킨", taste: 0 },
    	{ i: 25, text: "전통 시장", taste: 0 },
    	{ i: 26, text: "체험", taste: 0 },
    	{ i: 27, text: "한강", taste: 0 },
    	{ i: 28, text: "수영", taste: 0 },
    	{ i: 29, text: "런닝", taste: 0 },
    	{ i: 30, text: "녹차", taste: 0 },
    	{ i: 31, text: "삼겹살", taste: 0 },
    	{ i: 32, text: "불닭발", taste: 0 },
    	{ i: 33, text: "봉사 활동", taste: 0 },
    	{ i: 34, text: "온라인채팅", taste: 0 },
    	{ i: 35, text: "야구", taste: 0 },
    	{ i: 36, text: "테니스", taste: 0 },
    	{ i: 37, text: "커피", taste: 0 },
    	{ i: 38, text: "피자", taste: 0 },
    	{ i: 39, text: "떡쉬순", taste: 0 },
    	{ i: 40, text: "노래방", taste: 0 },
    	{ i: 41, text: "고양이카페", taste: 0 },
    	{ i: 42, text: "클럽", taste: 0 },
    	{ i: 42, text: "스윙바", taste: 0 },
    	{ i: 42, text: "이마트", taste: 0 },
    	{ i: 42, text: "파스타", taste: 0 },
    	{ i: 42, text: "라면", taste: 0 },
    	{ i: 42, text: "째즈바", taste: 0 },
    	{ i: 42, text: "강아지카페", taste: 0 },
    	{ i: 42, text: "DVD방", taste: 0 },
    	{ i: 42, text: "도서관", taste: 0 },
    	{ i: 42, text: "극장", taste: 0 },
    	{ i: 42, text: "사무실", taste: 0 },
    	{ i: 42, text: "PC방", taste: 0 },
    	{ i: 42, text: "카페", taste: 0 },
    	{ i: 42, text: "찝질방", taste: 0 },
      ],
      tables: [
          {
        'tname_kr': '데이트',
        'tname_en': 'Dating',
        'tastes': [{
            'name_kr': '놀이공원',
            'name_en': 'AmusementPark',
            'image_name': 'amusementpark.jpg',
            'image_ipfs': 'QmXgEDRpD23zbfevHLyxK3bwXcdvwZmYZJUk7yvro2tttT',
            taste: 0
        }, {
            'name_kr': '카페',
            'name_en': 'Cafe',
            'image_name': 'cafe.jpg',
            'image_ipfs': 'Qmd7X5QASJnQSsx8ydKEJZTQ3UXSn8AE8UfGApjoaCdnuh',
            taste: 0
        }, {
            'name_kr': '도시산책',
            'name_en': 'CityWalk',
            'image_name': 'citywalk.jpg',
            'image_ipfs': 'QmPVRDCrHkv3HJojiK7vvZcoQMkZZVce8RUFzFxQLwLyMs',
            taste: 0
        }, {
            'name_kr': '찜질방',
            'name_en': 'KoreanSauna',
            'image_name': 'koreansauna.jpg',
            'image_ipfs': 'Qme8JRgN3dvhAUHeDMkBcmcqY8w4g7uSfriaP21M1zYUQk',
            taste: 0
        }, {
            'name_kr': '극장',
            'name_en': 'Theater',
            'image_name': 'theater.jpg',
            'image_ipfs': 'QmeHTSDWxse3Nzc2F7nGpzfSg5bdkz4JGhqUUEQiRcmikd',
            taste: 0
        }, {
            'name_kr': '바다',
            'name_en': 'Sea',
            'image_name': 'sea.jpg',
            'image_ipfs': 'QmRWTNLXm2AD9FJR8h7fSWVuhXUGqdXCvJxGKDrEh4yRSF',
            taste: 0
        }, {
            'name_kr': '술',
            'name_en': 'Alcohol',
            'image_name': 'alcohol.jpg',
            'image_ipfs': 'QmRZw2psnke7Y7oYBCzHfH4FsDnEEkZSCeNGng5xmo9yG9',
            taste: 0
        }, {
            'name_kr': '노래방',
            'name_en': 'Karaoke',
            'image_name': 'karaoke.jpg',
            'image_ipfs': 'QmWRwbj9CFp4THamVtZQHPwKjQ12PEo6gB8PuTmdY1D1Ht',
            taste: 0
        }, {
            'name_kr': '운동',
            'name_en': 'Exercise',
            'image_name': 'exercise.jpg',
            'image_ipfs': 'QmQGw4XTX33rUSYWFgKtME7XWifQ94o71iBKMRkpGqJAfW',
            taste: 0
        }]
    },
    {
        'tname_kr': '음식',
        'tname_en': 'Food',
        'tastes': [{
            'name_kr': '짜장면',
            'name_en': 'Jajangmyeon',
            'image_name': 'jajangmyeon.jpg',
            'image_ipfs': 'QmZuhD32MY1ZYRJzZ5HpUx9MzCkThpGkSspJ3YEEDKiqNa',
            taste: 0
        }, {
            'name_kr': '초밥 ',
            'name_en': 'Sushi ',
            'image_name': 'sushi.jpg ',
            'image_ipfs': 'QmRayC1eT8ZdGSpkqjNSAMQC3zed51vfTmGyYk7VKzBJZr',
            taste: 0
        }, {
            'name_kr': '삼겹살',
            'name_en': 'PorkBelly',
            'image_name': 'porkbelly.png',
            'image_ipfs': 'QmXowdFxfcGgBpQ38eNXsQtJEqSxLP11dVEvrp1RUj3mUJ',
            taste: 0
        }, {
            'name_kr': '커리',
            'name_en': 'Curry',
            'image_name': 'curry.jpg',
            'image_ipfs': 'QmagYZ9ZJXzgBu8oPX25MvqGNpqDEugfVfJT2aTjeqKxR1',
            taste: 0
        }, {
            'name_kr': '스테이크',
            'name_en': 'Steak',
            'image_name': 'steak.jpg',
            'image_ipfs': 'QmSyvcu1FwNzgvVFRDwQX6cEawJApjNCekkKVSTY1tTEx9',
            taste: 0
        }, {
            'name_kr': '냉면',
            'name_en': 'ColdNoodles',
            'image_name': 'coldnoodles.jpg',
            'image_ipfs': 'QmbDYM8wSr94KBnihwzCZUp2KcHnacDxZy3jVL1w4sMgof',
            taste: 0
        }, {
            'name_kr': '치킨',
            'name_en': 'Chicken',
            'image_name': 'chicken.jpg',
            'image_ipfs': 'QmV42Byrq9px1k8fMj1cMPg87fvYBWS8r8jZR15N6t8ddV',
            taste: 0
        }, {
            'name_kr': '라면',
            'name_en': 'Ramen',
            'image_name': 'ramen.jpg',
            'image_ipfs': 'QmavQJXQijSS25bQbtTsbTQoHSwozRykxPNViTXxvoEHKX',
            taste: 0
        }, {
            'name_kr': '떡볶이',
            'name_en': 'Tteokbokki',
            'image_name': 'tteokbokki.jpg',
            'image_ipfs': 'QmZ5rgyVmGbaDrotUM1yUMvgejUD5TiVzEh1NuGVxwLpvj',
            taste: 0
        }]
    },
    {
        'tname_kr': '여행',
        'tname_en': 'Travel',
        'tastes': [{
            'name_kr': '나홀로여행',
            'name_en': 'AloneTravel',
            'image_name': 'alonetravel.png',
            'image_ipfs': 'QmZ8x77VmjBMt5iZcfdsmCJU7WkHTkbeptgt3m9TDXSG4p',
            taste: 0
        }, {
            'name_kr': '디지털디톡스여행',
            'name_en': 'DigitalDetoxTravel',
            'image_name': 'digitaldetoxtravel.png',
            'image_ipfs': 'QmXnLteNK8JEcaZJ4M4XTud5QWqH3EBFjPHK3QBrDoim1Y',
            taste: 0
        }, {
            'name_kr': '트레킹여행',
            'name_en': 'TrekkingTravel',
            'image_name': 'trekkingtravel.png',
            'image_ipfs': 'QmXpc5hcg4cwvkLnEhnD9ymfjNtrVudKj7rd36WLQUcBGt',
            taste: 0
        }, {
            'name_kr': '홈스테이여행',
            'name_en': 'HomestayTravel',
            'image_name': 'homestaytravel.png',
            'image_ipfs': 'QmXEJrk7i4W1h31LzwxQHZepxNamyCq3MCifVm5Jb6QSH7',
            taste: 0
        }, {
            'name_kr': '힐링여행',
            'name_en': 'HealingTravel',
            'image_name': 'healingtravel',
            'image_ipfs': 'Qmb4xzjsgmha6yhV66MVXqGjyTs8mDzzTD3f9JN4QPbZbX',
            taste: 0
        }, {
            'name_kr': '수상스포츠여행',
            'name_en': 'WaterSportsTravel',
            'image_name': 'watersportstravel.png',
            'image_ipfs': 'QmZVoWR4ymFJzsQu1ij6vgnYJ7PMqoevzh8eCs9odeKCAW',
            taste: 0
        }, {
            'name_kr': '자선여행',
            'name_en': 'VolunteerTravel',
            'image_name': 'volunteertravel.png',
            'image_ipfs': 'QmTvSZMpDeEx2hhUPC2Gqb5HpUqZ1HWPSMb4g3b1dLbb8b',
            taste: 0
        }, {
            'name_kr': '음주여행',
            'name_en': 'DrinkTravel',
            'image_name': 'drinktravel.png',
            'image_ipfs': 'QmY6N55k9Ub34Rgak46iKW12g1C1hzwWZ5YNtcL8x1kKSj',
            taste: 0
        }, {
            'name_kr': '애완동물과여행',
            'name_en': 'TravelWithPets',
            'image_name': 'travelwithpets.png',
            'image_ipfs': 'Qma7Pq6RXacAobjbuFwPrM7vLyXXqxEKizRDd29dxU84go',
            taste: 0
        }]
    }]
  
  }
  },
  mounted: function () {
    console.log(this)
  }
}
</script>

<style>

li.good{
   background: rgba(248, 114, 104, 0.425);
}
li.soso{
   background: rgba(239, 248, 104, 0.425);
}
li.hate{
   background: rgba(104, 167, 248, 0.425);
}
ol.table li:hover {
    border: 1px solid yellow;
}
ol.table li {
 vertical-align: top;
    margin: 8px 0;
    display: inline-block;
    width: 60px !important;
    border: 1px solid;
    margin: 3px;
    text-align: center;
    cursor: pointer;
    height: 60px;
}
ol.table {
    width: 240px;
}
</style>