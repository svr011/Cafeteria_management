class Updateuserdetails < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :user_id
    remove_column :users, :name
    remove_column :users, :role
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :email, :string
    add_column :users, :role, :string
    add_column :users, :is_owner, :boolean
    add_column :users, :is_clerk, :boolean
    add_column :users, :password_digest, :string
  end
end
