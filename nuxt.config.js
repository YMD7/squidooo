const pkg = require('./package')

module.exports = {
  mode: 'universal',

  /*
   * Env
  */
  env: {
    FIREBASE_APIKEY: 'AIzaSyCxTvSWS2jFilzgEp_RRuNzaM64RDN97oQ',
    FIREBASE_AUTHDOMAIN: 'squidooo.firebaseapp.com',
    FIREBASE_DATABASEURL: 'https://squidooo.firebaseio.com',
    FIREBASE_PROJECTID: 'squidooo',
    FIREBASE_STORAGEBUCKET: 'squidooo.appspot.com',
    FIREBASE_MESSAGINGSENDERID: '961487923835'
  },

  /*
  ** Headers of the page
  */
  head: {
    title: pkg.name,
    meta: [
      { charset: 'utf-8' },
      { name: 'viewport', content: 'width=device-width, initial-scale=1' },
      { hid: 'description', name: 'description', content: pkg.description }
    ],
    link: [{ rel: 'icon', type: 'image/x-icon', href: '/favicon.ico' }]
  },

  /*
  ** Customize the progress-bar color
  */
  loading: { color: '#fff' },

  /*
  ** Global CSS
  */
  css: ['~/assets/stylesheets/default.styl'],

  /*
  ** Plugins to load before mounting the App
  */
  plugins: [],

  /*
  ** Nuxt.js modules
  */
  modules: [
    // Doc: https://axios.nuxtjs.org/usage
    '@nuxtjs/axios',
    '@nuxtjs/pwa',
    // for global sass/stylus settings
    '@nuxtjs/style-resources'
  ],
  /*
  ** Axios module configuration
  */
  axios: {
    // See https://github.com/nuxt-community/axios-module#options
  },

  /*
   ** Style Resources configuration
  */
  styleResources: {
    stylus: ['~assets/stylesheets/variables.styl']
  },

  /*
  ** Build configuration
  */
  build: {
    /*
    ** You can extend webpack config here
    */
    extend(config, ctx) {
      // Run ESLint on save
      if (ctx.isDev && ctx.isClient) {
        config.module.rules.push({
          enforce: 'pre',
          test: /\.(js|vue)$/,
          loader: 'eslint-loader',
          exclude: /(node_modules)/
        })
      }
    }
  }
}
