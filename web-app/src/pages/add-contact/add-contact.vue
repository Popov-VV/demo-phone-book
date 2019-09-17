<template lang="pug">

.add-contact

  .title New contact

  form-edit-contact(@save = "$store.dispatch('addNewCard', $event)")


</template>

<script lang="coffee">

export default {


}

</script>

<style lang="sass" scoped>

.add-contact
  margin-top: 4rem
  display: flex
  flex-direction: column
  align-items: center

  .title
    font-size: 1.8rem
    font-family: Roboto
    margin-bottom: 2rem

</style>