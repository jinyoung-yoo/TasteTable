<template>
    <div class="container">
        <h2>Create TasteTable</h2>
        <ul>
        <select v-model="selected">
          <option disabled value="">Please select one</option>
          <option name="tastelist" value="date">Date</option>
          <option name="tastelist" value="travel">Travel</option>
          <option name="tastelist" value="food">Food</option>
        </select>
        </ul>
    
        <div class="mx-auto">
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
body {
  background: #20262E;
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
li {
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

  name: 'datetable',
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
        { i: 1, text: '와인', taste: 0 },
        { i: 2, text: '양주', taste: 0 },
        { i: 3, text: '도심 산책', taste: 0 },
        { i: 4, text: '야경', taste: 0 },
        { i: 5, text: '해외 여행', taste: 0 },
        { i: 6, text: '코엑스', taste: 0 },
        { i: 7, text: '놀이 공원', taste: 0 },
        { i: 8, text: '소주', taste: 0 },
        { i: 9, text: '막걸리', taste: 0 }
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
