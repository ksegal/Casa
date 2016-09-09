class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.integer :picture_id
      t.integer :house_id
      t.string :picture

      t.timestamps null: false
    end
  end
end
