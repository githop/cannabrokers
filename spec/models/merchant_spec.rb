require 'rails_helper'


RSpec.describe Merchant, type: :model do 

	describe "the merchant model " do
		context "basic validations " do 
			it "has a valid factory" do 
				merchant = FactoryGirl.build(:merchant)
				expect(merchant).to be_valid
			end

			it "should require a name" do 
				no_name = FactoryGirl.build(:merchant, name: nil)
				expect(no_name).to_not be_valid
			end

			it "should require a phone " do 
				no_phone = FactoryGirl.build(:merchant, phone: nil)
				expect(no_phone).to_not be_valid
			end

			it "should require an email" do 
				no_email = FactoryGirl.build(:merchant, email: nil)
				expect(no_email).to_not be_valid
			end

			it "should require a well formatted email" do 
				bad_email = FactoryGirl.build(:merchant, email: "derpy.com")
				expect(bad_email).to_not be_valid
			end
		end
		
		context "class methods " do

			describe "the :edible_companies method" do
				it "should return a list of only edible companies" do
					non_edible_comp = FactoryGirl.build(:merchant)
					edible_comps = Merchant.edible_companies

					expect(edible_comps.include?(non_edible_comp)).to eq(false)
				end
			end

			describe "the :concentrate_companies method" do 
				it "should return a list of only concentrate companies" do
					non_concentrate = FactoryGirl.build(:merchant)
					concentrate_comps = Merchant.concentrate_companies

					expect(concentrate_comps.include?(non_concentrate)).to eq(false)
				end
			end
		end 
	end

end