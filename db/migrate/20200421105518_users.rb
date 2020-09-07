class Users < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.bigint :user_id
      t.string :name
      t.string :role
    end
  end
end
