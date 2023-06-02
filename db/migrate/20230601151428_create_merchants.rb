class CreateMerchants < ActiveRecord::Migration[7.0]
  def change
    create_table :merchants do |t|
      t.string :name
      t.string :email
      t.text :description
      t.string :status
      t.decimal :total_transaction_sum

      t.timestamps
    end
  end
end
