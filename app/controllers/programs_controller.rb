class ProgramsController < ApplicationController
    before_action :authenticate_user!, only: [:index]
	before_action :set_user, only: [:index]
	before_action :set_contract, only: [:index]
	before_action :set_plan, only: [:index]
	

    def index
    	@program = Program.new
    end

    def create
    	@program = Program.create(program_params)
        #@program.plan_id = params[:plan_id]
        @program.contract_id = params[:contract_id]
        #@program.user_id = params[:user_id]
    	@program.save
        raise
    	if @program.save
             redirect_to user_contracts_path, notice: 'Se creo programa con exito'
        else
            redirect_to user_contracts_path, notice: 'No se pudo crear programa con exito'
             #redirect_to plan_contract_user_programs_path(@program.plan_id, @program.contract_id, @program.user_id), notice: 'No se pudo crear programa '
        end
    end

    private

    def program_params
    	 
		params.require(:program).permit(:training, :nutrition)
	end

    def set_user
		@user = User.find(params[:user_id])
	end

	def set_contract
		@contract = Contract.find(params[:contract_id])
	end

	def set_plan
		@plan = Plan.find(params[:plan_id])
	end
end
