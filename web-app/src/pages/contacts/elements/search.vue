<template lang="pug">

.search
  .wrapper
    input.search-input( v-model = "text"
                        placeholder = "Search"
                        v-on:keyup.enter = "$store.dispatch('setActiveFirstContact')")
    .not-clear(v-if = "text"
              @click = "clear()")

</template>

<script lang="coffee">

export default {

  data: ->
    text: null

  methods:
    clear: ->
      @text = ''

  watch:
    text: (newValue) ->
      @$store.commit 'searchText', newValue

}

</script>

<style lang="sass" scoped>

.search
  width: 48%

  .wrapper
    position: relative
    width: 100%
    height: 100%

    .search-input
      width: 100%
      height: 100%
      border-radius: 5px
      border: 1px solid rgba(0,0,0, 0.2)
      outline: none
      padding-left: 2.5rem
      padding-right: 1rem
      font-size: 1rem

    &:before
      content: ''
      position: absolute
      left: .7rem
      top: .7rem
      width: 1.3rem
      height: 1.3rem
      opacity: .7
      background-position: center
      background-size: contain
      background-repeat: no-repeat
      background-image: url("../../../assets/icons/search.png")

    .not-clear
      &:after
        content: ''
        position: absolute
        right: .7rem
        top: .3rem
        width: 2rem
        height: 2rem
        opacity: .9
        background-position: center
        background-size: contain
        background-repeat: no-repeat
        background-image: url("../../../assets/icons/delete.png")


</style>