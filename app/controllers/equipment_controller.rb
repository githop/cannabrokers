class EquipmentController < ApplicationController
	def index
		@equipments = Equipment.all
	end
end
