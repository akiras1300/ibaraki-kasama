class Feed < ApplicationRecord
    has_many :entries, dependent: :destroy
    belongs_to :url
end
