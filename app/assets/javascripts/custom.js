$(document).ready(function(){
  var d = new Date();
  var time = d.getHours() + ":" + d.getMinutes();
  $('#twitter_scheduler_form').validationEngine();

  var logic = function(currentDateTime) {
    console.log('** logic');
    console.log(currentDateTime.getDate());
    if (currentDateTime.getDate() == new Date().getDate()){
      this.setOptions({
        minDate: 0,
        minTime: time,
        step: 5
      });
    }else{
      this.setOptions({
        minDate: 0,
        minTime: '00:00',
        step: 5
      });
    }
  }

  $('#schedule_at').datetimepicker({
    onChangeDateTime:logic,
    onShow: logic
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
