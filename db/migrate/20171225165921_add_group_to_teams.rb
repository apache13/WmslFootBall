class AddGroupToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :group_id, :integer
    add_index :teams, :group_id
  end
end
