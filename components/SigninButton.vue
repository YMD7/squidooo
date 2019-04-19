<template lang="pug">
button
  .icon
    SNSIcon(:sns="sns")
  .text
    | {{ sns }}
    span.small
      |  でログイン
</template>

<script>
import SNSIcon from '~/components/SNSIcon.vue'

export default {
  components: {
    SNSIcon: SNSIcon
  },
  props: {
    sns: {
      type: String,
      default: 'null'
    }
  }
}
</script>

<style scoped lang="stylus">
.text
  font-size 0.95rem

.small
  font-size 0.88rem
</style>
