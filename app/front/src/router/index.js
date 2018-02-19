import Vue from 'vue'
import Router from 'vue-router'
Vue.use(Router)

// The meta data for your routes
const meta = require('./meta.json')

/* VIEWS */
import Login from '@/views/auth/Login'
import Dashboard from '@/views/Dashboard'

import Invoices from '@/views/invoices/index'
import InvoicesShow from '@/views/invoices/show'
import InvoicesForm from '@/views/invoices/form'

import Products from '@/views/products/index'
import ProductsForm from '@/views/products/form'

import Employees from '@/views/employees/index'
import EmployeesForm from '@/views/employees/form'

import Customers from '@/views/customers/index'
import CustomersForm from '@/views/customers/form'

import Providers from '@/views/providers/index'
import ProvidersForm from '@/views/providers/form'

import Users from '@/views/users/index'

import Settings from '@/views/Settings'
import Chat from '@/views/Chat'

export default new Router({
  mode: '',
  routes: [
    {path: '/', name: 'Login', component: Login, meta: meta['/']},
    {path: '/dashboard', name: 'Dashboard', component: Dashboard, meta: meta['/dashboard']},

      /* PRODUCTS */
    {path: '/products', name: 'Products', component: Products, meta: meta['/products']},
    {path: '/product/create', name: 'ProductsCreate', component: ProductsForm, meta: meta['/product/create']},
    {path: '/product/edit/:id', name: 'ProductsEdit', component: ProductsForm, meta: meta['/product/edit/*']},

      /* EMPLOYEES */
    {path: '/employees', name: 'Employees', component: Employees, meta: meta['/employees']},
    {path: '/employee/create', name: 'EmployeeCreate', component: EmployeesForm, meta: meta['/employee/create']},
    {path: '/employee/edit/:id', name: 'EmployeeEdit', component: EmployeesForm, meta: meta['/employee/edit/*']},

      /* CUSTOMERS */
    {path: '/customers', name: 'Customers', component: Customers, meta: meta['/customers']},
    {path: '/customer/create', name: 'CustomerCreate', component: CustomersForm, meta: meta['/customer/create']},
    {path: '/customer/edit/:id', name: 'CustomerEdit', component: CustomersForm, meta: meta['/customer/edit/*']},

      /* PROVIDERS */
    {path: '/providers', name: 'Providers', component: Providers, meta: meta['/providers']},
    {path: '/provider/create', name: 'ProviderCreate', component: ProvidersForm, meta: meta['/provider/create']},
    {path: '/provider/edit/:id', name: 'ProviderEdit', component: ProvidersForm, meta: meta['/provider/edit/*']},

      /* INVOICES */
    {path: '/invoices', name: 'Invoices', component: Invoices, meta: meta['/invoices']},
    {path: '/invoice/show/:id', name: 'InvoiceShow', component: InvoicesShow, meta: meta['/invoice/show/']},
    {path: '/invoice/create', name: 'InvoiceCreate', component: InvoicesForm, meta: meta['/invoice/create']},
    {path: '/invoice/edit/:id', name: 'InvoiceEdit', component: InvoicesForm, meta: meta['/invoice/edit/*']},

      /* USERS */
    {path: '/users', name: 'Users', component: Users, meta: meta['/users']},

    {path: '/settings', name: 'Settings', component: Settings, meta: meta['/settings']},
    {path: '/chat', name: 'Chat', component: Chat, meta: meta['/chat']},
    // Global redirect for 404
    {path: '*', redirect: '/'}
  ],
})