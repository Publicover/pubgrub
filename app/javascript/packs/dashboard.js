$(document).on('turbolinks:load', function() {
  $('.js-click').click(function() {
    $(this).toggleClass('strike');
    // $(this).html('&#10004;');
    // $(this).before('<span>&#10004;</span>');
  });
});
