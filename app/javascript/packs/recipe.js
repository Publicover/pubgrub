$(document).on('turbolinks:load', function() {
  if ($('#recipe_recipeable_type').val() === 'Entree') {
    $('#js-entree').fadeIn(500);
    $('.js-entree-select').removeAttr('disabled');
    $('.js-side-select').attr('disabled', 'disabled');
  } else if ($('#recipe_recipeable_type').val() === 'Side') {
    $('#js-side').fadeIn(500);
    $('.js-side-select').removeAttr('disabled');
    $('.js-entree-select').attr('disabled', 'disabled');
  } else {
    $('#js-entree').hide();
    $('.js-entree-select').removeAttr('disabled');
    $('#js-side').hide();
    $('.js-side-select').removeAttr('disabled');
  };

  $('#recipe_recipeable_type').change(function() {
    switch($(this).val()) {
      case 'Entree':
        $('#js-entree').fadeIn(500);
        $('.js-entree-select').removeAttr('disabled');
        $('#js-side').fadeOut(100);
        $('.js-side-select').attr('disabled', 'disabled');
        break;
      case 'Side':
        $('#js-side').fadeIn(500);
        $('.js-side-select').removeAttr('disabled');
        $('#js-entree').fadeOut(100);
        $('.js-entree-select').attr('disabled', 'disabled');
        break;
      default:
        $('#js-side').hide();
        $('.js-side-select').removeAttr('disabled');
        $('#js-entree').hide();
        $('.js-entree-select').removeAttr('disabled');
    };
  });
});
