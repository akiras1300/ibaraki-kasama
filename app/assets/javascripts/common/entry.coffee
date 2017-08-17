$(document).on 'ready page:load', ->
  if $('#sample').length
    $('#entry_tag_list').tagit
      singleField: true,
      availableTags: all_tag_list
