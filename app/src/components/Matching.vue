<template>
 <div class="container">
  <div class="row">
    <div class="col-xs-12">
      <h1 class="text-center">Matching</h1>
      <hr/>
    </div>

        <div class="col-xs-4 col-md-4 center">

          <div class="col3">
            User1's Tastes :<input v-model="user1"></input>
          <ol class="matching"><li v-bind:key='cell.id' v-for="cell in tables"
          v-bind:class="{ null : cell.taste == 0, good : cell.taste == 1, soso : cell.taste == 2,  hate : cell.taste == 3}"
          id= "mytable" >
              {{ cell.text }}
          </li></ol>
          </div>
          <div class="col3">
          VS.
<br><br>
      <button v-on:click="matching()" >Matching</button><br><br>
      score: <input v-model="score">
          </div>
          <div class="col3">

          User2's Tastes :<input v-model="user2"></input>
          <ol class="matching"><li v-bind:key='cell.id' v-for="cell in tables"
          v-bind:class="{ null : cell.taste == 0, good : cell.taste == 1, soso : cell.taste == 2,  hate : cell.taste == 3}"
          id="targettable">
              {{ cell.text }}
          </li></ol>

          </div>
        </div>


    </div>
    <div id="result">


      <br>
    </div>
  </div>

</div>
</template>
<style>
body {
  padding: 20px;
  font-family: Helvetica;
}

ol.matching li {
 vertical-align: top;
    margin: 8px 0;
    display: inline-block;
    width: 90px !important;
    border: 1px solid;
    margin: 3px;
    text-align: center;
    cursor: pointer;
    height: 90px;
}
result{
  margin-top:px;
}
label{
  cursor: pointer;
}
.col3 {
    display: table-cell;
}
ol {
    width: 350px;
}
#app {
  background: #fff;
  border-radius: 4px;
  padding: 20px;
  transition: all 0.2s;
}


h2 {
  font-weight: bold;
  margin-bottom: 15px;
}

del {
  color: rgba(0, 0, 0, 0.3);
}
</style>
<script>
  /* eslint-disable */
const userT1={
  "tname_kr": "음식",
  "tname_en": "Food",
  "tastes": [{
    "name_kr": "짜장면",
    "name_en": "Jajangmyeon",
    "image_name": "jajangmyeon.jpg",
    "image_ipfs": "QmZuhD32MY1ZYRJzZ5HpUx9MzCkThpGkSspJ3YEEDKiqNa",
    "taste": -2
  }, {
    "name_kr": "초밥 ",
    "name_en": "Sushi ",
    "image_name": "sushi.jpg ",
    "image_ipfs": "QmRayC1eT8ZdGSpkqjNSAMQC3zed51vfTmGyYk7VKzBJZr",
    "taste": 2
  }, {
    "name_kr": "삼겹살",
    "name_en": "PorkBelly",
    "image_name": "porkbelly.png",
    "image_ipfs": "QmXowdFxfcGgBpQ38eNXsQtJEqSxLP11dVEvrp1RUj3mUJ",
    "taste": -2
  }, {
    "name_kr": "커리",
    "name_en": "Curry",
    "image_name": "curry.jpg",
    "image_ipfs": "QmagYZ9ZJXzgBu8oPX25MvqGNpqDEugfVfJT2aTjeqKxR1",
    "taste": 1
  }, {
    "name_kr": "스테이크",
    "name_en": "Steak",
    "image_name": "steak.jpg",
    "image_ipfs": "QmSyvcu1FwNzgvVFRDwQX6cEawJApjNCekkKVSTY1tTEx9",
    "taste": 0
  }, {
    "name_kr": "냉면",
    "name_en": "ColdNoodles",
    "image_name": "coldnoodles.jpg",
    "image_ipfs": "QmbDYM8wSr94KBnihwzCZUp2KcHnacDxZy3jVL1w4sMgof",
    "taste": 2
  }, {
    "name_kr": "치킨",
    "name_en": "Chicken",
    "image_name": "chicken.jpg",
    "image_ipfs": "QmV42Byrq9px1k8fMj1cMPg87fvYBWS8r8jZR15N6t8ddV",
    "taste": -2
  }, {
    "name_kr": "라면",
    "name_en": "Ramen",
    "image_name": "ramen.jpg",
    "image_ipfs": "QmavQJXQijSS25bQbtTsbTQoHSwozRykxPNViTXxvoEHKX",
    "taste": 1
  }, {
    "name_kr": "떡볶이",
    "name_en": "Tteokbokki",
    "image_name": "tteokbokki.jpg",
    "image_ipfs": "QmZ5rgyVmGbaDrotUM1yUMvgejUD5TiVzEh1NuGVxwLpvj",
    "taste": -2
  }]
};
const userT2={
  "tname_kr": "음식",
  "tname_en": "Food",
  "tastes": [{
    "name_kr": "짜장면",
    "name_en": "Jajangmyeon",
    "image_name": "jajangmyeon.jpg",
    "image_ipfs": "QmZuhD32MY1ZYRJzZ5HpUx9MzCkThpGkSspJ3YEEDKiqNa",
    "taste": 0
  }, {
    "name_kr": "초밥 ",
    "name_en": "Sushi ",
    "image_name": "sushi.jpg ",
    "image_ipfs": "QmRayC1eT8ZdGSpkqjNSAMQC3zed51vfTmGyYk7VKzBJZr",
    "taste": 2
  }, {
    "name_kr": "삼겹살",
    "name_en": "PorkBelly",
    "image_name": "porkbelly.png",
    "image_ipfs": "QmXowdFxfcGgBpQ38eNXsQtJEqSxLP11dVEvrp1RUj3mUJ",
    "taste": 0
  }, {
    "name_kr": "커리",
    "name_en": "Curry",
    "image_name": "curry.jpg",
    "image_ipfs": "QmagYZ9ZJXzgBu8oPX25MvqGNpqDEugfVfJT2aTjeqKxR1",
    "taste": 2
  }, {
    "name_kr": "스테이크",
    "name_en": "Steak",
    "image_name": "steak.jpg",
    "image_ipfs": "QmSyvcu1FwNzgvVFRDwQX6cEawJApjNCekkKVSTY1tTEx9",
    "taste": 1
  }, {
    "name_kr": "냉면",
    "name_en": "ColdNoodles",
    "image_name": "coldnoodles.jpg",
    "image_ipfs": "QmbDYM8wSr94KBnihwzCZUp2KcHnacDxZy3jVL1w4sMgof",
    "taste": -2
  }, {
    "name_kr": "치킨",
    "name_en": "Chicken",
    "image_name": "chicken.jpg",
    "image_ipfs": "QmV42Byrq9px1k8fMj1cMPg87fvYBWS8r8jZR15N6t8ddV",
    "taste": 0
  }, {
    "name_kr": "라면",
    "name_en": "Ramen",
    "image_name": "ramen.jpg",
    "image_ipfs": "QmavQJXQijSS25bQbtTsbTQoHSwozRykxPNViTXxvoEHKX",
    "taste": 1
  }, {
    "name_kr": "떡볶이",
    "name_en": "Tteokbokki",
    "image_name": "tteokbokki.jpg",
    "image_ipfs": "QmZ5rgyVmGbaDrotUM1yUMvgejUD5TiVzEh1NuGVxwLpvj",
    "taste": 2
  }]
};

import Web3 from 'web3'

export default {

  name: 'datatable',
  data () {
    return {
      scoreCal: matching(userT1,usert2),
      score: '',
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
  },
  mounted () {
    this.getProvider()
  },
  methods: {
    matching (taste1, taste2) {
      var sum = 0;
      var count = 0;
      for(var i=0;i<taste1.tastes.length;i++){
        sum+=Math.abs(taste1.tastes[i].taste-taste2.taste[i].taste);
        count++;
      }
      sum/=(count*4);
      this.score = Math.floor(100 * (1 - sum)).toString() + '%'
    },
    getProvider () {
      // Checking if Web3 has been injected by the browser (Mist/MetaMask)
      if (typeof web3 !== 'undefined') {
        // Use Mist/MetaMask's provider
        this.web3Provider = web3.currentProvider
        web3 = new Web3(this.web3Provider)
      } else {
        // fallback - use your fallback strategy (local node / hosted node + in-dapp id mgmt / fail)
        this.web3Provider = new Web3.providers.HttpProvider('http://localhost:8545')
        web3 = new Web3(this.web3Provider)
      }
      this.getContract()
    },
    getContract () {
      var TutorialTokenArtifact = require('../../../build/contracts/TutorialToken.json')
      this.contracts.TutorialToken = this.$TruffleContract(TutorialTokenArtifact)
      this.contracts.TutorialToken.setProvider(this.web3Provider)
      this.networkCheck()
      this.getBalances()
    },
    networkCheck () {
      web3.version.getNetwork((err, netId) => {
        if (err) {
          console.log(err)
          return
        }
        switch (netId) {
          case '1':
            console.log('This is mainnet')
            break
          case '2':
            console.log('This is the deprecated Morden test network.')
            break
          case '3':
            console.log('This is the ropsten test network.')
            break
          default:
            console.log('This is an unknown network.')
        }
      })
    },
    getBalances (adopters, account) {
      console.log('getting balances...')
      web3.eth.getAccounts((error, accounts) => {
        if (error) {
          console.log(error)
          return
        }
        this.account = accounts[0]
        console.log(accounts)
        this.contracts.TutorialToken.deployed().then((instance) => {
          var tutorialTokenInstance = instance

          return tutorialTokenInstance.balanceOf(this.account)
        }).then((result) => {
          console.log(result)
          this.balance = result.c[0]
        }).catch((err) => {
          console.log(err.message)
        })
      })
    },
    makeTransfer () {
      console.log('Transfer ' + this.toAmount + ' TT to ' + this.toAddress)

      var tutorialTokenInstance

      web3.eth.getAccounts((error, accounts) => {
        if (error) {
          console.log(error)
          return
        }

        this.account = accounts[0]

        this.contracts.TutorialToken.deployed().then((instance) => {
          tutorialTokenInstance = instance

          return tutorialTokenInstance.transfer(this.toAddress, this.toAmount, {from: this.account})
        }).then((result) => {
          alert('Transfer Successful!')
          return this.getBalances()
        }).catch((err) => {
          console.log(err.message)
        })
      })
    }
  }
}
require('bootstrap-css-only')
</script>

<style lang="css" scoped>

</style>
