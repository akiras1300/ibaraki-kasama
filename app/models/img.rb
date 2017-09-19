class Img < ApplicationRecord
  is_impressionable
  acts_as_taggable
  mount_uploader :image, ImageUploader
end
