require 'rails_helper'

RSpec.describe Equipment do
	describe "The Equipment Model" do
		context "basic validations" do
			it "has a valid factory" do
				equipment = FactoryGirl.build(:equipment)

				expect(equipment).to be_valid
			end

			it "requies an item name" do
				invalid = FactoryGirl.build(:equipment, item: nil)

				expect(invalid).to_not be_valid
			end

			it "requires a price" do
				free = FactoryGirl.build(:equipment, price: nil)

				expect(free).to_not be_valid
			end

			it "requires a kind" do
				kindless = FactoryGirl.build(:equipment, kind: nil)

				expect(kindless).to_not be_valid
			end
		end
	end
end