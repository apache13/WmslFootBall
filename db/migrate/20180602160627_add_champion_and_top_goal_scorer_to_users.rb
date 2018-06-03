class AddChampionAndTopGoalScorerToUsers < ActiveRecord::Migration[5.2]
  def change    
    add_reference :users, :team, foreign_key: { to_table: :teams }
    add_column :users, :top_goal_scorer, :string
  end
end
