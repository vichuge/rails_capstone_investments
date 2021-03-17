class CreateInversions < ActiveRecord::Migration[6.1]
  def change
    create_table :inversions do |t|
      t.string :name
      t.decimal :amount, precision: 100, scale: 2
      t.references :author, null: false, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
