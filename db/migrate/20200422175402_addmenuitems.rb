class Addmenuitems < ActiveRecord::Migration[6.0]
  def change
    create_table :menuitems do |t|
      t.string :item_name
      t.string :item_description
      t.bigint :item_cost
      t.bigint :user_id
      t.boolean :selected
    end
  end
end
