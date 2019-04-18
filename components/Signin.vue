<template lang="pug">
ul
  li(v-for="name in names")
    SigninButton(:sns="name")
</template>

<script>
import SigninButton from '~/components/SigninButton.vue'

export default {
  components: {
    SigninButton: SigninButton
  },
  data() {
    return {
      names: ['Google', 'Facebook', 'Twitter']
    }
  }
}
</script>
