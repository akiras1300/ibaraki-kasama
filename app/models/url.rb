class Url < ApplicationRecord
  has_many :feeds, dependent: :destroy
  has_many :rates
  belongs_to :tag,required: false
  mount_uploader :image, ImageUploader
end
