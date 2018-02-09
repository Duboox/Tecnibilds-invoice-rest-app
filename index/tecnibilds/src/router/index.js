import Vue from 'vue'
import Router from 'vue-router'
import Index from '@/views/Index'
import Services from '@/views/Services'
import Work from '@/views/Work'
import About from '@/views/About'
import Contact from '@/views/Contact'

// The meta data for your routes
const meta = require('./meta.json')

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {path: '/', name: 'Index', component: Index, meta: meta['/'] },
    {path: '/services', name: 'Services', component: Services, meta: meta['/services'] },
    {path: '/work', name: 'Work', component: Work, meta: meta['/work'] },
    {path: '/about', name: 'About', component: About, meta: meta['/about'] },
    {path: '/contact', name: 'Contact', component: Contact, meta: meta['/contact'] },
    // Global redirect for 404
    { path: '*', redirect: '/'}
  ],
})