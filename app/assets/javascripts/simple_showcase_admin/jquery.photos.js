$(function() {
  $('form a.add_child').click(function() {
    var template = $('#photos_fields_template').html();
    var regexp = new RegExp('new_photos', 'g');
    var id = $('.destroy').last().attr('name');
    id = id.replace(/\D/g, "");
    var new_id = parseInt(id) + 1;

    $(this).parent().before(template.replace(regexp, new_id));
    return false;
  });

  $('form a.remove_child').on('click', function() {
    $(this).parents('.photo-fields').children('input[class=destroy]').attr('value', true);
    $(this).parents('.photo-fields').hide();
    return false;
  });
});
