require "rails_helper"

RSpec.describe AdminController do


	describe "handling unauthorized users" do 

	def login_admin
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    admin = FactoryGirl.create(:admin)
    sign_in :user, admin # sign_in(scope, resource)
  end

	def login_user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    user = FactoryGirl.create(:user)
    sign_in user
  end

		it "rejects unauthorized users to welcome index" do
			login_user
			get :panel 

			expect(response).to redirect_to(root_path)
		end

		it "allows admin to panel" do 
			login_admin
			get :panel
			
			expect(response).to render_template("panel")
		end
	end
end