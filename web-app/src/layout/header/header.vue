<template lang="pug">

.header
  .name-company web-app

  .links
    router-link.link.main(:to = "{ name: 'contacts' }") Contacts

</template>

<script lang="coffee">

export default {


}

</script>

<style lang="sass" scoped>

.header
  display: flex
  align-items: center
  padding: 0 2rem
  background-color: $main-color
  height: 3rem

  .name-company
    font-family: 'Roboto'
    font-size: 1.5rem
    color: #fff
    min-width: 15%
    padding-right: 2rem

  .links
    display: flex
    flex-direction: row

    .link
      margin-right: 1.5rem
      cursor: pointer
      color: #fff

      &:hover
        text-decoration: underline


</style>