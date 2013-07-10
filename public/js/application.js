var jobstatus = function(jid) {
  $.get('/status/'+jid, function(response){
    if (response.complete === true) {
      alert("tweet is sent");
    }
    else {
      setTimeout(jobstatus(jid), 500);
    }
  });
};


$(document).ready(function() {
  $('form').submit(function(event){
    event.preventDefault();
    var tweetData = $(this).serialize();
    $.post('/tweet', tweetData, function(data) {
      jobstatus(data);
    });
  });
});