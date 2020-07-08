$(function() {
  $('.yureru-s').hover(function(){
   $('#Modal').fadeIn();
   $('html').addClass('modalset');
  });
  $('.modal .modal-bg,.modal .modal-close').click(function(){
   $('#Modal').fadeOut();
   $('html').removeClass('modalset');
  });
 });	