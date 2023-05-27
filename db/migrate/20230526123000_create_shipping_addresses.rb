class CreateShippingAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_addresses do |t|
      t.string :street_address
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.bigint :user_id, null: false

      t.timestamps
    end
  end
end
