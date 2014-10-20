
require 'rails_helper'

RSpec.describe Flower, type: :model do 
	describe "the flower model" do
		context "basic validations" do
			it "has a vaild factory " do 
				flower = FactoryGirl.build(:flower)

				expect(flower).to be_valid
			end

			it "should require a strain" do 
				no_strain = FactoryGirl.build(:flower, strain: nil)

				expect(no_strain).to_not be_valid
			end

			it "should require a quantity/price" do 
				free = FactoryGirl.build(:flower, quantity_price: nil)

				expect(free).to_not be_valid
			end

			it "should require a kind" do 
				no_kind = FactoryGirl.build(:flower, kind: nil)

				expect(no_kind).to_not be_valid
			end
		end
	end
end