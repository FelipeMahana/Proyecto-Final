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
		@contract.update(set_params)
		#esto a paypal
		redirect_to pre_pay_billings_path
		#esto va a show
		#redirect_to plan_contract_path(@contract.plan_id, @contract)
	end

	def create
		@contract = Contract.new(set_params)
		@contract.plan_id = params[:plan_id]
		@contract.user_id = current_user.id
		# segun flujo debe ir el true en update, ya que este es el que se ocupa, para confirmar datos, o en el futuro debe ser en el de paypal?
		@contract.pending = true
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

