<template lang="pug">

.contacts
  .wrapper
    .control
      search

      router-link.button(:to = { name: 'add-contact' }) Add Contact

    .content
      list-card

      preview-contact

  delete-card


</template>

<script lang="coffee">


export default {

  components:
    listCard: require('./elements/list.vue').default
    previewContact: require('./elements/preview.vue').default
    search: require('./elements/search.vue').default

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
    flex-direction: column
    justify-content: center
    align-items: center
    width: 70%

    .control
      display: flex
      justify-content: space-between
      width: 100%

      margin-bottom: 1.5rem

    .content
      display: flex
      flex-direction: row
      justify-content: space-between
      flex-grow: 1

      width: 100%


</style>