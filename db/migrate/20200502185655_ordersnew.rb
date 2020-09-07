class Ordersnew < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.datetime :delivered_at
      t.boolean :confirmed
      t.bigint :quantity
      t.string :item_name
      t.bigint :item_cost
      t.datetime :order_time
      t.bigint :user_id
    end
  end
end
