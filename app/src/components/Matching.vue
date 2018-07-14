<template>
 <div class="container">
  <div class="row">
    <div class="col-xs-12 col-sm-8 col-sm-push-2">
      <h1 class="text-center">Matching</h1>
      <hr/>
    </div>
        
        <div class="col-xs-6 col-md-4">
          <ol class="matching"><li v-bind:key='cell.id' v-for="cell in tables" 
          v-bind:class="{ null : cell.taste == 0, good : cell.taste == 1, soso : cell.taste == 2,  hate : cell.taste == 3}" 
          id= "mytable" >
              {{ cell.text }}
          </li></ol>
        <div>
        <textarea cols="30" rows="1"></textarea>
        </div>
        </div>
        <div class="col-xs-6 col-md-4">
          <ol class="matching"><li v-bind:key='cell.id' v-for="cell in tables" 
          v-bind:class="{ null : cell.taste == 0, good : cell.taste == 1, soso : cell.taste == 2,  hate : cell.taste == 3}" 
          id="targettable">
              {{ cell.text }}
          </li></ol>
        <textarea cols="30" rows="1"></textarea>
        </div>
    
    <div id="result">
      
      
      <br>
      <button>Matching</button>
    </div>
  </div>

</div>
</template>
<style>
body {
  background: #20262E;
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
  },
  mounted () {
    this.getProvider()
  },
  methods: {
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
