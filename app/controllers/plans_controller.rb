class PlansController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def index
  	@plans = Plan.all
  end

  def show
  	@plans = Plan.all
	@plan = Plan.find(params[:id])
  end
end
