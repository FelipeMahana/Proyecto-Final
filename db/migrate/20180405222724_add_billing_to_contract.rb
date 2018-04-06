class AddBillingToContract < ActiveRecord::Migration[5.1]
  def change
    add_reference :contracts, :billing, foreign_key: true
  end
end
