

FactoryGirl.define do
	factory :equip_lic do
		item { Faker::Commerce.product_name }
		description { Faker::Company.catch_phrase }
		price "$500"
		kind ['License', 'Equipment', 'Property'].sample
	end
end