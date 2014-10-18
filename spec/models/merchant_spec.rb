require 'rails_helper'

describe Merchant do 
	let(:merchant) { Merchant.create!(name: "Boulder Botanics", description: "this is it") }

	describe "the merchant model " do 
		context "in terms of associations " do 
			it "should have many flowers." do 
				merch = Merchant.reflect_on_association(:edibles)
				expect merch.macro == :has_many
			end

			it "should have many concentrates." do 
				merch = Merchant.reflect_on_association(:concentrates)
				expect merch.macro == :has_many
			end

			it "should have many edibles " do
				merch = Merchant.reflect_on_association(:edibles) 
				expect merch.macro == :has_many
			end

			it "should have a join table called inventories" do 
				merch = Merchant.reflect_on_association(:inventories)
				expect merch.macro == :has_many
			end
		end

		context "class methods " do 
			describe "the :edible_companies method" do
				it "should return a list of only edible companies" do
					edible_comps = Merchant.edible_companies

					def check_comps(comps)
						count = comps.count
						check = comps.keep_if do |comp|
							comp.edibles.any?
						end
						check.count == count
					end

					expect check_comps(edible_comps) == true
				end
			end

			describe "the :concentrate_companies method" do 
				it "should return a list of only concentrate companies" do 
					concentrate_comps = Merchant.concentrate_companies

					def check_comps(comps)
						count = comps.count
						check = comps.keep_if do |comp|
							comp.concentrates.any?
						end
						check.count == count
					end

					expect check_comps(concentrate_comps) == true
				end
			end
		end 
	end

end