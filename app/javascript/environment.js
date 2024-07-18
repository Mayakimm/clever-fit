const { environment } = require('@rails/webpacker')
const { VueLoaderPlugin } = require('vue-loader')
const StimulusWebpackPlugin = require('@stimulus/webpack-helpers').StimulusWebpackPlugin

environment.plugins.prepend('StimulusWebpackPlugin', new StimulusWebpackPlugin())
environment.plugins.prepend('VueLoaderPlugin', new VueLoaderPlugin())

module.exports = environment
                                                                  