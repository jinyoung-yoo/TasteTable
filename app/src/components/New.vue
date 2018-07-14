<template>
    <div class="container">
        <h2>Create TasteTable</h2>
        <ul>
        New Taste-Table Name(Kr) :  <input v-model="selected">      
        <br>

        New Taste-Table Name(En) :  <input v-model="selected_en">
        <br>
        New Taste-Table Size(width) :  <input v-model="size" type="number">

        </ul>
    
        <div>
        <ol>
        <li v-for='cell in tables' v-bind:key='cell.id'
        v-bind:class='{ null : cell.taste == 0, good : cell.taste == 1, soso : cell.taste == 2,  hate : cell.taste == 3}' 
        v-on:click='cell.taste = (cell.taste + 1) % 4'>
            {{ cell.text }}
            <img :src="myImage" class="small"/>
        </li>
        </ol>
        </div>

        <button v-on:click="save()">Save</button>
    </div>
</template>
<style>
body {
  padding: 20px;
  font-family: Helvetica;
}
li.good{
   background: rgba(248, 114, 104, 0.425);
}
li.soso{
   background: rgba(239, 248, 104, 0.425);
}
li.hate{
   background: rgba(104, 167, 248, 0.425);
}
label{
  cursor: pointer;
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
import Web3 from 'web3'
/* eslint-disable */

export default {

  name: 'datetable',
  data () {
    return {
      selected_en : 'politics',
      selected : '정치',
      size : 3,
      new : [],
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
      }],
    }
  },

  mounted () {
    this.getProvider()
  },
  methods: {
    save: function () {
      console.log(this.new)
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
