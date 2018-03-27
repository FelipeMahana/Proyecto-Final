class PlansController < ApplicationController
  #before_action :authenticate_user!, only: [:show]
  def index
  	@plans = Plan.all
  end

  def user_contracts
  	@users = User.all
  	#Ultimo contrato del usuario con id x
  	#@contarct = Contract.where(user_id: x).last
  end
end
