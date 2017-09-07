class Entry < ApplicationRecord
  is_impressionable
  #acts_as_taggable_on :tags # entry.label_list が追加される
  acts_as_taggable
  mount_uploader :image, ImageUploader
  #just_define_datetime_picker :published
  belongs_to :feed
end
