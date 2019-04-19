<template lang="pug">
section.container
  header
    h1
      Logo
  section.signin
    Signin
  Footer
</template>

<script>
import Logo from '~/components/Logo.vue'
import Signin from '~/components/Signin.vue'
import Footer from '~/components/Footer.vue'

export default {
  components: {
    Logo: Logo,
    Signin: Signin,
    Footer: Footer
  }
}
</script>

<style scoped lang="stylus">
.container
  display flex
  flex-direction column
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

.signin
  flex 1
  display flex
  justify-content center
  align-items center
  margin-top -26%
</style>
