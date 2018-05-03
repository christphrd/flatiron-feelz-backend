class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :selfie, :anger, :contempt, :disgust, :fear, :happiness, :neutral, :sadness, :surprise
  belongs_to :user
end
