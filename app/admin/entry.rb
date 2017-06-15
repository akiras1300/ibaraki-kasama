ActiveAdmin.register Entry do
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
  permit_params :title, :author,:image,:published
form(:html => { :multipart => true }) do |f|
   f.inputs "Details" do
     f.input :title
      f.input :author
     f.input :image
     f.input :tag
     f.input :published, as: :just_datetime_picker
     f.input :image_cache, as: :hidden
   end
   f.actions
 end
end
