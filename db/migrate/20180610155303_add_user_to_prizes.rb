class AddUserToPrizes < ActiveRecord::Migration[5.2]
  def change
    add_reference :prizes, :user, foreign_key: { to_table: :users }
  end
end
