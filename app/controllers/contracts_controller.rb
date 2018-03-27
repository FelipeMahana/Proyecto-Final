class ContractsController < ApplicationController
	before_action :authenticate_user!, only: [:new]
	before_action :set_params, only: [:create, :update]
	before_action :set_plan, only: [:new, :edit, :update]
	before_action :set_contract, only: [:edit, :show, :update]
	
	def new
		@contract = Contract.new
	end

	def edit

	end

	def show
		#prueba de mostrar los usuarios con sus contratos respectivos
		#@user = User.all
		#me di cuenta que no funciona, en contract controller necesita id del plan y contrato, tiene que ser en algun index, posiblemente el de index
	end

	def update
		@contract.plan_id = params[:plan_id]
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
		params.require(:contract).permit(:weight, :height,  :activity_level, :bmi, :disease, :allergies, :bmr, :karvonen, :heart_rate, :commit, :goal, :fat_percentage, :plan_id)
	end

	def set_contract
		@contract = Contract.find(params[:id])
	end

	def set_plan
		@plan = Plan.find(params[:plan_id])
	end
end

