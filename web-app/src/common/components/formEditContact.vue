<template lang="pug">

.form-edit-contact(:class = "{ 'validation': submitStatus }")

  v-input(v-model = "card.first_name"
          placeholderActive = "First Name"
          description = "example min 2 char and max 255"
          v-validate = "$v.card.first_name")

  v-input(v-model = "card.last_name"
          placeholderActive = "Last Name"
          description = "example min 2 char and max 255"
          v-validate = "$v.card.last_name")


  .wrapper-contact(v-for = "contact, i in card.contacts"
                  :key = "contact.id")

      v-input(v-model = "card.contacts[i].contact"
              :placeholderActive = "contact.type"
              v-validate = "$v.card.contacts.$each[i]")

      .delete-contact(v-if = "card.contacts.length > 1"
                      @click = "deleteContact(i)")

  .control
    .add-phone(@click = "addPhone()") Add phone
    .add-skype(@click = "addSkype()") Add skype

    .wrapper-button
      .button.success(@click = "save()") save
      router-link.button.danger(:to = "{ name: 'contacts' }") go back without save

</template>

<script lang="coffee">

import Vue from 'vue'
import { validationMixin } from 'vuelidate'
import { required, minLength, maxLength, email } from 'vuelidate/lib/validators'

export default Vue.component 'form-edit-contact', {

  mixins: [validationMixin]

  props: [
    'cardEnter'
  ]

  data: ->
    submitStatus: false

    card:
      first_name: null
      last_name: null
      contacts: [
        type: 'phone'
        contact: null
      ]

  created: ->
    @card = @cardEnter if @cardEnter

  methods:
    addPhone: ->
      @card.contacts.push
        type: 'phone'
        contact: null

    addSkype: ->
      @card.contacts.push
        type: 'skype'
        contact: null

    deleteContact: (index) ->
      console.log asdas = _.cloneDeep @card.contacts
      @card.contacts.splice index, 1
      console.log @card.contacts



    save: ->
      @submitStatus = true

      if not @$v.$error
        @$emit('save', @card)


  validations:
    card:
      first_name:
        minLength: minLength(2)
        maxLength: maxLength(255)
        required: required

      last_name:
        minLength: minLength(2)
        maxLength: maxLength(255)
        required: required

      contacts:
        $each:
          contact:
            required: required


}


</script>

<style lang="sass" scoped>


.form-edit-contact
  width: 400px


  .wrapper-contact
    position: relative

    .delete-contact
      cursor: pointer

      &:after
        content: ''
        position: absolute
        right: -3rem
        top: .3rem
        width: 1.3rem
        height: 1.3rem
        opacity: .7
        background-position: center
        background-size: contain
        background-repeat: no-repeat

        background-image: url("../../assets/icons/minus.png")


  .control
    margin-top: 2rem

    .add-phone,
    .add-skype
      position: relative
      color: $input-color
      padding-left: 3rem
      font-size: 1.2rem
      margin-bottom: 1rem
      cursor: pointer

      &:before
        content: ''
        position: absolute
        left: .85rem
        top: .1rem
        width: 1.5rem
        height: 1.5rem
        opacity: .7
        background-position: center
        background-size: contain
        background-repeat: no-repeat

        background-image: url("../../assets/icons/plus.png")

    .wrapper-button
      display: flex
      flex-direction: column
      align-items: center
      justify-content: center
      margin-top: 3rem
      width: 400px


      .button.success
        margin-bottom: 3rem


</style>