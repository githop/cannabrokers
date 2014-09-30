class Merchant < ActiveRecord::Base
	has_many :inventories
	has_many :flowers, through: :inventories
	has_many :concentrates, through: :inventories
	has_many :edibles, through: :inventories
end
