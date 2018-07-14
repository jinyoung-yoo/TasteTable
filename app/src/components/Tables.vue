<template>
    <div class='container'>
        <h2>취향 테이블 : 데이트</h2>
        <ol>
        <li v-for='cell in tables' 
        v-bind:class='{ null : cell.taste == 0, good : cell.taste == 1, soso : cell.taste == 2,  hate : cell.taste == 3}' 
        v-on:click='cell.taste = (cell.taste + 1) % 4'>
            {{ cell.text }}
        </li>
        </ol>
            <img :src="img.encodedImage">

        <img src='data:image/jpeg;base64,{{bytesToBase64(imageBytes)}}' />
    </div>
</template>
<script>
import Web3 from 'web3'

import { NoiaClient } from '@noia-network/sdk'
import { bytesToBase64 } from '../utils/base64'

export default {

  name: 'Tables',
  data () {
    return {
      imageBytes: '',
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
        { i: 7, text: '소주', taste: 0 },
        { i: 8, text: '막걸리', taste: 0 },
        { i: 9, text: '스키/보드', taste: 0 },
        { i: 10, text: '갤러리', taste: 0 },
        { i: 11, text: '계곡', taste: 0 },
        { i: 12, text: '드라이브', taste: 0 },
        { i: 13, text: '공원산책', taste: 0 },
        { i: 14, text: '칵테일', taste: 0 },
        { i: 15, text: '농구', taste: 0 },
        { i: 16, text: '맥주', taste: 0 },
        { i: 17, text: '스테이크', taste: 0 },
        { i: 18, text: '만화카페', taste: 0 },
        { i: 19, text: '바다', taste: 0 },
        { i: 20, text: '등산', taste: 0 },
        { i: 21, text: '자전거', taste: 0 },
        { i: 22, text: '축구', taste: 0 },
        { i: 23, text: '오리', taste: 0 },
        { i: 24, text: '치킨', taste: 0 },
        { i: 25, text: '전통 시장', taste: 0 },
        { i: 26, text: '체험', taste: 0 },
        { i: 27, text: '한강', taste: 0 },
        { i: 28, text: '수영', taste: 0 },
        { i: 29, text: '런닝', taste: 0 },
        { i: 30, text: '녹차', taste: 0 },
        { i: 31, text: '삼겹살', taste: 0 },
        { i: 32, text: '불닭발', taste: 0 },
        { i: 33, text: '봉사 활동', taste: 0 },
        { i: 34, text: '온라인채팅', taste: 0 },
        { i: 35, text: '야구', taste: 0 },
        { i: 36, text: '테니스', taste: 0 },
        { i: 37, text: '커피', taste: 0 },
        { i: 38, text: '피자', taste: 0 },
        { i: 39, text: '떡쉬순', taste: 0 },
        { i: 40, text: '노래방', taste: 0 },
        { i: 41, text: '고양이카페', taste: 0 },
        { i: 42, text: '클럽', taste: 0 },
        { i: 42, text: '스윙바', taste: 0 },
        { i: 42, text: '이마트', taste: 0 },
        { i: 42, text: '파스타', taste: 0 },
        { i: 42, text: '라면', taste: 0 },
        { i: 42, text: '재즈바', taste: 0 },
        { i: 42, text: '강아지카페', taste: 0 },
        { i: 42, text: 'DVD방', taste: 0 },
        { i: 42, text: '도서관', taste: 0 },
        { i: 42, text: '극장', taste: 0 },
        { i: 42, text: '사무실', taste: 0 },
        { i: 42, text: 'PC방', taste: 0 },
        { i: 42, text: '카페', taste: 0 },
        { i: 42, text: '찜질방', taste: 0 }
      ]
    }
  },
  mounted () {
    this.getProvider()


    const noiaClient = new NoiaClient(() => new Worker());
    NoiaClientContainer.initialize(noiaClient);
    // console.log(await asyncFun())

    // asyncFunc().then(v = console.log(v))


    //     this.imageBytes = await noiaClient.download({
    //       src: "ipfs:QmbjpRxxL8TRNayHWysWTFSVht1DZxezSNcK48TUp94UmA"
    //     });

    var self = this
    noiaClient.download({
      src: "ipfs:QmbjpRxxL8TRNayHWysWTFSVht1DZxezSNcK48TUp94UmA"
    }).then(self.imageBytes = v)

    console.info(`Image downloaded (${imageBytes.length} bytes)`)

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

<style lang='css' scoped>

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
    width: 42px !important;
    border: 1px solid;
    margin: 3px;
    text-align: center;
    cursor: pointer;
    height: 42px;
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