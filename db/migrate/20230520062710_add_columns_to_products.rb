class AddColumnsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :width, :integer
    add_column :products, :height, :integer
    add_column :products, :artist, :string
  end
end
