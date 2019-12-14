
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
//= require jquery
$(function () {
    'use strict'

    $('[data-toggle="offcanvas"]').on('click', function () {
        $('.offcanvas-collapse').toggleClass('open')
    })
})
