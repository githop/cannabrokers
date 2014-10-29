class Edible < ActiveRecord::Base
	belongs_to :merchant

	validates :name, presence: true
	validates :description, presence: true
	validates :price, presence: true

end
