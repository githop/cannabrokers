class Merchant < ActiveRecord::Base
	has_many :flowers
	has_many :concentrates
	has_many :edibles
	has_many :equipments

	validates :name, presence: true
	validates :phone, presence: true
	validates :email, presence: true
	validates :email, format: { with: /.+@.+\..+/i, message: "improper format" }

	def self.edible_companies
		self.includes(:edibles).order('premium DESC').each_with_object([]) {|m, a| m.edibles.any? ? a << m : false }
	end

	def self.concentrate_companies
		self.includes(:concentrates).order('premium DESC').each_with_object([]) {|m, a| m.concentrates.any? ? a << m : false }
	end
end
