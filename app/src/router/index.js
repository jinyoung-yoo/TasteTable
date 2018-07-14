import Vue from 'vue'
import Router from 'vue-router'
import Wallet from '@/components/Wallet'
import Tables from '@/components/Tables'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Tables',
      component: Tables
    },
    {
      path: '/Wallet',
      name: 'Wallet',
      component: Wallet
    }
  ]
})
