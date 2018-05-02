class CreateSelfies < ActiveRecord::Migration[5.2]
  def change
    create_table :selfies do |t|
      t.integer :user_id
      t.string :link
      t.decimal :anger
      t.decimal :contempt
      t.decimal :disgust
      t.decimal :fear
      t.decimal :happiness
      t.decimal :neutral
      t.decimal :sadness
      t.decimal :surprise
    end
  end
end
