class Entry < ApplicationRecord
  acts_as_taggable            # acts_as_taggable_on :tags のエイリアス
  belongs_to :feed
  mount_uploader :image, ImageUploader
  just_define_datetime_picker :published
end
