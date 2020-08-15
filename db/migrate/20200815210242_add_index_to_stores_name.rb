class AddIndexToStoresName < ActiveRecord::Migration[6.0]
  def change
    add_index :stores, :name, unique: true
  end
end
