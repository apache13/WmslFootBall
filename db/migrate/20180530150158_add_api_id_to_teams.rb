class AddApiIdToTeams < ActiveRecord::Migration[5.2]
  def change
    add_column :teams, :api_id, :integer
  end
end
