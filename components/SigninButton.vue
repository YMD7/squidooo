<template lang="pug">
button
  .icon
    SNSIcon(:sns="sns")
  .text(:class="sns")
    | {{ sns }}
    span.small
      | &nbsp;でログイン
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
button
  display flex
  background-color #FFFFFF
  border 6px solid #FFFFFF
  border-radius 6px
  box-shadow 5px 7px #000000
  width 242px
  height 65px

.icon
  display flex
  justify-content center
  align-items center
  width 42px
  height 44px

.text
  display flex
  justify-content center
  align-items center
  padding-block-start 1px
  width 175px
  height 44px
  font-size 0.95rem
  &.Google
    color googleColor
  &.Facebook
    color facebookColor
  &.Twitter
    color twitterColor

.small
  font-size 0.88rem
</style>
