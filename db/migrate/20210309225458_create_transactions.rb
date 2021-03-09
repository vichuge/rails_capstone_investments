class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :name
      t.float :amount
      t.references :author, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
