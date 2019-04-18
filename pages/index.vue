<template lang="pug">
section.container
  header
    h1
      Logo
</template>

<script>
import Logo from '~/components/Logo.vue'

export default {
  components: {
    Logo: Logo
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
  position absolute
  left 0
  width 100vw
.logo
  width 100%
</style>
