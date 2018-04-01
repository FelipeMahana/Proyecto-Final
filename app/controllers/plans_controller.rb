class PlansController < ApplicationController
  before_action :authenticate_user!, only: [:user_contracts, :profile]
  def index
  	@plans = Plan.all
  end

  def profile
  	
  end

  def user_contracts
  	@users = User.all
  end
end
