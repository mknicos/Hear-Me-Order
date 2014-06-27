
$(document).ready(hideAlertBox);


function hideAlertBox(){
  setTimeout(removeAlert, 3000);
}

function removeAlert(){
  $('.alert-box').fadeOut(3000);
}
