<template lang="pug">

.control(:class = "{ 'large': large }")
  router-link.edit.element(:to = "{ name: 'edit-contact', params: { id: card.id } }")
  .delete.element(@click = "$modal.show('deleteCard', { card: card })")

</template>

<script lang="coffee">

import Vue from 'vue'

export default Vue.component 'control-card', {

  props: [
    'large'
    'card'
  ]


}


</script>

<style lang="sass" scoped>

.control
  position: absolute
  right: 0
  top: 0
  display: flex
  flex-direction: row
  padding-left: .3rem
  z-index: 1

  &.large
    .element
      width: 3rem
      height: 3rem

      &:before
        width: 1.5rem
        height: 1.5rem

  .element
    position: relative
    padding-left: 0rem
    cursor: pointer
    width: 2rem
    height: 2rem

    &:hover
      &:before
        opacity: 1

    &:before
      content: ''
      position: absolute
      left: 0
      top: .3rem
      width: 1.3rem
      height: 1.3rem
      opacity: .5
      background-position: center
      background-size: contain
      background-repeat: no-repeat

  .edit
    &:before
      top: .4rem
      background-image: url("../../assets/icons/edit.png")

  .delete
    &:before
      background-image: url("../../assets/icons/remove.png")




</style>