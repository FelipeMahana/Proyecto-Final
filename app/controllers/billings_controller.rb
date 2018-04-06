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
		    :return_url => "http://localhost:3000/billings/execute",
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

		#render json: @payment.to_json

		if @payment.create
			#render json: @payment.to_json
			redirect_url = @payment.links.find{|v| v.method == "REDIRECT" }.href
			redirect_to redirect_url
		else
			#':c'
			render json: payment.error
		end

	end

	def execute
		paypal_payment = PayPal::SDK::REST::Payment.find(params[:paymentId])

		if paypal_payment.execute(payer_id: params[:PayerID])
			amount = paypal_payment.transactions.first.amount.total

			billing = Billing.create(
				user: current_user,
				code: paypal_payment.id,
				payment_method: 'paypal',
				amount: amount,
				currency: 'USD'
				)

			#orders = current_user.orders.where(payed: false)
			#orders.update_all(payed: true, billing_id: billing.id)

			redirect_to root_path, notice: "El pago se realizó con éxito!" 
		  # Success Message
		  # Note that you'll need to `Payment.find` the payment again to access user info like shipping address
		else
		  render plain: "No se puedo generar el cobro en PayPal."
		  paypal_payment.error # Error Hash
		end
	end
end
