class CreateTransactionTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :transaction_types do |t|
      t.integer :kind, limit: 2, null: false
      t.string :description, limit: 30, null: false
      t.integer :operation, limit: 1, null: false

      t.timestamps
    end
  end
end
