$(document).on 'ready page:load', ->
  $('#entry_tag_list').tagit
    singleField: true,
    availableTags: all_tag_list
