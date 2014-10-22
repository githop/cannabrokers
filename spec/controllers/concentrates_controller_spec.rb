require 'rails_helper'

RSpec.describe ConcentratesController do

	before :each do
		@merch = FactoryGirl.create(:merchant)
		@concentrate = FactoryGirl.create(:concentrate)
	end

	def login_admin
		@request.env["devise.mapping"] = Devise.mappings[:admin]
		admin = FactoryGirl.create(:admin)
    sign_in :user, admin # sign_in(scope, resource)
	end

	describe "GET index" do
		it "renders the index page" do
			get :index, merchant_id: @merch

			expect(response).to render_template(:index)
		end

		it "assings a @merchant" do
			get :index, merchant_id: @merch

			expect(assigns(:merchant)).to eq(@merch)
		end
	end

	describe "GET show/:id" do
		it "should render the show template" do
			get :show, merchant_id: @merch, id: @concentrate

			expect(response).to render_template(:show)
		end
	end

	describe "GET new" do
		it "as admin, should render the new template" do
			login_admin
			get :new, merchant_id: @merch

			expect(response).to render_template(:new)
		end
	end

	describe "GET edit/:id" do
		it "as admin, assigns @concentrate to be edited" do
			login_admin
			get :edit, merchant_id: @merch, id: @concentrate

			expect(assigns(:concentrate)).to eq(@concentrate)
		end

		it "as admin, renders the edit template" do
			login_admin
			get :edit, merchant_id: @merch, id: @concentrate

			expect(response).to render_template(:edit)
		end
	end

	describe "POST create" do
		context "the happy path - valid" do
			it "as admin, creates a new edible" do
				login_admin

				expect{
					post :create, merchant_id: @merch, concentrate: FactoryGirl.attributes_for(:concentrate)
				}.to change(Concentrate, :count).by(1)
			end

			it "as admin, after create, redirects to @concentrate" do
				login_admin
				post :create, merchant_id: @merch, concentrate: FactoryGirl.attributes_for(:concentrate)

				expect(response).to redirect_to merchant_concentrate_path(@merch, Concentrate.last)
			end
		end

		context "the sad path - not valid" do
			it "as admin, renders the new template" do
				login_admin
				post :create, merchant_id: @merch, concentrate: FactoryGirl.attributes_for(:concentrate, strain: nil)

				expect(response).to render_template(:new)
			end
		end
	end

	describe "PUT update" do
		context "the happy path - valid" do
			it "as admin, assigns the @concentrate to be edited" do
				login_admin
				put :update, merchant_id: @merch, id: @concentrate, concentrate: FactoryGirl.attributes_for(:concentrate)

				expect(assigns(:concentrate)).to eq(@concentrate)
			end

			it "as admin, updates @concentrate's attributes" do
				login_admin
				put :update, merchant_id: @merch, id: @concentrate, concentrate: FactoryGirl.attributes_for(:concentrate, strain: "edited")

				@concentrate.reload
				expect(@concentrate.strain).to eq("edited")
			end

			it "as admin, redirects to @concentrate show" do
				login_admin
				put :update, merchant_id: @merch, id: @concentrate, concentrate: FactoryGirl.attributes_for(:concentrate)

				expect(response).to redirect_to merchant_concentrate_path(@merch, @concentrate)
			end
		end

		context "the sad path - not valid" do
			it "as admin, renders the edit template" do
				login_admin
				put :update, merchant_id: @merch, id: @concentrate, concentrate: FactoryGirl.attributes_for(:concentrate, strain: nil)

				expect(response).to render_template(:edit)
			end
		end
	end
end