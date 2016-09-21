class RemoveBathColumnFromHouses < ActiveRecord::Migration
  def change
  	remove_column :houses, :bath, :string
  end
end
