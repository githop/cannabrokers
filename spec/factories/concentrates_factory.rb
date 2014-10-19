require 'faker'

FactoryGirl.define do 
	factory :concentrate do 
		strain { Faker::Commerce.product_name }
		fees { Faker::Commerce.price }
		kind 'shatter'
		quantity_price { Faker::Commerce.price }

	end
end