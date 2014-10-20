class Flower < ActiveRecord::Base
	has_many :inventories
	has_many :merchants, through: :inventories

	validates :strain, presence: true
	validates :kind, presence: true
	validates :quantity_price, presence: true
end
