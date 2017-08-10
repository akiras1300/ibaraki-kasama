ActiveAdmin.register Event do
  permit_params :start,:end,:tag_id
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
form(:html => { :multipart => true }) do |f|
   f.inputs "Details" do
     f.input :tag
      f.label :start, "開始"
     f.text_field :start, :class => 'datepic'
     f.label :end, "終了"
     f.text_field :end, :class => 'datepic'
     end
 f.actions
end
end
