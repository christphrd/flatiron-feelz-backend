class RenameLinkToSelfieInPhotosTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :link, :selfie
  end
end
