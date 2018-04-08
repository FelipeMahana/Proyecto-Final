class ContractsController < ApplicationController
	before_action :authenticate_user!, only: [:new, :edit, :show]
	before_action :set_params, only: [:create, :update]
	before_action :set_plan, only: [:new, :edit, :update]
	before_action :set_contract, only: [:edit, :show, :update]
	
	def new
		@contract = Contract.new
	end

	def edit

	end

	def show
		
	end

	def update
		@contract.plan_id = params[:plan_id]
		if @contract.fat_percentage.present?
			if @contract.sex == 1
				lbm= (0.32810 * @contract.weight) + (0.33929 * @contract.height) - 29.5336
			else
				lbm= (0.29569 * @contract.weight) + (0.41813 * @contract.height) - 43.2933
			end
			basal_metabolic_rate = 370 + (21.6 * lbm)
		else
			if @contract.sex == 1
				basal_metabolic_rate = ((10 * @contract.weight)+(6.25 * @contract.height)-(5 * @contract.age)+5)
			else
				basal_metabolic_rate = ((10 * @contract.weight)+(6.25 * @contract.height)-(5 * @contract.age)-161)
			end
		end
		basal_metabolic_rate
	
		if @contract.activity_level == 1
			bmr_calculado = basal_metabolic_rate * 1.25
		elsif @contract.activity_level == 2
			bmr_calculado = basal_metabolic_rate * 1.375
		elsif @contract.activity_level == 3
			bmr_calculado = basal_metabolic_rate * 1.55
		elsif @contract.activity_level == 4
			bmr_calculado = basal_metabolic_rate * 1.725
		else 
			bmr_calculado = basal_metabolic_rate * 1.95
		end
		@contract.bmr = bmr_calculado 
	
		@contract.heart_rate = 220 - @contract.age
		
		@contract.pending = true					
		@contract.update(set_params)
		redirect_to plan_contract_path(@contract.plan_id, @contract)
	end

	def create
		@contract = Contract.new(set_params)
		@contract.plan_id = params[:plan_id]
		@contract.user_id = current_user.id
		@contract.save
		if @contract.save
             redirect_to edit_plan_contract_path(@contract.plan.id, @contract), notice: 'Se creo contrato con exito'
       else
             redirect_to new_plan_contract_path(@contract.plan_id), notice: 'No se pudo crear sitio '
       end 
	end

	private

	def set_params
		params.require(:contract).permit(:weight, :height, :age, :sex, :activity_level, :bmi, :disease, :allergies, :bmr, :karvonen, :heart_rate, :commit, :goal, :fat_percentage, :plan_id)
	end

	def set_contract
		@contract = Contract.find(params[:id])
	end

	def set_plan
		@plan = Plan.find(params[:plan_id])
	end
end

