class CreatePlans < ActiveRecord::Migration[5.1]
  def change
    create_table :plans do |t|
      t.float :price
      t.date :date_start
      t.integer :duration
      t.integer :contract_type
      t.text :description
      t.integer :discount

      t.timestamps
    end
  end
end
