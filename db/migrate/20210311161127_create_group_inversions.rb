class CreateGroupInversions < ActiveRecord::Migration[6.1]
  def change
    create_table :group_inversions do |t|
      t.belongs_to :group
      t.belongs_to :inversion
      t.timestamps
    end
  end
end
