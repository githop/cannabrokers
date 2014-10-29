class Flower < ActiveRecord::Base
	belongs_to :merchant

	validates :strain, presence: true
	validates :kind, presence: true
	validates :quantity_price, presence: true
end
