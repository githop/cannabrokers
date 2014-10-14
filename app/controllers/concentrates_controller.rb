class ConcentratesController < ApplicationController
	before_action :authenticate_user!, only: [:new, :create]

	def index
		@merchant = Merchant.find(params[:merchant_id])
	end

	def show
		@concentrate = Concentrate.find(params[:id])
	end

	def new
		@concentrate = Concentrate.new
		authorize Concentrate
	end
end
