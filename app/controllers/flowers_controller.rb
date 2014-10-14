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
end
