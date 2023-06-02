class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.decimal :amount
      t.integer :status
      t.string :customer_email
      t.string :customer_phone
      t.references :merchant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
