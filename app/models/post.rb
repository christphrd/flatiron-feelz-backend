class Post < ApplicationRecord
  validates :user_id, presence: true
  validates :feelings, presence: true

  belongs_to :user
end
