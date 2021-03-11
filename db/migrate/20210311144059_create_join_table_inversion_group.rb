class CreateJoinTableInversionGroup < ActiveRecord::Migration[6.1]
  def change
    create_join_table :inversions, :groups do |t|
      # t.index [:inversion_id, :group_id]
      # t.index [:group_id, :inversion_id]
    end
  end
end
