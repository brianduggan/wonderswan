// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


$( document ).on('turbolinks:load', function(){
  $('button#edit-game').on('click', function(){
    console.log()
    $('#edit-game-container').slideToggle();
  });
})



//
