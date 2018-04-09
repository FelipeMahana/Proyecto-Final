class Contract < ApplicationRecord
  has_many :programs, dependent: :destroy
  belongs_to :user 
  belongs_to :plan
  belongs_to :billing, optional: true

  	# Intentos fallidos
	# def self.calculo_basal_metabolic_rate(fat_percentage,sex,weight,height,age)
	# 	if fat_percentage.present?
	# 		if sex == 1
	# 			lbm= (0.32810 * weight) + (0.33929 * height) - 29.5336
	# 		else
	# 			lbm= (0.29569 * weight) + (0.41813 * height) - 43.2933
	# 		end
	# 		basal_metabolic_rate = 370 + (21.6 * lbm)
	# 	else
	# 		if sex == 1
	# 			basal_metabolic_rate = ((10 * weight)+(6.25 * height)-(5 * age)+5)
	# 		else
	# 			basal_metabolic_rate = ((10 * weight)+(6.25 * height)-(5 * age)-161)
	# 		end
	# 	end
	# 	basal_metabolic_rate
	# end

	# def self.calculo_metabolic_expenditure(activity_level)
	# 	if activity_level == 1
	# 		bmr = calculo_basal_metabolic_rate * 1.25
	# 	elsif activity_level == 2
	# 		bmr = calculo_basal_metabolic_rate * 1.375
	# 	elsif activity_level == 3
	# 		bmr = calculo_basal_metabolic_rate * 1.55
	# 	elsif activity_level == 4
	# 		bmr = calculo_basal_metabolic_rate * 1.725
	# 	else 
	# 		bmr = calculo_basal_metabolic_rate * 1.95
	# 	end
	# 	#@contract.bmr 
	# end

	# def self.calculo_ritmo_cardiaco_aprox(age)
	# 	self.heart_rate = 220 - self.age
	# end

end
