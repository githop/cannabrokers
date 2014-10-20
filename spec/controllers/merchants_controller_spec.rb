require "rails_helper"

RSpec.describe MerchantsController, type: :controller do
	merch = FactoryGirl.create(:merchant)

	def login_admin
    @request.env["devise.mapping"] = Devise.mappings[:admin]
    admin = FactoryGirl.create(:admin)
    sign_in :user, admin # sign_in(scope, resource)
  end

	describe "GET show/:id" do
		it "renders the show template" do
			get :show, id: merch.id

			expect(response).to render_template(:show)
		end
	end

	describe "GET edibles" do
		it "renders the edible companies template" do
			get :edibles

			expect(response).to render_template(:edibles)
		end
	end

	describe "GET concentrates" do
		it "renders the concentrate companies template " do
			get :concentrates

			expect(response).to render_template(:concentrates)
		end
	end

	describe 'GET new' do
		it " as admin, renders the new template " do
			login_admin
			get :new

			expect(response).to render_template(:new)
		end
	end

	describe 'POST create' do
		it "as admin, creates a new merchant" do
			login_admin
			merch = FactoryGirl.attributes_for(:merchant)
			expect{
				post :create, merchant: merch
			}.to change(Merchant, :count).by(1)
		end

		it "as admin, after create, redirects to show page" do
			login_admin
			post :create, merchant: FactoryGirl.attributes_for(:merchant)

			expect(response).to redirect_to(Merchant.last)
		end
	end
end