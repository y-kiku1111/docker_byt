
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

  // FAQのアコーディオン
  $('.faq-list-item').click(function() {
    var $answer = $(this).find('.answer');
    if($answer.hasClass('open')) { 
      $answer.removeClass('open');

      $answer.slideUp();

      $(this).find('span').text('+');
      
    } else {
      $answer.addClass('open'); 

      $answer.slideDown();
      
      $(this).find('span').text('-');
      
    }
  });

});