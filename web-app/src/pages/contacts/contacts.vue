<template lang="pug">

.contacts
  .wrapper
    //.control
      search

      .new-contact

    .content
      list-card

      preview-contact(:card = "card")


</template>

<script lang="coffee">


export default {

  components:
    listCard: require('./elements/list.vue').default
    previewContact: require('./elements/preview.vue').default
    search: require('./elements/search.vue').default

  data: ->
    card: ''


}

</script>

<style lang="sass" scoped>

.contacts
  display: flex
  justify-content: center
  flex-grow: 1
  margin: 3rem 0

  .wrapper
    display: flex
    justify-content: center
    width: 70%

    .control
      display: flex
      justify-content: space-between

      .search

      .new-contact

    .content
      display: flex
      flex-direction: row
      justify-content: space-between
      flex-grow: 1





</style>