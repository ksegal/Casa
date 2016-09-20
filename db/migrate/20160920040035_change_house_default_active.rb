class ChangeHouseDefaultActive < ActiveRecord::Migration
  def change
  	change_column_default :houses, :active, true
  end
end
