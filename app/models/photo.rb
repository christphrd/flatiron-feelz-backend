class Photo < ApplicationRecord
  validates :user_id, presence: true
  validates :selfie, presence: true

  belongs_to :user
end
