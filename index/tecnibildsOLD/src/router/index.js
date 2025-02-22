import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/views/Index'
import Portfolio from '@/views/Portfolio'

Vue.use(Router)

export default new Router({
    mode: 'history',
    routes: [
        {path: '/', name: 'Index', component: Index},
        {path: '/portfolio', name: 'portfolio', component: Portfolio},
    ]
})
