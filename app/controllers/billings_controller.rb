class BillingsController < ApplicationController
	def pre_pay
		# #price = current_user.contracts.last.plan.price
		# orders = current_user.contracts
		# items = orders.map do |order|
		# 	 item = {}
		# 	 if order.plan.contract_type == 1
		# 	 	item[:name] = "Plan Entrenamiento"
		# 	 elsif order.plan.contract_type == 2
		# 	 	item[:name] = "Plan Nutricion"
		# 	 else	
		# 	 	item[:name] = "Plan Entrenamiento y Nutricion"
		# 	 end
		# 	 item[:sku] = order.id.to_s
		# 	 item[:price] = order.plan.price.to_s
		# 	 item[:currency] = 'USD'
		# 	 item[:quantity] = 1
		# 	 item
		# end

		# @payment = PayPal::SDK::REST::Payment.new({
		#   :intent =>  "sale",
		#   :payer =>  {
		#     :payment_method =>  "paypal" },
		#   :redirect_urls => {
		#     :return_url => "http://localhost:3000/payment/execute",
		#     :cancel_url => "http://localhost:3000/" },
		#   :transactions =>  [{
		#     :item_list => {
		#       :items => items 
		#       },
		#     :amount =>  {
		#       :total =>  orders.try(:plan).try(:price).to_s,
		#       :currency =>  "USD" },
		#     :description =>  "This is the payment transaction description." }]})

		@payment = PayPal::SDK::REST::Payment.new({
		  :intent =>  "sale",
		  :payer =>  {
		    :payment_method =>  "paypal" },
		  :redirect_urls => {
		    :return_url => "http://localhost:3000/payment/execute",
		    :cancel_url => "http://localhost:3000/" },
		  :transactions =>  [{
		    :item_list => {
		      :items => [{
		        :sku => current_user.contracts.last.id.to_s,
		        :price => current_user.contracts.last.plan.price.to_s,
		        :currency => "USD",
		        :quantity => 1 }]},
		    :amount =>  {
		      :total =>  current_user.contracts.last.plan.price.to_s,
		      :currency =>  "USD" },
		    :description =>  "This is the payment transaction description." }]})

		render json: @payment.to_json

		# if @payment.create
		# 	render json: @payment.to_json
		# 	#redirect_url = payment.links.find{|v| v.method == "REDIRECT" }.href
		# 	#redirect_to redirect_url
		# else
		# 	render json: payment.error
		# end

	end
end
