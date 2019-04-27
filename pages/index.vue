<template lang="pug">
section.signin
  Signin
</template>

<script>
import Signin from '~/components/Signin.vue'

export default {
  layout: 'index',
  components: {
    Signin: Signin
  }
}
</script>

<style scoped lang="stylus">
.signin
  flex 1
  display flex
  justify-content center
  align-items center
  margin-top -26%
</style>
