class FixHouses < ActiveRecord::Migration
  def change
  	rename_column :houses, :type, :house_type
  end
end
