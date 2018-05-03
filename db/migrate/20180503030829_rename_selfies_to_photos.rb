class RenameSelfiesToPhotos < ActiveRecord::Migration[5.2]
  def change
    rename_table :selfies, :photos
  end
end
