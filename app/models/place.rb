class Place < ApplicationRecord
  paginates_per 10
  belongs_to :tag
end
