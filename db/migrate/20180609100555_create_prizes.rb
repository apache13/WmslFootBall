class CreatePrizes < ActiveRecord::Migration[5.2]
  def change
    create_table :prizes do |t|
      t.string :name
      t.string :code
      t.string :description
      t.string :sponsor
      t.decimal :price
      t.string :images
      t.integer :match_id
      
      t.timestamps
    end
  end
end
