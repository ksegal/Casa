class RemoveColumnFromHouses < ActiveRecord::Migration
  def change
    remove_column :houses, :house_id, :integer
  end
end
