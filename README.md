### 프로젝트 내용
- Portal Network 블록체인 해커톤에서 대상 수상
- vue.js 및 bulzelle, ipfs 등 처음 사용해본 기술이 많아 흥미로웠음.

# vue-truffle

> Vue.js version of Truffle & Zeppelin's Tutorial [Robust Smart Contracts with Openzeppelin](http://truffleframework.com/tutorials/robust-smart-contracts-with-openzeppelin)

## Build Setup

``` bash
# install truffle and testrpc
npm install -g truffle
npm install -g testrpc

# serve test network at localhost:8545 in a separate terminal
testrpc

# build and deploy contract onto network
truffle compile
truffle migrate

# move to app and install dependencies
cd app
npm install

# serve with hot reload at localhost:8080
npm run dev
# --------- server


# move to app and install dependencies
cd server
npm install
node server.js

# build for production with minification
npm run build

# build for production and view the bundle analyzer report
npm run build --report

# run unit tests
npm run unit

# run e2e tests
npm run e2e

# run all tests
npm test
```

For detailed explanation on how things work, checkout the [guide](http://vuejs-templates.github.io/webpack/) and [docs for vue-loader](http://vuejs.github.io/vue-loader).
