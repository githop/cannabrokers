class Merchant < ActiveRecord::Base
	has_many :inventories
	has_many :flowers, through: :inventories
	has_many :concentrates, through: :inventories
	has_many :edibles, through: :inventories

	def self.edible_companies
		merchants = Merchant.includes(:edibles).order('premium DESC').each_with_object([]) {|m, a| m.edibles.any? ? a << m : false }
	end

	def self.concentrate_companies
		merchants = Merchant.includes(:concentrates).order('premium DESC').each_with_object([]) {|m, a| m.concentrates.any? ? a << m : false }
	end
end
