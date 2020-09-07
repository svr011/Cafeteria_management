class Billitems < ActiveRecord::Migration[6.0]
  def change
    create_table :billitems do |t|
      t.string :item_name
      t.bigint :item_cost
      t.datetime :ordertime
      t.bigint :user_id
      t.bigint :quantity
    end
  end
end
