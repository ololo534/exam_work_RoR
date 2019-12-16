#= require rails-ujs
#= require activestorage
#= require_tree .
#= require jquery
#= require bootstrap
$ ->
  'use strict'
  $('[data-toggle="offcanvas"]').on 'click', ->
    $('.offcanvas-collapse').toggleClass 'open'
    return
  return
