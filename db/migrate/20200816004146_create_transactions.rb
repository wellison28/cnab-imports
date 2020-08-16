class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.date :date
      t.decimal :amount
      t.string :card
      t.time :hour
      t.references :recipient, null: false, foreign_key: true
      t.references :store, null: false, foreign_key: true
      t.references :transaction_type, null: false, foreign_key: true

      t.timestamps default: -> { 'CURRENT_TIMESTAMP' }
    end
  end
end
