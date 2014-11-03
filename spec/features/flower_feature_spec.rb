require 'rails_helper'


feature 'the flower resource' do
	before :each do
		@admin = FactoryGirl.create(:admin)
		visit('/admin')
			fill_in 'user[email]', with: @admin.email
			fill_in 'user[password]', with: @admin.password
			click_button("Log in")
	end

	context 'As admin' do
			it "can add a new flower from the panel" do
			visit('/admin')
			click_link("Add a new Flower")
			within('#new_flower') do
				fill_in("Strain", with: "Capybara")
				select('Indica', from: "flower_kind")
				fill_in("Quantity / Price", with: "$50" )
				click_button("Create Flower")
			end
			expect(page).to have_content("Capybara")
		end
	end
end