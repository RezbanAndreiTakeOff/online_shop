class CreateCreditCards < ActiveRecord::Migration[6.1]
  def change
    create_table :credit_cards do |t|
      t.string :number
      t.integer :month
      t.integer :year
      t.integer :cvv
      t.bigint :user_id

      t.timestamps
    end
  end
end
