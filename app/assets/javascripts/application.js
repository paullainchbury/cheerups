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

  $('#submit_cheerup').click(function(){
    var c = document.getElementById("test_canvas");
    var ctx = c.getContext("2d");
    ctx.font = "100 30px Times";
    ctx.fillStyle = 'white';
    ctx.textAlign = 'center';
    var x = c.width / 2;
    var text = $('#cheerup_title').val();
    ctx.fillText(text,x,310);
    ctx.font = "100 16px Times";
    var sub_text = $('#cheerup_sub_title').val(); // .split("").join(String.fromCharCode(8202));
    ctx.fillText(sub_text,x,335);
    var dataURL = test_canvas.toDataURL();
    console.log(dataURL);
    $('#cheerup_compositeupload_data').val(dataURL);

  })

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


// Trying out an html5 image upload to canvas function
//   function handleImage(e){
//     var canvas = document.getElementById('test_canvas');
//     var ctx = canvas.getContext('2d');
//     ctx.fillStyle="#000000";
//     ctx.fillRect(0,0,530,360);
//     var reader = new FileReader();
//     reader.onload = function(event){
//         var img = new Image();
//         img.onload = function(){
//             canvas.width = 530;
//             canvas.height = 360;
//             ctx.drawImage(img,30,20,470,250); //ctx.drawImage(img,0,0);
//         }
//         img.src = event.target.result;
//     }
//     reader.readAsDataURL(e.target.files[0]);     
// }



// <script>
//         // var c = document.getElementById("test_canvas");
//         // var ctx = c.getContext("2d");
//         // ctx.fillStyle="#000000";
//         // ctx.fillRect(0,0,530,360);
//         // var img = document.getElementById("canvas_image");
//         // ctx.drawImage(img,30,20,470,250);
//         ctx.font = "100 30px Times";
//         ctx.fillStyle = 'white';
//         ctx.textAlign = 'center';
//         var x = c.width / 2;
//         var text = $('#canvas_text').text();
//         ctx.fillText(text,x,310);
//         var dataURL = test_canvas.toDataURL();
//         console.log(dataURL);
//       </script>






// ---------------


  $('.hc_thumbnail').click(function(event){
      console.log("You clicked");
      cheerup = $(event.target).parents(".a_cheerup").find('.cheerupid').text();
      picture = $(event.target).parents('.a_cheerup').children('#picture_for_hipchat').text();
      user = $(event.target).parents('.a_cheerup').children('#author_for_hipchat').text();

      // picture = parentDiv.children('#picture_for_hipchat').text();
      // .children('.author_for_hipchat').text();
      // picture = $(event.target).parents("#a_cheerup").children('.picture_for_hipchat').text();
      // thisthing = $(event.target);
      // console.log(thisthing);
      // console.log(parentDiv);
      
      console.log('Picture: ' + picture);
      console.log('Cheerup: ' + cheerup);
      console.log('User: ' + user);


      // path = 

        $.ajax({
          url: "https://api.hipchat.com/v2/room/374044/notification?auth_token=n1nswU9gcqQsVDSflIa0cuv4171vNUoIKQg7Eqa5",
          // url:"https://api.hipchat.com/v2/user/584341/message?auth_token=n1nswU9gcqQsVDSflIa0cuv4171vNUoIKQg7Eqa5",
          type:"POST",
          data: JSON.stringify({ message: user + ' has posted a new cheerup! ' + picture, message_format: 'text' } ), //, message_format: "html" 
          contentType:"application/json; charset=utf-8",
          dataType:"json",
          success: function(data){
            console.log(data)
          }
        });
  });

  // function drawCanvas(img) {
  //       var c = document.getElementById("test_canvas");
  //       var ctx = c.getContext("2d");
  //       c.width = 530;
  //       c.height = 360;
  //       ctx.fillRect(0,0,530,360);
  //       ctx.drawImage(img,30,20,470,250);
        
  // }

  var Test = {
        UpdatePreview: function(obj){

          var canvas = document.getElementById('test_canvas');
          var ctx = canvas.getContext('2d');

          // if IE < 10 doesn't support FileReader
          if(!window.FileReader){
             // don't know how to proceed to assign src to image tag
          } else {
             var reader = new FileReader();
             var target = null;
             
             reader.onload = function(e) {

              var img = new Image();
              img.onload = function(){
                  canvas.width = 530;
                  canvas.height = 360;
                  ctx.fillRect(0,0,530,360);
                  ctx.drawImage(img,30,20,470,250); //ctx.drawImage(img,0,0);
              };

              img.src = event.target.result;
              target =  e.target || e.srcElement;
               $(".the_image").prop("src", target.result);
              

             };
              reader.readAsDataURL(obj.files[0]);
          }
        }
    };

});

function drawMainText() {
    var c = document.getElementById("test_canvas");
    var ctx = c.getContext("2d");
    ctx.font = "100 30px Times";
    ctx.fillStyle = 'white';
    ctx.textAlign = 'center';
    var x = c.width / 2;
    var text = $('#cheerup_title').val();
    ctx.fillText(text,x,310);
}

function drawSubText() {
    var c = document.getElementById("test_canvas");
    var ctx = c.getContext("2d");
    ctx.font = "100 16px Times";
    ctx.fillStyle = 'white';
    ctx.textAlign = 'center';
    var x = c.width / 2;
    var text = $('#cheerup_sub_title').val() // .split("").join(String.fromCharCode(8202));
    ctx.fillText(text,x,335);
    getDataUrl();
}

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



