#= require active_admin/base
#= require jquery
#= require jquery-ui
#= require tag-it.min
$(document).on 'ready page:load', ->
  if document.getElementById 'alltag'
    alltag = (document.getElementById 'alltag').innerHTML;
    tagary = alltag.split(',');
    $('#entry_tag_list').tagit
      singleField: true,
      availableTags: tagary
#= require just_datetime_pic""ker/nested_form_workaround
