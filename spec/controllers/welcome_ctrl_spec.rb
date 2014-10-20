require "rails_helper"

RSpec.describe WelcomeController do
	describe "GET index" do
		it "renders the index template" do
			get :index
			expect(response).to render_template("index")
		end

		it "assigns @premium_merchant" do
			prem = FactoryGirl.create(:merchant, premium: true)
			get :index
			expect(assigns(:premium_merchant)).to eq(prem)
		end
	end
end