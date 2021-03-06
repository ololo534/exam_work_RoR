#= require jquery
#= require jquery_ujs
do ->
  'use strict'
  $(window).one 'load', ->
    $Form = $('#form')
    $Table = $('#table')
    $Error = $('#error')
    $Form.on 'submit', ->
      $HTML = ''
      $Table.find('tr:not(:first)').remove()
      $.get 'search/ajax.json', $Form.serialize(), ($JSON) ->
        console.log $JSON['solution']
        if $JSON['solution'].length == 0
          $Table.hide()
          $Error.show()
        else
          $.each $JSON['solution'], ($NULL, $Value) ->
            $HTML += '<tr> <td>' + $Value.title + '</td>  ' +
              '<td>' + $Value.time_work + '</td> ' +
                ' <td>' + '<a class="new_link" href="/all_recipe/' + $Value.id + '">Подробнее</a>' + '</td> </tr>'
            return
          $Table.show().append $HTML
          $Error.hide()
        return
      return
    return
  return
