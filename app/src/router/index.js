import Vue from 'vue'
import Router from 'vue-router'
import Tables from '@/components/Tables'
import Matching from '@/components/Matching'
import New from '@/components/New'
import Me from '@/components/Me'

Vue.use(Router)

export default new Router({
  routes: [
    {
      path: '/',
      name: 'Tables',
      component: Tables
    },
    {
      path: '/me',
      name: 'Me',
      component: Me
    },
    {
      path: '/matching',
      name: 'Matching',
      component: Matching
    },
    {
      path: '/new',
      name: 'New',
      component: New
    }
  ]
})
