class AddPendingToContract < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :pending, :boolean, default: false
  end
end
