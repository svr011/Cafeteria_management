class Additemsbyowner < ActiveRecord::Migration[6.0]
  def change
    create_table :additems do |t|
      t.string :item_name
      t.string :item_description
      t.bigint :item_cost
      t.bigint :user_id
    end
  end
end
