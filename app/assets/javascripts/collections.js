// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$( document ).on('turbolinks:load', function(){
  $('div#expand-collection-create').on('click', function(){
    var $symbolEl = $('div#expand-collection-create span');
    var symbol = $('div#expand-collection-create span').html();
    $('#collection-create-form').slideToggle();
    symbol === '+' ? $symbolEl.html('-') : $symbolEl.html('+');
  });
})
