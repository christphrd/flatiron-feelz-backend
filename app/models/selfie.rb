class Selfie < ApplicationRecord
  validates :user_id, presence: true
  validates :link, presence: true

  belongs_to :user
end
