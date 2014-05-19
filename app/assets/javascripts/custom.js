$(document).ready(function(){
  $('#twitter_scheduler_form').validationEngine();
  $('#schedule_at').datetimepicker({
    step: 5
  });

  // Set limit to enter characters in post_text textarea of
  // twitter_scheduler form

  $('.message').keyup(function () {
    var the_input_len;
    var the_input;
    the_input=$('.message').val();
    the_input_len=$('.message').val().length;
    the_input_len= 140 - the_input_len;

    if (the_input_len>=0) {
      $('.countdown').html(the_input_len + ' characters remaining');  //code
    }
    if(the_input_len<0){
      $('.countdown').html('Text is too long. The maximum character length is 140.').css('color', 'red');
      $('.message').val($('.message').val().slice(0, 140));
    }
  });
});
