class Tag < ApplicationRecord
  is_impressionable
  acts_as_taggable
  mount_uploader :image, ImageUploader
  has_one :place, dependent: :destroy
  belongs_to :tagtype,required: false
  #has_many :follows_from, class_name: Follow, foreign_key: :from_tag_id, dependent: :destroy
  #has_many :follows_to,   class_name: Follow, foreign_key: :to_tag_id,   dependent: :destroy
  #has_many :following, through: :follows_from, source: :to_tag
  #has_many :followed,  through: :follows_to,   source: :from_tag
end
