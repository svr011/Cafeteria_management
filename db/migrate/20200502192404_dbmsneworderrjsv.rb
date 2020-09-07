class Dbmsneworderrjsv < ActiveRecord::Migration[6.0]
  def change
    remove_column :orderitems, :menu_item_price
    remove_column :orderitems, :quantity
    add_column :orderitems, :menu_item_cost, :bigint
    add_column :orderitems, :quantity, :bigint
  end
end
