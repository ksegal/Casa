class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.integer :house_id
      t.integer :user_id
      t.string :neighborhood
      t.float :price
      t.string :street_1
      t.string :street_2
      t.string :city
      t.string :state
      t.string :zip
      t.boolean :active
      t.string :season
      t.string :gender
      t.boolean :smoking
      t.boolean :drinking
      t.boolean :pets_allowed
      t.boolean :furnished
      t.string :bath
      t.string :type
      t.string :laundry
      t.boolean :utilities_included
      t.text :description
      t.boolean :parking
      t.float :num_of_bedrooms
      t.float :num_of_bathrooms
      t.boolean :private_room
      t.boolean :private_bath

      t.timestamps null: false
    end
  end
end
