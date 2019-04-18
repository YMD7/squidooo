<template lang="pug">
section.container
  header
    h1
      Logo
  section.signin
    Signin
</template>

<script>
import Logo from '~/components/Logo.vue'
import Signin from '~/components/Signin.vue'

export default {
  components: {
    Logo: Logo,
    Signin: Signin
  }
}
</script>

<style scoped lang="stylus">
.container
  border 8px solid #000000
  background-color sq-blue
  background-image url('~assets/images/ObliqueLines.svg')
  height 100vh
header
  position relative
  left -8px
  width 100vw
.logo
  width 100%
</style>
