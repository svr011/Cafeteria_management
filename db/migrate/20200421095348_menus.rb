class Menus < ActiveRecord::Migration[6.0]
  def change
    create_table :menus do |t|
      t.bigint :user_id
      t.string :name
      t.timestamps
    end
  end
end
