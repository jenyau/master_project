const { environment } = require('@rails/webpacker')

environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader'
});

const webpack = require('webpack')
environment.plugins.prepend('Provide',
  new webpack.ProvidePlugin({
    $: 'jquery/src/jquery',
    jQuery: 'jquery/src/jquery'
  })
)

module.exports = environment
