class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :username
      t.string :password_digest
      t.boolean :is_admin
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :fb_link
      t.string :picture
      t.string :gender
      t.boolean :is_owner
      t.text :description

      t.timestamps null: false
    end
  end
end
