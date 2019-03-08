const { environment } = require('@rails/webpacker')

module.exports = environment

// https://github.com/rails/webpacker/blob/b685da4daabb1e064e93591ddcd1c40f88abd4a9/docs/v4-upgrade.md#excluding-node_modules-from-being-transpiled-by-babel-loader
environment.loaders.delete('nodeModules')
