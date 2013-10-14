$('.photo-fields :checkbox').on('click', function() {
  $(this).closest('.photo-fields').siblings('.photo-fields').find(':checkbox').attr('checked', false);
});
