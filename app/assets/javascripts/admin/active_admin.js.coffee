#= require active_admin/base
#= require jquery
#= require jquery-ui
#= require tag-it.min
#= require jquery.datetimepicker.full
$(document).on 'ready page:load', ->
  $.datetimepicker.setLocale('ja');
  $('.datepic').datetimepicker
    format: 'Y-m-d'
  if document.getElementById 'alltag'
    alltag = (document.getElementById 'alltag').innerHTML;
    tagary = alltag.split(',');
    $('#entry_tag_list').tagit
      singleField: true,
      availableTags: tagary
    $('#img_tag_list').tagit
      singleField: true,
      availableTags: tagary
    $('#tag_tag_list').tagit
      singleField: true,
      availableTags: tagary
#= require just_datetime_picker/nested_form_workaround
