import Vue from 'vue'
import Router from 'vue-router'

/* VIEWS */
import Login from '@/views/auth/Login'
import Dashboard from '@/views/Dashboard'

import Products from '@/views/products/index'
import ProductsForm from '@/views/products/form'

import Employees from '@/views/employees/index'
import EmployeesForm from '@/views/employees/form'

/* import Sales from '@/views/Sales' */

import Settings from '@/views/Settings'
import Chat from '@/views/Chat'

// The meta data for your routes
const meta = require('./meta.json')

Vue.use(Router)

export default new Router({
  mode: '',
  routes: [
    {path: '/', name: 'Login', component: Login, meta: meta['/']},
    {path: '/dashboard', name: 'Dashboard', component: Dashboard, meta: meta['/dashboard']},

    {path: '/products', name: 'Products', component: Products, meta: meta['/products']},
    {path: '/product/create', name: 'ProductsCreate', component: ProductsForm, meta: meta['/product/create']},
    {path: '/product/edit/:id', name: 'ProductsEdit', component: ProductsForm, meta: meta['/product/edit/*']},

    {path: '/employees', name: 'Employee', component: Employees, meta: meta['/employee']},
    {path: '/employee/create', name: 'EmployeeCreate', component: EmployeesForm, meta: meta['/employee/create']},
    {path: '/employee/edit/:id', name: 'EmployeeEdit', component: EmployeesForm, meta: meta['/employee/edit/*']},

    /* {path: '/sales', name: 'Sales', component: Sales, meta: meta['/sales'] }, */

    {path: '/settings', name: 'Settings', component: Settings, meta: meta['/settings']},
    {path: '/chat', name: 'Chat', component: Chat, meta: meta['/chat']},
    // Global redirect for 404
    {path: '*', redirect: '/'}
  ],
})