<template lang="pug">

#app
  header-component

  router-view


  notifications(position="bottom right")


</template>

<script lang="coffee">

export default {
  components:
    headerComponent: require('./header/header.vue').default

  created: ->
    @$store.dispatch 'init'


}

</script>

<style lang="sass">

#app

</style>