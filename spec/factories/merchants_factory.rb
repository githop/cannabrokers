require 'faker'

FactoryGirl.define do 
	factory :merchant do 
		name { Faker::Company.name}
		description { Faker::Company.catch_phrase }
		phone "(513)-555-0123"
		email { Faker::Internet.email }

		factory :merchant_with_edibles do
			after(:create) {|merch| merch.edibles << FactoryGirl.build(:edible)}
		end
	end
end