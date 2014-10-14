class AdminController < ApplicationController
	before_action :authenticate_user!

	def panel
		authorize User
	end

end
