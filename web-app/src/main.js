require('./config.coffee');
// require('./globalComponents.coffee');
require('./styles/main.sass');

import Vue from 'vue'
import App from './layout/index.vue'
import { sync } from 'vuex-router-sync'
import router from './router/router.coffee'
import store from './store/store.coffee'
import './registerServiceWorker'

sync(store, router);

Vue.config.productionTip = false;
Vue.config.devtools = true;

new Vue({
    router,
    store,
    render: h => h(App)
}).$mount('#app');
