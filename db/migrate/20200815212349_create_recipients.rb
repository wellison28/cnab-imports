class CreateRecipients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipients do |t|
      t.string :cpf, null: false, limit: 11

      t.timestamps
    end

    add_index :recipients, :cpf, unique: true
  end
end
