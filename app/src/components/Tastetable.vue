<template>
    <div>
        <ol class="table" v-for='table in tables' v-bind:key='table.id' v-if="table.tname_en == tname_en" >
        <h5>취향 테이블 : {{table.tname_kr}}</h5>  
        <li v-for='(taste, i) in table.tastes' v-bind:key='i'
        v-bind:class='{ null : scores[i] == 0, good : scores[i] == 1,
            soso : scores[i] == 2,
            hate : scores[i] == 3}' 
            v-on:click='scores[i] = (score[i] + 1) % 4'>
            {{ taste.name_kr }}
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
      scores: this.score,
      tables: [
          {
        'tname_kr': '데이트',
        'tname_en': 'Dating',
        'tastes': [{
            'name_kr': '놀이공원',
            'name_en': 'AmusementPark',
            'image_name': 'amusementpark.jpg',
            'image_ipfs': 'QmXgEDRpD23zbfevHLyxK3bwXcdvwZmYZJUk7yvro2tttT'
        }, {
            'name_kr': '카페',
            'name_en': 'Cafe',
            'image_name': 'cafe.jpg',
            'image_ipfs': 'Qmd7X5QASJnQSsx8ydKEJZTQ3UXSn8AE8UfGApjoaCdnuh'
        }, {
            'name_kr': '도시산책',
            'name_en': 'CityWalk',
            'image_name': 'citywalk.jpg',
            'image_ipfs': 'QmPVRDCrHkv3HJojiK7vvZcoQMkZZVce8RUFzFxQLwLyMs'
        }, {
            'name_kr': '찜질방',
            'name_en': 'KoreanSauna',
            'image_name': 'koreansauna.jpg',
            'image_ipfs': 'Qme8JRgN3dvhAUHeDMkBcmcqY8w4g7uSfriaP21M1zYUQk'
        }, {
            'name_kr': '극장',
            'name_en': 'Theater',
            'image_name': 'theater.jpg',
            'image_ipfs': 'QmeHTSDWxse3Nzc2F7nGpzfSg5bdkz4JGhqUUEQiRcmikd'
        }, {
            'name_kr': '바다',
            'name_en': 'Sea',
            'image_name': 'sea.jpg',
            'image_ipfs': 'QmRWTNLXm2AD9FJR8h7fSWVuhXUGqdXCvJxGKDrEh4yRSF'
        }, {
            'name_kr': '술',
            'name_en': 'Alcohol',
            'image_name': 'alcohol.jpg',
            'image_ipfs': 'QmRZw2psnke7Y7oYBCzHfH4FsDnEEkZSCeNGng5xmo9yG9'
        }, {
            'name_kr': '노래방',
            'name_en': 'Karaoke',
            'image_name': 'karaoke.jpg',
            'image_ipfs': 'QmWRwbj9CFp4THamVtZQHPwKjQ12PEo6gB8PuTmdY1D1Ht'
        }, {
            'name_kr': '운동',
            'name_en': 'Exercise',
            'image_name': 'exercise.jpg',
            'image_ipfs': 'QmQGw4XTX33rUSYWFgKtME7XWifQ94o71iBKMRkpGqJAfW'
        }]
    },
    {
        'tname_kr': '음식',
        'tname_en': 'Food',
        'tastes': [{
            'name_kr': '짜장면',
            'name_en': 'Jajangmyeon',
            'image_name': 'jajangmyeon.jpg',
            'image_ipfs': 'QmZuhD32MY1ZYRJzZ5HpUx9MzCkThpGkSspJ3YEEDKiqNa'
        }, {
            'name_kr': '초밥 ',
            'name_en': 'Sushi ',
            'image_name': 'sushi.jpg ',
            'image_ipfs': 'QmRayC1eT8ZdGSpkqjNSAMQC3zed51vfTmGyYk7VKzBJZr'
        }, {
            'name_kr': '삼겹살',
            'name_en': 'PorkBelly',
            'image_name': 'porkbelly.png',
            'image_ipfs': 'QmXowdFxfcGgBpQ38eNXsQtJEqSxLP11dVEvrp1RUj3mUJ'
        }, {
            'name_kr': '커리',
            'name_en': 'Curry',
            'image_name': 'curry.jpg',
            'image_ipfs': 'QmagYZ9ZJXzgBu8oPX25MvqGNpqDEugfVfJT2aTjeqKxR1'
        }, {
            'name_kr': '스테이크',
            'name_en': 'Steak',
            'image_name': 'steak.jpg',
            'image_ipfs': 'QmSyvcu1FwNzgvVFRDwQX6cEawJApjNCekkKVSTY1tTEx9'
        }, {
            'name_kr': '냉면',
            'name_en': 'ColdNoodles',
            'image_name': 'coldnoodles.jpg',
            'image_ipfs': 'QmbDYM8wSr94KBnihwzCZUp2KcHnacDxZy3jVL1w4sMgof'
        }, {
            'name_kr': '치킨',
            'name_en': 'Chicken',
            'image_name': 'chicken.jpg',
            'image_ipfs': 'QmV42Byrq9px1k8fMj1cMPg87fvYBWS8r8jZR15N6t8ddV'
        }, {
            'name_kr': '라면',
            'name_en': 'Ramen',
            'image_name': 'ramen.jpg',
            'image_ipfs': 'QmavQJXQijSS25bQbtTsbTQoHSwozRykxPNViTXxvoEHKX'
        }, {
            'name_kr': '떡볶이',
            'name_en': 'Tteokbokki',
            'image_name': 'tteokbokki.jpg',
            'image_ipfs': 'QmZ5rgyVmGbaDrotUM1yUMvgejUD5TiVzEh1NuGVxwLpvj'
        }]
    },
    {
        'tname_kr': '여행',
        'tname_en': 'Travel',
        'tastes': [{
            'name_kr': '나홀로여행',
            'name_en': 'AloneTravel',
            'image_name': 'alonetravel.png',
            'image_ipfs': 'QmZ8x77VmjBMt5iZcfdsmCJU7WkHTkbeptgt3m9TDXSG4p'
        }, {
            'name_kr': '디지털디톡스여행',
            'name_en': 'DigitalDetoxTravel',
            'image_name': 'digitaldetoxtravel.png',
            'image_ipfs': 'QmXnLteNK8JEcaZJ4M4XTud5QWqH3EBFjPHK3QBrDoim1Y'
        }, {
            'name_kr': '트레킹여행',
            'name_en': 'TrekkingTravel',
            'image_name': 'trekkingtravel.png',
            'image_ipfs': 'QmXpc5hcg4cwvkLnEhnD9ymfjNtrVudKj7rd36WLQUcBGt'
        }, {
            'name_kr': '홈스테이여행',
            'name_en': 'HomestayTravel',
            'image_name': 'homestaytravel.png',
            'image_ipfs': 'QmXEJrk7i4W1h31LzwxQHZepxNamyCq3MCifVm5Jb6QSH7'
        }, {
            'name_kr': '힐링여행',
            'name_en': 'HealingTravel',
            'image_name': 'healingtravel',
            'image_ipfs': 'Qmb4xzjsgmha6yhV66MVXqGjyTs8mDzzTD3f9JN4QPbZbX'
        }, {
            'name_kr': '수상스포츠여행',
            'name_en': 'WaterSportsTravel',
            'image_name': 'watersportstravel.png',
            'image_ipfs': 'QmZVoWR4ymFJzsQu1ij6vgnYJ7PMqoevzh8eCs9odeKCAW'
        }, {
            'name_kr': '자선여행',
            'name_en': 'VolunteerTravel',
            'image_name': 'volunteertravel.png',
            'image_ipfs': 'QmTvSZMpDeEx2hhUPC2Gqb5HpUqZ1HWPSMb4g3b1dLbb8b'
        }, {
            'name_kr': '음주여행',
            'name_en': 'DrinkTravel',
            'image_name': 'drinktravel.png',
            'image_ipfs': 'QmY6N55k9Ub34Rgak46iKW12g1C1hzwWZ5YNtcL8x1kKSj'
        }, {
            'name_kr': '애완동물과여행',
            'name_en': 'TravelWithPets',
            'image_name': 'travelwithpets.png',
            'image_ipfs': 'Qma7Pq6RXacAobjbuFwPrM7vLyXXqxEKizRDd29dxU84go'
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

ol.table li {
 vertical-align: top;
    margin: 8px 0;
    display: inline-block;
    width: 60px !important;
    border: 1px solid;
    margin: 3px;
    text-align: center;
    /* cursor: pointer; */
    height: 60px;
}
ol.table {
    width: 240px;
}
</style>