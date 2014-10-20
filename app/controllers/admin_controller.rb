class AdminController < ApplicationController
	before_action :authenticate_user!

	def panel
		authorize User
		@concentrates = Merchant.concentrate_companies
		@edibles = Merchant.edible_companies
	end

end
