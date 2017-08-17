ActiveAdmin.register Entry do
  permit_params :title, :author,:image,:published,:content,:tag_list,:published

  form(:html => { :multipart => true }) do |f|
    all_tag_list = ActsAsTaggableOn::Tag.all.pluck(:name);
     f.inputs "Details" do
       f.input :title
       f.input :author
       f.input :image
       f.label :tag_list, "タグ"
       f.text_field :tag_list, value: entry.tag_list.join(",")
        f.input :content
       f.label :published, "編集日"
       f.text_field :published, class: 'datepic'
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
      row 'タイトル' do
        resource.title
      end
      row '著者' do
        resource.author
      end
      row '内容' do
        resource.content
      end
      row '画像' do
        resource.image
      end
      row '作成日' do
        resource.published
      end
      row 'タグ' do
        resource.tag_list
      end
     end
  end
 end
