<template>
  <div class="hello">
    Please choose your taste <br>
<span class="hate">Red</span>: Hate<br>
<span class="soso">Yellow</span>: Normal<br>
<span class="like">Blue</span>: Like<br>
<div class="center">
      <TastetableEdit v-bind:account="account" v-bind:score="scores" v-bind:name="tableId" v-bind:mode="edit">
          </TastetableEdit>
  </div>
</div>
</template>

<script>
/* eslint-disable */

import Web3 from 'web3'

export default {
  name: 'CreateTaste1',
  props: ['tableId'],
  components: {
    'TastetableEdit': () => import('./TastetableEdit')
  },
  data () {
    return {
      toAddress: null,
      toAmount: 0,
      web3: null,
      web3Provider: null,
      balance: 0,
      contracts: {},
      account: null,
      scores: [0, 0, 0, 0, 0, 0, 0, 0, 0],
      edit: true,
      msg: 'Welcome to Your Vue.js App' + this.tableId
    }
  },
  mounted () {
    // this.getProvider()
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
      var TemplateArtifact = require('../../../build/contracts/Template.json')
      this.contracts.Template = this.$TruffleContract(TemplateArtifact)
      this.contracts.Template.setProvider(this.web3Provider)
      this.networkCheck()
      // this.getTables()
      this.saveB()
    },
    saveB () {
      web3.eth.getAccounts((error, accounts) => {
        if (error) {
          console.log(error)
          return
        }
        this.account = accounts[0]
        console.log(this.account)
        this.$http.get('http://localhost:3000/user/new/?user_uuid=' + this.account + '&data=123122223123').then(response => {
          // success callback
                  console.log(' success callback')

        }, response => {
          // error callback

                  console.log(' error callback')
        });
      })
      console.log(this.account)

    },
    networkCheck () {
      web3.version.getNetwork((err, netId) => {
        if (err) {
          console.log(err)
          return
        }
        switch (netId) {
          case '1':
            this.notice = 'This is mainnet'
            console.log(this.notice)
            break
          case '2':
            this.notice = 'This is the deprecated Morden test network.'
            console.log(this.notice)
            break
          case '3':
            this.notice = 'This is the ropsten test network.'
            console.log(this.notice)
            break
          default:
            this.notice = 'This is an unknown network.'
            console.log(this.notice)
        }
      })
    },
    getTables (adopters, account) {
      console.log('getting templates...')
      web3.eth.getAccounts((error, accounts) => {
        if (error) {
          console.log(error)
          return
        }
        this.account = accounts[0]
        console.log(accounts)
            this.contracts.Template.deployed().then((instance) => {
              var tutorialTokenInstance = instance

              return tutorialTokenInstance.balanceOf(this.account)
            }).then((result) => {
              console.log(result)
              this.balance = result.c[0]
            }).catch((err) => {
              console.log(err.message)
            })

        for(var i=0;i<3;i++){
          this.contracts.Template.deployed().then(function(instance){ return instance.getTemplate.call(i)}).then(function(v){return v[0].toString()}).then(function(value) {return web3.toAscii(value).replace(/\u0000/g, '')});
          console.log("yunjin");
          console.log(this.contracts.Template.deployed().then(function(instance){ return instance.getTemplate.call(i)}).then(function(v){return v[0].toString()}).then(function(value) {return web3.toAscii(value).replace(/\u0000/g, '')}));
          this.contracts.Template.deployed().then(function(instance){ 
            return instance.getTemplate.call(i)}).then(function(v){return v[1].toString()}).then(function(value) {
              return web3.toAscii(value).replace(/\u0000/g, '')});
          this.contracts.Template.deployed().then(function(instance){ 
            return instance.getTemplate.call(i)}).then(function(v){return v[2]}).then(function(value) {
              return value.toNumber();});
          this.contracts.Template.deployed().then(function(instance){ 
            return instance.getTemplate.call(i)}).then(function(v){return v[3]}).then(function(value) {
              return value.toNumber();});
        }

        //Template.deployed().then(function(instance){ return instance.getTemplate.call(0)}).then(function(v){return v[0].toString()}).then(function(value) {return web3.toAscii(value).replace(/\u0000/g, '')});
        //Template.deployed().then(function(instance){ return instance.getTemplate.call(0)}).then(function(v){return v[1].toString()}).then(function(value) {return web3.toAscii(value).replace(/\u0000/g, '')});
        //Template.deployed().then(function(instance){ return instance.getTemplate.call(0)}).then(function(v){return v[2]}).then(function(value) {return value.toNumber();});
        //Template.deployed().then(function(instance){ return instance.getTemplate.call(0)}).then(function(v){return v[3]}).then(function(value) {return value.toNumber();});
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
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
h1, h2 {
  font-weight: normal;
}

span.hate{
   background: rgba(248, 114, 104, 0.425);
}
span.soso{
   background: rgba(239, 248, 104, 0.425);
}
span.like{
   background: rgba(104, 167, 248, 0.425);
}
body {
    padding: 20px;
    font-family: Helvetica;
}
.center {
    width: 400px;
    margin-left: auto;
    margin-right: auto;
}
ul {
  list-style-type: none;
  padding: 0;
}
li.cell{
  user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -webkit-user-select: none;
        -o-user-select: none;
}
li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}
</style>
