class RemoveColumnFromPreferences < ActiveRecord::Migration
  def change
    remove_column :preferences, :pref_id, :integer
  end
end
