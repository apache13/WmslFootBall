class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :code
      t.belongs_to :group, index: true
      t.boolean :club
      
      t.timestamps
    end
  end
end
