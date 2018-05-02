class AddSelfieToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :selfie, :string
  end
end
