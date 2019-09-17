<template lang="pug">

.edit-contact(v-if = "$store.state.cards")

  .title Edit contact

  form-edit-contact(:cardEnter = "cardEnter"
                    @save = "$store.dispatch('updateCard', $event)")


</template>

<script lang="coffee">

export default {

  computed:
    cardEnter: ->
      return _.find @$store.state.cards, (x) => return x.id is Number @$route.params.id


}

</script>

<style lang="sass" scoped>

.edit-contact
  margin-top: 4rem
  display: flex
  flex-direction: column
  align-items: center

  .title
    font-size: 1.8rem
    font-family: Roboto
    margin-bottom: 2rem

</style>