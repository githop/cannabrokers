class EdiblesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]
	
	def index
		@merchant = Merchant.find(params[:merchant_id])
	end

	def show
		@edible = Edible.find(params[:id])
	end

	def new
		authorize Edible
		@merchant = Merchant.find(params[:merchant_id])
		@edible = Edible.new
	end

	def create
		authorize Edible
		@edible = Edible.new(edible_params)
		if @edible.save
			merchant = Merchant.find(params[:merchant_id]).edibles << @edible
			redirect_to merchant_edible_path(merchant, @edible)
		end
	end

	def edit
		authorize Edible
		@edible = Edible.find(params[:id])
		@merchant = Merchant.find(params[:merchant_id])
	end

	def update
		authorize Edible
		@edible = Edible.find(params[:id])
		if @edible.update(edible_params)
			redirect_to merchant_edible_path(Merchant.find(params[:merchant_id]), @edible)
		else
			render 'edit'
		end
	end

	private

	def edible_params
		params.require(:edible).permit(:name, :description, :price)
	end

end
