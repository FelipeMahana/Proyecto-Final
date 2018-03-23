class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
      t.float :weight
      t.float :height
      t.integer :activity_level
      t.text :goal
      t.float :fat_percentage
      t.float :bmi
      t.string :disease
      t.string :allergies
      t.float :bmr
      t.string :karvonen
      t.integer :heart_rate
      t.references :user, foreign_key: true
      t.references :plan, foreign_key: true

      t.timestamps
    end
  end
end
