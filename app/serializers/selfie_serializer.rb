class SelfieSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :link, :anger, :contempt, :disgust, :fear, :happiness, :neutral, :sadness, :surprise
  belongs_to :user
end
