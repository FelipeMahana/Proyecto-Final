class AddAgeAndSexToContract < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :age, :integer
    add_column :contracts, :sex, :integer
  end
end
