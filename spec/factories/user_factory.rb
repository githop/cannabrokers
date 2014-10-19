require 'faker'

FactoryGirl.define do 
	factory :user do 
		email { Faker::Internet.email }
		password "Password01"
		
		factory :admin do 
			role :admin
		end
	end
end