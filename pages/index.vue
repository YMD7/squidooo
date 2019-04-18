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
  background-color sq-blue
  background-image url('~assets/images/ObliqueLines.svg')
</style>
