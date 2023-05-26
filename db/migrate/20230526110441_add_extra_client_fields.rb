class AddExtraClientFields < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string, default: ""
    add_column :users, :last_name, :string, default: ""
    add_column :users, :phone_number, :string, default: ""
  end
end
