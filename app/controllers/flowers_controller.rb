class FlowersController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def index
		@flowers = Flower.all
	end

	def show
		@flower = Flower.find(params[:id])
	end

	def new
		authorize Flower
		@flower = Flower.new
	end

	def create
		authorize Flower
		@flower = Flower.new
		@flower.strain = flower_params[:strain]
		@flower.kind   = flower_params[:kind]
		@flower.description = flower_params[:description]
		@flower.quantity_price = flower_params[:quantity_price]
		@flower.merchants << Merchant.find_by_name(flower_params[:merchants])
		if @flower.save
			redirect_to @flower
		end
	end

	private

	def flower_params
		params.require(:flower).permit(:strain, :kind, :description, :quantity_price, :merchants)
	end
end
