
$(function () { 

  // #loading
  window.onload = function() {
    const spinner = document.getElementById('loading');
    spinner.classList.add('loaded');
  }

  $('.masthead-heading').fadeIn(3000);
  $('.masthead-subheading').fadeIn(5000);

  $('#like').hover(
    
    function () {
    $('.heart').show();
    },
    function () {
      $('.heart').fadeOut();
    }
  );

});