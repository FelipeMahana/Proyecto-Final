class Contract < ApplicationRecord
  has_many :programs
  belongs_to :user
  belongs_to :plan, dependent: :destroy

	def self.calculo_basal_metabolic_rate
		if @contract.fat_percentage.present?
			#lbm = lean body mass#
			if @contract.sex == 1
				lbm= (0.32810 * @contract.weight) + (0.33929 * @contract.height) - 29.5336
			else
				lbm= (0.29569 * @contract.weight) + (0.41813 * @contract.height) - 43.2933
			end
			@contract.bmr= 370 + (21.6 * lbm)
		else
			if @contract.sex == 1
				@contract.bmr= ((10 * @contract.weight)+(6.25 * @contract.height)-(5 * @contract.age)+5)
			else
				@contract.bmr= ((10 * @contract.weight)+(6.25 * @contract.height)-(5 * @contract.age)-161)
			end
		end
		@contract.bmr
	end

	def self.calculo_metabolic_expenditure
		if @contract.activity_level == 1
			@contract.bmr = calculo_basal_metabolic_rate * 1.25
		elsif @contract.activity_level == 2
			@contract.bmr = calculo_basal_metabolic_rate * 1.375
		elsif @contract.activity_level == 3
			@contract.bmr = calculo_basal_metabolic_rate * 1.55
		elsif @contract.activity_level == 4
			@contract.bmr = calculo_basal_metabolic_rate * 1.725
		else 
			@contract.bmr = calculo_basal_metabolic_rate * 1.95
		end
		@contract.bmr 
	end

	def self.calculo_ritmo_cardiaco_aprox
		@contract.heart_rate = 220 - @contract.age
	end

end
