<template>

  <div class="hello">
    
    


    <body>

    <!-- Masthead -->
    <header class="masthead text-white text-center">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-xl-9 mx-auto">
            <h1 class="mb-5">Taste Table is the most easiest & decentralized matching solution via blockchain.</h1>
          </div>
          <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">
            <form>
              <div class="form-row">
                <div class="col-12 col-md-9 mb-2 mb-md-0">
                  <input type="email" class="form-control form-control-lg" placeholder="Enter your email...">
                </div>
              </div>
              
            </form>
            
          </div>
          
        </div>
         <div>
                  <button type="submit" class="btn btn-block btn-lg btn-primary">Sign up!</button>
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
                <img src="/static/img/discount.png">
              </div>
              <h3>1</h3>
              <p class="lead mb-0">You can easy to write your taste table, can be compared with others immediately.
</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="icon-layers m-auto text-primary"></i>
              </div>
              <h3>2</h3>
              <p class="lead mb-0">The result of matching is basically provided as % form.</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="icon-check m-auto text-primary"></i>
              </div>
              <h3>3</h3>
              <p class="lead mb-0">If you want to know the intersections of matching, you can get it with a certain amount of pay.</p>
            </div>
          </div>
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
// import Vue from 'vue'
import Web3 from 'web3'
import router from '../router'
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
      tables: [
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
      ]
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
