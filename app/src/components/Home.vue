<template>

  <div class="hello">




    <!-- Masthead -->
    <header class="masthead text-white text-center">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-xl-9 mx-auto">
            <h1 class="mb-5">Taste Table is the most easiest <br>& decentralized matching solution via blockchain.</h1>
          </div>
          <div class="col-md-12">
            <form>
              <div class="form-row">
                <div class="col-12 mb-md-0">
                  <input type="notice" class="form-control form-control-lg" v-model="notice">
                </div>
              </div>

            </form>

          </div>

        </div>
      </div>
    </header>

    <!-- Icons Grid -->
    <section class="features-icons bg-light text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <img src="/static/img/icon2.png" class="icon_size">
              </div>
              <h3>Secure User Taste Data</h3>
              <p class="lead mb-0">You can easy to write your taste table, can be compared with others immediately.
</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <img src="/static/img/discount.png" class="icon_size">
              </div>
              <h3>Universial Matching Score System</h3>
              <p class="lead mb-0">The result of matching is basically provided as % form.</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <img src="/static/img/ethereum.png" class="icon_size">
              </div>
              <h3>Decentralized Smart Contracts</h3>
              <p class="lead mb-0">If you want to know the intersections of matching, you can get it with a certain amount of pay.</p>
            </div>
          </div>
        </div>
      </div>
    </section>
    <section class="features-icons bg-light text-center">
      <div class="container">
          <div class="row">
              <h3>Select Taste-Table~</h3>
          </div>
      </div>
    </section>
<!-- Image Showcases -->
    <section class="showcase">
      <div class="container-fluid p-0">
        <div class="row no-gutters">



      <li v-for="table in tables"  v-bind:key='table.id' class="all_hover_button"
        v-on:click="createTaste(table.text)">
        <tastetable  v-bind:score="table.scores" v-bind:name="table.text">
        </tastetable>
      </li>


        </div>
      </div>
    </section>

    <!-- Testimonials -->
    <section class="testimonials text-center bg-light">
      <div class="container">

      </div>
    </section>

    <!-- Call to Action -->
    <section class="call-to-action text-white text-center">
      <div class="overlay"></div>
      <div class="container">

      </div>
    </section>


    </body>


  </div>
</template>

<script>
/* eslint-disable */
// import Vue from 'vue'
/* eslint-disable */
import Web3 from 'web3'
import router from '../router'

const tables = [
  {
    'text': 'Travel',
    'scores': [0, 0, 0, 0, 0, 0, 0, 0, 0]
  },
  {
    'text': 'Food',
    'scores': [0, 0, 0, 0, 0, 0, 0, 0, 0]
  },
  {
    'text': 'Dating',
    'scores': [0, 0, 0, 0, 0, 0, 0, 0, 0]
  }
];

export default {
  name: 'home',
  components: {
    'tastetable': () => import('./tastetable')
  },
  mounted () {
    this.getProvider()
  },
  methods: {
    createTaste (tableId) {
      console.log('tableId')
      router.push({name: 'CreateTaste1', params: { tableId: tableId }})
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
      var TemplateArtifact = require('../../../build/contracts/Template.json')
      this.contracts.Template = this.$TruffleContract(TemplateArtifact)
      this.contracts.Template.setProvider(this.web3Provider)
      this.networkCheck()
      this.getTables()
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
           var name_en = this.contracts.Template.deployed().then(function(instance){
            return instance.getTemplate.call(i)}).then(function(v){return v[1].toString()}).then(function(value) {
              return web3.toAscii(value).replace(/\u0000/g, '')});
          var name_en_json = JSON.parse("{\"text\":\""+name_en+"\"}");
          tables.push(name_en_json);
          console.log(tables);
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
  },
  data () {
    return {
      notice: '',
      toAddress: null,
      toAmount: 0,
      web3: null,
      web3Provider: null,
      balance: 0,
      contracts: {},
      account: null,
      tables: tables
    }
  }
}
require('bootstrap-css-only')
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

li.all_hover_button:hover {
    background-color: #aac1ff;
    cursor: pointer;
}
img.icon_size {
    width: 70px;
    margin: 50px;
    margin-bottom: 10px;
}
h1,
h2,
h3,
h4,
h5,
h6 {
  font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
  font-weight: 700;
}

body {
    padding: 20px;
    font-family: 'Lato', 'Helvetica Neue', Helvetica, Arial, sans-serif;
}
ul {
  list-style-type: none;
  padding: 0;
}

li {
  display: inline-block;
  margin: 0 10px;
}

a {
  color: #42b983;
}


</style>
