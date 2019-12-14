
//= require jquery
//= require jquery_ujs
(function(){
    'use strict';

    $(window).one('load', function() {
        let $Form = $('#form');
        let $Table = $('#table');
        let $Error = $('#error');

        $Form.on('submit', function() {
            let $HTML = '';
            $Table.find('tr:not(:first)').remove();
            $.get('search/ajax.json', $Form.serialize(), function($JSON) {
                if($JSON['solution'][0] === 0) {
                    $Table.hide();
                    $Error.show();
                } else {
                    console.log($JSON['solution']);
                    $.each($JSON['solution'], function($NULL, $Value) {
                        $HTML += '<tr>\
                        <td>' + $Value.title + '</td>\
                        <td>' + $Value.time_work + '</td>\
                        <td>' +'<a class="new_link" href="/all_recipe/'+ $Value.id +'" >Подробнее</a>' + '</td>\
                    </tr>';
                    });
                    $Table.show().append($HTML);
                    $Error.hide();
                }
            });
        });
    });
})();
