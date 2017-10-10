$(function (){
  $('#convert').on('click', function(event){
    event.preventDefault();
    console.log('click click click');
    var url = $(this).('/submit') // route in statuc.rb

    $.ajax({
      url: url,
      type: 'POST'
    }).done(function(postForm){
      $('#showData').show(); // div to present
      $('#test-ajax').append(postForm); // paragraph in div #showData to write to
    }).fail(function(){
      console.log('fail failed failure');
    })
  }) // new url append function
  });
});
