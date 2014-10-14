class AdminController < ApplicationController
	before_action :authenticate_user!

	def panel
		authorize User
		@concentrates = Merchant.includes(:concentrates).each_with_object([]) {|m,a| m.concentrates.any? ? a << m : false}
		@edibles = Merchant.includes(:edibles).each_with_object([]) {|m,a| m.edibles.any? ? a << m : false}
	end

end
