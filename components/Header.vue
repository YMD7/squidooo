<template lang="pug">
header(:class="page")
  h1(:class="page")
    Logo
</template>

<script>
import Logo from '~/components/Logo.vue'

export default {
  components: {
    Logo: Logo
  },
  props: {
    page: {
      type: String,
      default: ''
    }
  }
}
</script>

<style scoped lang="stylus">
header
  display flex
  justify-content center
  align-items center
header.index
  position relative
  left -8px
  width 100vw

h1
  width 60vw
h1.index
  width 100vw

.logo
  width 100%
</style>
