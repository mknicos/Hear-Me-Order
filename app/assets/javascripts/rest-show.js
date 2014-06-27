$("#restaurant-show-page").ready(initializeRestShowJS);

function initializeRestShowJS(){
  $('#order-start').click(startOrder);
  $('#order-stop').click(stopOrder);
  $('#order-clear').click(clearOrder);

  var recognition = new webkitSpeechRecognition();
  recognition.continuous = true;
  recognition.continuous = true;
  recognition.lang ="en";

  function startOrder(){
    recognition.start();
  }

  function stopOrder(){
    recognition.stop();
  }

  function clearOrder(){
    $('#order-text').val('');
  }

  recognition.onresult = function(event){
    console.log(event.results[0][0].transcript);
    for (var i = event.resultIndex; i < event.results.length; ++i) {
        if (event.results[0].isFinal) {
          $('#order-text').val(event.results[0][0].transcript);
        }
    }
  };
}
