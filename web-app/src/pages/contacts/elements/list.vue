<template lang="pug">

.list.block
  .wrapper.scrollbar
    .card(v-for = "card, i in $store.getters.filteredCards"
          :key = "'card_' + i"
          @mouseover = "setCardPreview(card)"
          @mouseout = "clearCardPreview()"
          :class = "{ 'active': $store.state.activeCard == card }")

      .name(@click = "setActiveCard(card)") {{ card.last_name }} {{ card.first_name }}


      control-card(:card = "card")

    .no-card(v-if = "$store.getters.filteredCards.length == 0 && $store.state.loading == false")
      p Sorry, contact was not found
      span please, change request

</template>

<script lang="coffee">

export default {

  methods:
    setCardPreview: (card) ->
      @$store.state.cardPreview = card if not @$store.state.activeCard

    clearCardPreview: (card) ->
      @$store.state.cardPreview = null if not @$store.state.activeCard

    setActiveCard: (card) ->
      if @$store.state.activeCard isnt card
        @$store.state.cardPreview = card
        @$store.state.activeCard = card
      else
        @$store.state.activeCard = null
        @$store.state.cardPreview = card
}

</script>

<style lang="sass" scoped>

.list
  width: 48%
  height: 70vh

  .wrapper
    width: 100%
    height: 100%
    overflow-y: scroll

  .card
    position: relative
    font-size: 1.2rem
    line-height: 1.8rem
    border-bottom: 1px solid rgba(0, 0, 0, 0.2)
    padding-top: .2rem
    margin-right: 1rem
    cursor: pointer
    padding-left: .5rem

    &.active
      background-color: $main-color !important
      color: #fff

    &:hover
      background-color: rgba(50,50,50, .1)

  .no-card
    margin-top: 5rem
    text-align: center
    font-size: 1.2rem


</style>