class AddTrainingAndNutritionToProgram < ActiveRecord::Migration[5.1]
  def change
    add_column :programs, :training, :text
    add_column :programs, :nutrition, :text
  end
end
