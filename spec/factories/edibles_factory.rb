require 'faker'

FactoryGirl.define do 
	factory :edible do 
		name { Faker::Commerce.product_name }
		description { Faker::Company.catch_phrase}
		price "$50"

	end
end