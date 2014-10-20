require 'faker'

FactoryGirl.define do 
	factory :flower do 
		strain { Faker::Commerce.product_name }
		description { Faker::Lorem.paragraph }
		kind 'Hybrid'
		quantity_price { Faker::Commerce.price }

	end
end