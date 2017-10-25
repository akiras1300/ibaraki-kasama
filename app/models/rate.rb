class Rate < ApplicationRecord
    belongs_to :tag
    belongs_to :url
end
