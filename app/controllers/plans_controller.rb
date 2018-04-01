class PlansController < ApplicationController
  before_action :authenticate_user!, only: [:user_contracts]
  def index
  	@plans = Plan.all
  end

  def profile
  	@user = current_user
  end

  def user_contracts
  	@users = User.all
  end
end
