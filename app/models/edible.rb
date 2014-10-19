class Edible < ActiveRecord::Base
	has_many :inventories
	has_many :merchants, through: :inventories

	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true
end
