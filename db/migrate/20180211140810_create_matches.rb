class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.string :title
      t.string :description
      t.datetime :start
      t.boolean :knockout
      t.belongs_to :left, :team, index: true
      t.belongs_to :right, :team, index: false
      t.integer :result
      t.integer :left_score
      t.integer :right_score
      
      t.timestamps
    end
  end
end
