<template lang="pug">
img(:src="Icon")
</template>

<script>
import Google from '~/assets/images/GoogleIcon.svg'
import Facebook from '~/assets/images/FacebookIcon.svg'
import Twitter from '~/assets/images/TwitterIcon.svg'

export default {
  props: {
    sns: {
      type: String,
      default: 'null'
    }
  },
  data() {
    let SNS
    switch (this.sns) {
      case 'Google':
        SNS = Google
        break
      case 'Facebook':
        SNS = Facebook
        break
      case 'Twitter':
        SNS = Twitter
        break
    }
    return {
      Icon: SNS
    }
  }
}
</script>
