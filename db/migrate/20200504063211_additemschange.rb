class Additemschange < ActiveRecord::Migration[6.0]
  def change
    add_column :additems, :menu_id, :bigint
    add_column :additems, :is_breakfast, :boolean
    add_column :additems, :is_lunch, :boolean
    add_column :additems, :is_dinner, :boolean
  end
end
