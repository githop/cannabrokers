require 'rails_helper'

RSpec.describe Concentrate, type: :model do 
	describe "the concentrate model" do
		context "basic validations" do
			it "has a vaild factory " do 
				cnte = FactoryGirl.build(:concentrate)

				expect(cnte).to be_valid
			end

			it "should require a strain" do 
				no_strain = FactoryGirl.build(:concentrate, strain: nil)

				expect(no_strain).to_not be_valid
			end

			it "should require a quantity/price" do 
				free = FactoryGirl.build(:concentrate, quantity_price: nil)

				expect(free).to_not be_valid
			end

			it "should require a kind" do 
				no_kind = FactoryGirl.build(:concentrate, kind: nil)

				expect(no_kind).to_not be_valid
			end
		end
	end
end