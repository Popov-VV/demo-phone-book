import Vue from 'vue'
import Router from 'vue-router'
import groupExample from './group/groupExample.coffee'

Vue.use(Router)

mainRoutes = [
    path: '/'
    component: require('../pages/contacts/contacts.vue').default
    name: 'contacts'
  ,
    path: '/add-contact'
    component: require('../pages/add-contact/add-contact.vue').default
    name: 'add-contact'
  ,
    path: '/edit-contact/:id'
    component: require('../pages/edit-contact/edit-contact.vue').default
    name: 'edit-contact'
]

routes = _.concat mainRoutes, groupExample

export default new Router
  mode: 'history',
  base: process.env.BASE_URL,
  routes: routes
