ActiveAdmin.register Img do
  permit_params :title, :content,:image,:tag_list,:inyo
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
    all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name);
   f.inputs "Details" do
     f.input :title
     f.label :tag_list, "タグ"
     f.text_field :tag_list
     f.input :content
     f.input :image
     f.input :inyo
     f.input :image_cache, as: :hidden
     panel 'Markup' do
        ul :id => "alltag" do
          all_tag_list.join(",")
        end
     end
   end
 f.actions
end
end
