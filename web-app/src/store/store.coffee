import Vue from 'vue'
import Vuex from 'vuex'
import example from './modules/example.coffee'
import router from '../router/router.coffee'

Vue.use(Vuex)

export default new Vuex.Store

  modules:
    example: example

  state:
    loading: false
    cards: null
    activeCard: null
    cardPreview: null

    searchText: ''

  mutations:
    loadingStart: (state) ->
      state.loading = true

    loadingEnd: (state) ->
      state.loading = false

    searchText: (state, payload) ->
      state.searchText = payload

    cardPreview: (state, payload) ->
      state.cardPreview = payload

    activeCard: (state, payload) ->
      state.activeCard = payload

    cards: (state, payload) ->
      state.cards = payload

    addCard: (state, payload) ->
      state.cards.push payload

    deleteCards: (state, payload) ->
      newCards = _.cloneDeep state.cards

      for card, i in newCards
        if card.id == payload.id
          newCards.splice(i, 1)
          break

      state.cards = newCards
      state.activeCard = null
      state.cardPreview = null

  getters:
    filteredCards: (state) ->
      query = new RegExp( state.searchText, 'gi' )

      return _(state.cards)
        .filter (card) -> return card if not state.searchText or card.last_name.match(query) or card.first_name.match(query)
        .sortBy (card) -> return card.last_name
        .value()

  actions:
    init: ({ commit }) ->
      commit 'loadingStart'
      axios.post '/api/contact/list'
        .then (response) =>
          commit 'cards', response.data

        .catch (e) ->
          console.log e

        .finally ->
          commit 'loadingEnd'

    addNewCard: ({state, commit}, card) =>
      commit 'loadingStart'
      axios.post '/api/contact/create',
          card: card
        .then (response) =>
          if response.data.id
            commit 'addCard', response.data
            router.push({name: 'contacts'})

            Vue.notify
              type: 'success'
              title: 'Successful',
              text: 'New Contact: ' + card.first_name + ' ' + card.last_name + ' '

        .catch (e) ->
          console.log e

        .finally ->
          commit 'loadingEnd'



    updateCard: ({state, commit}, card) ->
      commit 'loadingStart'
      axios.post '/api/contact/update-card',
          card: card
        .then (response) =>
          if response.data.id
            commit 'deleteCards', response.data
            commit 'addCard', response.data
            router.push({name: 'contacts'})

            Vue.notify
              type: 'success'
              title: 'Successful',
              text: 'Update Contact: ' + card.first_name + ' ' + card.last_name + ' '

        .catch (e) ->
          console.log e

        .finally ->
          commit 'loadingEnd'

    deleteCard: ({state, commit}, card) ->
      commit 'loadingStart'
      axios.post '/api/contact/delete-card',
          id: card.id
        .then (response) =>
          if response.data
            commit 'deleteCards', card

            Vue.notify
              type: 'success'
              title: 'Successful',
              text: 'Delete Contact: ' + card.first_name + ' ' + card.last_name + ' '

        .catch (e) ->
          console.log e

        .finally ->
          commit 'loadingEnd'


    deleteContact: ({state, commit}, contactId) ->
      commit 'loadingStart'
      axios.post '/api/contact/delete-contact',
          id: contactId
        .then (response) =>
          if response.data
            return true

            Vue.notify
              type: 'success'
              title: 'Successful'

        .catch (e) ->
          console.log e

        .finally ->
          commit 'loadingEnd'


    setActiveFirstContact: ({ commit, getters }) ->
      commit 'activeCard', _.first getters.filteredCards
      commit 'cardPreview', _.first getters.filteredCards

    setActiveBeforeContact: () ->

    setActiveAfterContact: () ->
