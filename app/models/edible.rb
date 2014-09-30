class Edible < ActiveRecord::Base
	has_many :inventories
	has_many :merchants, through: :inventories
end
