class FlowersController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update]

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
		@flower = Flower.new(flower_params)
		if @flower.save
			get_merchant(@flower)
			redirect_to @flower
		end
	end

	def edit
		authorize Flower
		@flower = Flower.find(params[:id])
		@merchant = @flower.merchants
	end

	def update
		@flower = Flower.find(params[:id])
		if @flower.update(flower_params)
			get_merchant(@flower)
			redirect_to @flower
		else
			render 'edit'
		end
	end

	private

	def flower_params
		params.require(:flower).permit(:strain, :kind, :description, :quantity_price)
	end

	def merch_param
		params.require(:flower).permit(:merchants)
	end

	def get_merchant(flower)
		if !merch_param[:merchants].blank?
			merch = Merchant.find(merch_param[:merchants])
			flower.merchants << merch
		end
	end

end
