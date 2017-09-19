class Follow < ApplicationRecord
  belongs_to :from_tag, class_name: User, foreign_key: :from_tag_id
  belongs_to :to_tag, class_name: User,   foreign_key: :to_tag_id
end
