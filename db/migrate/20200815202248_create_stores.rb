class CreateStores < ActiveRecord::Migration[6.0]
  def change
    create_table :stores do |t|
      t.string :name, null: false, limit: 50
      t.string :owner_name, null: false, limit: 50

      t.timestamps
    end
  end
end
