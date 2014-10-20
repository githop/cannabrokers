require 'rails_helper'

RSpec.describe Edible, type: :model do 
	describe "the edible model" do
		context "basic validations" do 
			it "has a valid factory" do 
				edible = FactoryGirl.build(:edible)

				expect(edible).to be_valid
			end

			it "should require a name" do 
				no_name = FactoryGirl.build(:edible, name: nil)

				expect(no_name).to_not be_valid
			end

			it "should require a description" do 
				no_descript = FactoryGirl.build(:edible, description: nil)

				expect(no_descript).to_not be_valid
			end

			it "should require a price" do 
				free = FactoryGirl.build(:edible, price: nil)

				expect(free).to_not be_valid
			end
		end

		
	end
end