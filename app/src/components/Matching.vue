<template>
 <div class="container">
  <div class="row">
    <div class="col-xs-12 col-sm-8 col-sm-push-2">
      <h1 class="text-center">Matching</h1>
      <hr/>
      <br/>
        <ul>
        <form>
        <input type="radio" name="tastelist" value="date"checked>Date<br>
        <input type="radio" name="tastelist" value="travel">Travel<br>
        <input type="radio" name="tastelist" value="food">Food
        </form>
        </ul>
    </div>
    <div>
        <ol>
        <li v-for='cell in tables' 
        v-bind:class='{ null : cell.taste == 0, good : cell.taste == 1, soso : cell.taste == 2,  hate : cell.taste == 3}' 
       >
            {{ cell.text }}
        </li>
         
        </ol>
    </div>
    <div id="tables">
      <div id="mytable">
      <ol>
      <li id=1></li>
      <li id=2></li>
      <li id=3></li>
      </ol>
      <ol>
      <li id=4></li>
      <li id=5></li>
      <li id=6></li>
      </ol>
      <ol>
      <li id=7></li>
      <li id=8></li>
      <li id=9></li>
      </ol>
      </div>
      <div id="targettable">
      <ol>
      <li id=1></li>
      <li id=2></li>
      <li id=3></li>
      </ol>
      <ol>
      <li id=4></li>
      <li id=5></li>
      <li id=6></li>
      </ol>
      <ol>
      <li id=7></li>
      <li id=8></li>
      <li id=9></li>
      </ol>
      </div>
    </div>
    
  </div>

  <div id="petsRow" class="row">
    <div class="col-sm-6 col-sm-push-3 col-md-4 col-md-push-4">
      <div class="panel panel-default">
        <div class="panel-heading">
          <h3 class="panel-title">My Wallet</h3>
          <sub>{{account}}</sub>
        </div>
        <div class="panel-body">
          <h4>Balance</h4>
          <strong>Balance</strong>: <span id="TTBalance" v-html='balance'></span> TT<br/><br/>
          <h4>Transfer</h4>
          <input type="text" class="form-control" id="TTTransferAddress" v-model='toAddress' placeholder="Address" />
          <input type="text" class="form-control" id="TTTransferAmount" v-model='toAmount' placeholder="Amount" />
          <button class="btn btn-primary" id="transferButton" type="button" @click.prevent='makeTransfer()'>Transfer</button>
        </div>
      </div>
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

ol li {
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
  date () {
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
  travel () {
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
  food () {
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
