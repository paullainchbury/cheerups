// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.infinitescroll
//= require_tree .


$(function(){
  $('#cheerup_title').keyup(function () {
      charCheck();
      changeCheerupImage();
  });

  $('#cheerup_sub_title').keyup(function(){
      charCheck();
      changeCheerupImage();
  });

});

function charCheck() {
    var charsAvailable = 141
    var titleCharCount = $('#cheerup_title').val().length;
    var subtitleCharCount = $('#cheerup_sub_title').val().length;
    var totalChars = titleCharCount + subtitleCharCount
    var charsLeft = charsAvailable - totalChars
    if (charsLeft <= 10) {
      $('#counter').removeClass().addClass('countCharsRed');
    } else {
        $('#counter').removeClass().addClass('countCharsOK');
      }
    $('#counter').text(charsLeft);
    }

function changeCheerupImage() {
  $('#main_text').text($('#cheerup_title').val());
  $('#sub_text').text($('#cheerup_sub_title').val());
};
