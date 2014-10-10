class WelcomeController < ApplicationController

	def index
		@premium_merchant = Merchant.where(premium: true).sample
	end

end
