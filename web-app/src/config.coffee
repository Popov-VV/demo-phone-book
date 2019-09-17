import Vue from 'vue'
import Vuelidate from 'vuelidate'
import Notifications from 'vue-notification'
import vmodal from 'vue-js-modal'

Vue.use(vmodal)
Vue.use(Vuelidate)
Vue.use(Notifications)


# Подключаем все остальные файлы
files = require.context('.', true, /(?!entry).*?.(coffee|js|vue)$/)
files.keys().forEach (key) -> files(key)


axios.defaults.headers.common =
  'Content-Type': 'application/json'

axios.defaults.baseURL = 'http://api-app.dev'

