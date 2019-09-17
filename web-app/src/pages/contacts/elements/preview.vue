<template lang="pug">

.preview.block
  .wrapper(v-if = "card")
    .info.string
      span First Name:
      .first_name.value {{ card.first_name }}

    .info.string
      span Last Name:
      .last_name.value {{ card.last_name }}

    .contact
      .info.column(v-for = "contact in card.contacts")
        span {{ contact.type }}:
        .last_name.value {{ contact.contact }}

        .delete-element

    control-card.fixed-position-control(:large = "true"
                                        :card = "card")

</template>

<script lang="coffee">

export default {

  computed:
    card: ->
      return @$store.state.cardPreview

}

</script>

<style lang="sass" scoped>

.preview
  width: 48%
  min-height: 30vh
  height: fit-content

  position: relative

  .fixed-position-control
    top: 1rem
    right: 1rem

  .info
    display: flex

    &.string
      align-items: center
      margin-bottom: .5rem

    &.column
      flex-direction: column
      margin-bottom: 1rem

      .value
        margin-left: 2rem
        padding-top: .2rem


    span
      width: 9rem
      font-size: 1.1rem
      color: $grey-text

      &:first-letter
        text-transform: uppercase

    .value
      font-size: 1.3rem

  .contact
    margin-top: 2rem


</style>