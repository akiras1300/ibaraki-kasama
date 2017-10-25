class Place < ApplicationRecord
  paginates_per 10
  belongs_to :tag
  acts_as_mappable
end
