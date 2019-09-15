const webpack = require('webpack');
const path = require("path");

module.exports = {
  pages: {
    index: {
      entry: 'src/main.js',
      template: 'src/index.pug',
    }
  },

  configureWebpack: {
    plugins: [
      new webpack.ProvidePlugin({
        Promise: 'bluebird',
        $: 'jquery',
        jQuery: 'jquery',
        'Vue': 'vue',
        _: 'lodash',
        axios: 'axios',
        vuelidate: 'vuelidate'
      })
    ]
  },

  css: {
    sourceMap: true,
    loaderOptions: {
      sass: {
        data: `@import "@/styles/settings/variables.sass"`
      },

    }
  },

  productionSourceMap: false

}


