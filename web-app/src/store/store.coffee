import Vue from 'vue'
import Vuex from 'vuex'
import example from './modules/example.coffee'
import router from '../router/router.coffee'

Vue.use(Vuex)

export default new Vuex.Store

  modules:
    example: example

  state:
    loading: true
    cards: null
    activeCard: null
    cardPreview: null

    searchText: ''

  mutations:
    searchText: (state, payload) ->
      state.searchText = payload

    cardPreview: (state, payload) ->
      state.cardPreview = payload

    activeCard: (state, payload) ->
      state.activeCard = payload

    cards: (state, payload) ->
      state.cards = payload

  getters:
    filteredCards: (state) ->
      query = new RegExp( state.searchText, 'gi' )

      return _(state.cards)
        .filter (card) -> return card if not state.searchText or card.last_name.match(query) or card.first_name.match(query)
        .sortBy (card) -> return card.last_name
        .value()

  actions:
    init: ({ commit }) ->
      axios.post '/api/contact/list'
        .then (response) =>
          commit 'cards', response.data

        .catch (e) ->
          console.log e

    addNewCard: ({state}, card) =>
      console.log card

      router.push({name: 'contacts'})

    updateCard: ({state}, card) ->
      console.log card

      router.push({name: 'contacts'})

    deleteCard: ({state}, card) ->
      console.log card

    deleteContact: ({state}, contact) ->
      console.log contact

      Vue.notify
        type: 'warn'
        title: 'Delete Successful',
        text: 'Contact ' + card.first_name + ' ' + card.last_name + ' '

    setActiveFirstContact: ({ commit, getters }) ->
      commit 'activeCard', _.first getters.filteredCards
      commit 'cardPreview', _.first getters.filteredCards

    setActiveBeforeContact: () ->

    setActiveAfterContact: () ->
