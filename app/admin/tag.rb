ActiveAdmin.register Tag do
    permit_params :name,:read,:oya,:body,:tagtype_id,:image,:inyo,:tag_list
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
     f.input :name
     f.input :read
     f.label :tag_list, "タグ"
     f.text_field :tag_list, value: tag.tag_list.join(",")
     f.input :body
     f.input :image
     f.input :inyo
     f.input :tagtype
     f.input :oya
     f.input :image_cache, as: :hidden
     panel 'Markup' do
        ul :id => "alltag" do
          all_tag_list.join(",")
        end
     end
   end
   f.actions
  end

  show do
    attributes_table do
      row 'タグ名' do
        resource.name
      end
      row '読み' do
        resource.read
      end
      row '内容' do
        resource.body
      end
      row '画像' do
        resource.image
      end
      row '引用元' do
        resource.inyo
      end
      row 'タイプ' do
        resource.tagtype
      end
      row 'タグ' do
        resource.tag_list
      end
     end
  end
end
