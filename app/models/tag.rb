class Tag < ApplicationRecord
  is_impressionable
  mount_uploader :image, ImageUploader
  has_one :place, dependent: :destroy
  belongs_to :tagtype,required: false
end
