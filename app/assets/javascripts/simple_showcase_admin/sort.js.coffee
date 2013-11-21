jQuery ->

  # this is a small hack; when a tr is dragged with jQuery UI sortable
  # the cells lose their width
  if $('#sortable').length > 0
    cells = $('.table').find('tr')[0].cells.length
    desired_width = 940 / cells + 'px'
    $('.table td').css('width', desired_width)

    $('#sortable').sortable(
      axis: 'y'
      items: '.item'

      # highlight the row on drop to indicate an update
      stop: (e, ui) ->
        ui.item.children('td').effect('highlight', {}, 1000)
      update: (e, ui) ->
        item_id = ui.item.data('item-id')
        console.log(item_id)
        console.log($(this).data('update-url'))
        position = ui.item.index()
        $.ajax(
          type: 'POST'
          url: $(this).data('update-url')
          dataType: 'json'
          data: { id: item_id, row_order_position: position }
        )
    )

