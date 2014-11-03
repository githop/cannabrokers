require 'rails_helper'

feature "The admin authorization process" do

	before :each do
		@admin = FactoryGirl.create(:admin, email: "test@admin.com")
	end

	context "a sessionless user visits the /admin route" do
		it "redirects them to the sign_in route" do
			visit('/admin')

			auth_error = "You need to sign in or sign up before continuing"
			expect(page).to have_content(auth_error)
		end
	end

	context "An admin can log in" do
		it "Signs them in" do
			visit('/admin')
			fill_in 'user[email]', with:  @admin.email
			fill_in 'user[password]', with: @admin.password
			click_button("Log in")
			expect(page).to have_content "Admin Panel"
		end
	end
end