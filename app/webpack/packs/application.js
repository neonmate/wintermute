/* eslint no-console:0 */
import 'babel-polyfill' // ES6 for browsers like IE

import 'unpoly/dist/unpoly'
import 'jquery-ujs'

import 'assets'

// Expose jQuery to developers
import jQuery from 'jquery'
window.$ = jQuery
window.jQuery = jQuery
