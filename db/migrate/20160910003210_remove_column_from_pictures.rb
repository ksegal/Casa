class RemoveColumnFromPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :picture_id, :integer
  end
end
