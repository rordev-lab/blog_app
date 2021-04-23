// Floating label headings for the contact form
$("body").on("input propertychange", ".floating-label-form-group", function(e) {
  $(this).toggleClass("floating-label-form-group-with-value", !!$(e.target).val());
}).on("focus", ".floating-label-form-group", function() {
  $(this).addClass("floating-label-form-group-with-focus");
}).on("blur", ".floating-label-form-group", function() {
  $(this).removeClass("floating-label-form-group-with-focus");
});

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
  
  // Show the navbar when the page is scrolled up
  var MQL = 992;

  //primary navigation slide-in effect
  if ($(window).width() > MQL) {
    var headerHeight = $('#mainNav').height();
    $(window).on('scroll', {
        previousTop: 0
      },
      function() {
        var currentTop = $(window).scrollTop();
        //check if user is scrolling up
        if (currentTop < this.previousTop) {
          //if scrolling up...
          if (currentTop > 0 && $('#mainNav').hasClass('is-fixed')) {
            $('#mainNav').addClass('is-visible');
          } else {
            $('#mainNav').removeClass('is-visible is-fixed');
          }
        } else if (currentTop > this.previousTop) {
          //if scrolling down...
          $('#mainNav').removeClass('is-visible');
          if (currentTop > headerHeight && !$('#mainNav').hasClass('is-fixed')) $('#mainNav').addClass('is-fixed');
        }
        this.previousTop = currentTop;
      }
    );
  }
});