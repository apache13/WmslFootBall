class CreateSponsors < ActiveRecord::Migration[5.2]
  def change
    create_table :sponsors do |t|
      t.string :code
      t.string :name
      t.string :url
      t.boolean :enable
      t.date :start
      t.date :end
      t.string :images
      
      t.timestamps
    end
  end
end
