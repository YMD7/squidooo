<template lang="pug">
button
  .icon
    SNSIcon(:sns="sns")
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
