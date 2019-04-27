<template lang="pug">
.container
  Header(page="index")
  nuxt
  Footer
</template>

<script>
import Header from '~/components/Header.vue'
import Footer from '~/components/Footer.vue'

export default {
  components: {
    Header: Header,
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
</style>
