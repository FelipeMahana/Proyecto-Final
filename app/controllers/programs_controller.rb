class ProgramsController < ApplicationController
    before_action :authenticate_user!, only: [:index, :new, :user_programs]
    before_action :set_program, only: [:edit, :show, :update]
    before_action :set_user, only: [:new, :edit, :show, :update]
    before_action :set_contract, only: [:new,:create, :edit, :show, :update]
    before_action :set_plan, only: [:new, :edit, :show, :update]
    before_action :program_params, only: [:create, :update]
    authorize_resource
    
    def user_programs
        @programs = Program.all
    end

    def new
        @program = Program.new
    end

    def edit
      
    end


    def show

    end

    def update  
        @program.contract_id = params[:contract_id]
        @program.update(program_params)    
        if @program.update(program_params)
            redirect_to user_programs_path, notice: 'El programa se a actualizado con exito'
        else
            redirect_to user_programs_path, notice: 'El programa no se a actualizado'
        end
    end

    def create
        @program = Program.new(program_params)
        @program.contract = @contract
        @contract.pending = false

        if @program.save and @contract.save
             redirect_to user_contracts_path, notice: 'Se creo programa con exito'
        else
            redirect_to user_contracts_path, notice: 'No se pudo crear programa'
        end
    end

    private


    def program_params	 
		params.require(:program).permit(:training, :nutrition, :plan_id, :contract_id, :user_id)
	end

    def set_program
        @program = Program.find(params[:id])
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