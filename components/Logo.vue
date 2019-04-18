<template lang="pug">
  img.logo(:src="Logo")
</template>

<script>
import SVG from '~/assets/images/Logo.svg'

export default {
  data() {
    return {
      Logo: SVG
    }
  }
}
</script>

<style scoped lang="stylus">
</style>
