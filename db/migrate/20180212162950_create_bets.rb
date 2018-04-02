class CreateBets < ActiveRecord::Migration[5.1]
  def change
    create_table :bets do |t|
      t.belongs_to :match, foreign_key: true
      t.belongs_to :user, foreign_key: true      
      t.integer :bet
      t.integer :bet_left_score
      t.integer :bet_right_score
      t.boolean :yellow_card
      t.boolean :red_card
      t.boolean :extra_time
      t.boolean :penalty
      
      t.timestamps
    end
  end
end
