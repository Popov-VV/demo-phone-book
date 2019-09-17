<template lang="pug">

modal(name = "deleteCard"
      height = "250px"
      class = "delete-card"
      @before-open = "beforeOpen")

  .delete-modal(:class = "{ 'validation': submitStatus }")
    .v--modal-close(@click = "$modal.hide('deleteCard')")

    h2.title.fonts-bold Удаление контакта

    p(v-if = "card") {{ card.first_name }} {{ card.last_name }}

    .controlButton
      .button.success(@click = "$modal.hide('deleteCard')") Отмена
      .button.danger(@click = "deleteCard()") Удалить


</template>

<script lang="coffee">

import Vue from 'vue'

import { validationMixin } from 'vuelidate'
import { required, minLength, maxLength, email } from 'vuelidate/lib/validators'

export default Vue.component 'delete-card', {

  mixins: [validationMixin]

  data: ->
    card: null
    submitStatus: false

  methods:
    beforeOpen: (event) ->
      @card = event.params.card

    deleteCard: ->
      @$store.dispatch 'deleteCard', @card
      @$modal.hide('deleteCard')


}


</script>

<style lang="sass" scoped>
.change-price
  .v--modal

.delete-modal
  display: flex
  flex-direction: column
  align-items: center
  justify-content: center
  height: 100%

  .title
    margin-bottom: 1rem
    text-align: center
    margin-top: 0

  p
    font-size: 1.5rem
    margin: 0

  .controlButton
    width: 60%
    display: flex
    justify-content: space-between

    .button
      margin-top: 2.5rem

</style>
