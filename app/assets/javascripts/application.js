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
      changeCheerupText();
  });

  $('#cheerup_sub_title').keyup(function(){
      charCheck();
      changeCheerupText();
  });

  $('#thumb1').click(function(){
      changeCheerupImage('/assets/Motivation1.png');
      changeImageText('/assets/Motivation1.png');
  });

  $('#thumb2').click(function(){
      changeCheerupImage('/assets/Motivation2.png');
      changeImageText('/assets/Motivation2.png');
  });

  $('#thumb3').click(function(){
      changeCheerupImage('/assets/littlehouse.jpg');
      changeImageText('/assets/littlehouse.jpg');
  });

  $('#thumb4').click(function(){
      changeCheerupImage('/assets/paradise.jpg');
      changeImageText('/assets/paradise.jpg');
  });

  $('#thumb5').click(function(){
      changeCheerupImage('/assets/road.jpg');
      changeImageText('/assets/road.jpg');
  });

  $('#thumb6').click(function(){
      changeCheerupImage('/assets/yellowfield.jpg');
      changeImageText('/assets/yellowfield.jpg');
  });

  changeCheerupText();

  $('#cheerup_imageupload').change(function(){
      Test.UpdatePreview(this);
  });

  $('.hc_thumbnail').click(function(event){
      console.log("You clicked");
      cheerup = $(event.target).parents(".a_cheerup").find('.cheerupid').text();
      user = $(event.target).parents(".a_cheerup").find('.username').text();

      // path = 

        $.ajax({
          url:"https://api.hipchat.com/v2/user/584341/message?auth_token=bTrbjP8dnXSsoLTM1lQs80pYlyGmxL7PYbUZx3Jo",
          type:"POST",
          data: JSON.stringify({ message: user + ' just created a new cheerup! Take a look at http://fierce-depths-1541.herokuapp.com/cheerups/' + cheerup  + ' https://cheerup.s3.amazonaws.com/uploads/cheerup/imageupload/14/41.jpg'} ), //, message_format: "html" 
          contentType:"application/json; charset=utf-8",
          dataType:"json",
          success: function(data){
            console.log(data);
          }
        });
  });

  var Test = {
        UpdatePreview: function(obj){
          // if IE < 10 doesn't support FileReader
          if(!window.FileReader){
             // don't know how to proceed to assign src to image tag
          } else {
             var reader = new FileReader();
             var target = null;
             
             reader.onload = function(e) {
              target =  e.target || e.srcElement;
               $(".the_image").prop("src", target.result);
             };
              reader.readAsDataURL(obj.files[0]);
          }
        }
    };

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
    };

function changeCheerupText() {
  $('#main_text').text($('#cheerup_title').val());
  $('#sub_text').text($('#cheerup_sub_title').val());
};

function changeCheerupImage(image) {
  $('.the_image').attr('src', image);
};

function changeImageText(image) {
  $('#cheerup_image').text("");
  $('#cheerup_image').text(image);
  $('#cheerup_image').val(image);
};



