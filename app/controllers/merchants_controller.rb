class MerchantsController < ApplicationController


	def edibles
		@merchants = Merchant.includes(:edibles).each_with_object([]) {|m, a| m.edibles.any? ? a << m : false }
	end

	def concentrates
		@merchants = Merchant.includes(:concentrates).each_with_object([]) {|m, a| m.concentrates.any? ? a << m : false }
	end
end
