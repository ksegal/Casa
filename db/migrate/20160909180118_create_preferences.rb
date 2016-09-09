class CreatePreferences < ActiveRecord::Migration
  def change
    create_table :preferences do |t|
      t.integer :pref_id
      t.integer :user_id
      t.string :neighborhood_pref
      t.string :gender_pref
      t.float :price_limit_pref
      t.string :room_pref
      t.string :season_pref
      t.boolean :smoking_pref
      t.boolean :drinking_pref

      t.timestamps null: false
    end
  end
end
