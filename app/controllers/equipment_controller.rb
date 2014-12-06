class EquipmentController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :all]

	def index
		@equipments = Equipment.where(display: true)
	end

	def all
		@equipments = Equipment.all
		render :index
	end

	def show
		@equipment = Equipment.find(params[:id])
	end

	def new
		authorize User
		@equipment = Equipment.new
	end

	def edit
		authorize User
		@equipment = Equipment.find(params[:id])
	end

	def create
		authorize User
		@equipment = Equipment.new(equipment_params)
		if @equipment.save
			get_merchant(@equipment)
			redirect_to @equipment
		else
			render 'new'
		end
	end

	def update
		authorize User
		@equipment = Equipment.find(params[:id])
		if @equipment.update(equipment_params)
			get_merchant(@equipment)
			redirect_to @equipment
		else
			render 'edit'
		end
	end

	private
	def equipment_params
		params.require(:equipment).permit(:item, :description, :price, :kind, :display)
	end

	def merch_param
		params.require(:equipment).permit(:merchant)
	end

	def get_merchant(equipment)
		if !merch_param[:merchant].blank?
			merch = Merchant.find(merch_param[:merchant])
			equipment.merchant = merch
			equipment.save
		end
	end
end
