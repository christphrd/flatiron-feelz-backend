class PostSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :feelings, :dog_spirit
  belongs_to :user
end
