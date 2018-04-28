class AddDogSpiritToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :dog_spirit, :string
  end
end
