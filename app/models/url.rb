class Url < ApplicationRecord
  has_many :feeds, dependent: :destroy
end
