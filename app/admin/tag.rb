ActiveAdmin.register Tag do
    permit_params :name,:read,:oya,:body,:tagtype_id,:image
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
     f.input :name
     f.input :read
     f.input :body
     f.input :image
     f.input :tagtype
     f.input :oya
     f.input :image_cache, as: :hidden
   end
 f.actions
end
end
