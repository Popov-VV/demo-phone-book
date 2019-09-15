import Vue from 'vue'
import Vuex from 'vuex'
import example from './modules/example.coffee'

Vue.use(Vuex)

export default new Vuex.Store

  modules:
    example: example

  state:
    loading: true
    cards: null
    activeCard: null
    cardPreview: null

  mutations:
    cards: (state, payload) ->
      state.cards = payload

  getters:
    filteredCards: (state) ->
      return _.sortBy state.cards, 'last_name'

  actions:
    init: ({ commit }) ->
      axios.post '/api/contact/list'
        .then (response) =>
          commit 'cards', response.data

        .catch (e) ->
          console.log e
