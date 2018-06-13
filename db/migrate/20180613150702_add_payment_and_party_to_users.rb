class AddPaymentAndPartyToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :payment, :boolean
    add_column :users, :party, :string
  end
end
