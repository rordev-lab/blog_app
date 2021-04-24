$(document).on('click', 'button.close[data-dismiss="alert"]', function(){
  $(this).closest('.alert').slideUp(500, function () {
    $(this).closest('.alert').hide();
  });
});

$( document ).ready(function() {
  window.setTimeout(function () {
    $(".alert:not(#error_explanation)").slideUp(1000, function () {
      $(".alert").hide();
    });
  }, 1500);
});