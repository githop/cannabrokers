require "rails_helper"

RSpec.describe EdiblesController do
	before :each do
		@merch = FactoryGirl.create(:merchant)
		@edible = FactoryGirl.create(:edible)
	end

	def login_admin
		@request.env["devise.mapping"] = Devise.mappings[:admin]
		admin = FactoryGirl.create(:admin)
    sign_in :user, admin # sign_in(scope, resource)
  end

	describe "GET index" do
		it "renders the index page" do
			get :index, merchant_id: @merch.id

			expect(response).to render_template(:index)
		end

		it "assings a @merchant" do
			get :index, merchant_id: @merch.id

			expect(assigns(:merchant)).to eq(@merch)
		end
	end

	describe "GET show/:id" do
		it "should render the show template" do
			get :show, id: @edible, merchant_id: @merch.id

			expect(response).to render_template(:show)
		end
	end

	describe "GET new" do
		it "as admin, should render the new template" do
			login_admin
			get :new, merchant_id: @merch.id

			expect(response).to render_template(:new)
		end
	end

	describe "GET edit/:id" do
		it "as admin, assigns @edible to be edited" do
			login_admin
			get :edit, id: @edible, merchant_id: @merch

			expect(assigns(:edible)).to eq(@edible)
		end

		it "as admin, renders the edit template" do
			login_admin
			get :edit, id: @edible, merchant_id: @merch

			expect(response).to render_template(:edit)
		end
	end

	describe "POST create" do
		context "the happy path - valid" do
			it "as admin, creates a new edible" do
				login_admin
				expect{
					post :create, merchant_id: @merch, edible: FactoryGirl.attributes_for(:edible)
				}.to change(Edible, :count).by(1)
			end

			it "as admin, after create, redirects to show" do
				login_admin
				post :create, merchant_id: @merch, edible: FactoryGirl.attributes_for(:edible)

				expect(response).to redirect_to merchant_edible_path(@merch.id, Edible.last)
			end
		end

		context "the sad path - not valid " do
			it "as admin, renders the new template" do
				login_admin
				post :create, merchant_id: @merch, edible: FactoryGirl.attributes_for(:edible, name: nil)

				expect(response).to render_template(:new)
			end
		end
	end

	describe "PUT update" do
		context "the happy path - valid" do
			it "as admin, assings the @edible to edit" do
				login_admin
				put :update, merchant_id: @merch, id: @edible, edible: FactoryGirl.attributes_for(:edible)

				expect(assigns(:edible)).to eq(@edible)
			end

			it "as admin, updates @edible's attributes" do
				login_admin
				put :update, merchant_id: @merch, id: @edible, edible: FactoryGirl.attributes_for(:edible, name: "changed")
				@edible.reload

				expect(@edible.name).to eq("changed")
			end

			it "as admin, after update redirects to show page" do
				login_admin
				put :update, merchant_id: @merch, id: @edible, edible: FactoryGirl.attributes_for(:edible)

				expect(response).to redirect_to merchant_edible_path(@merch, @edible)
			end

			context "the sad path - not valid" do
				it "as admin, renders the edit template upon failed validation" do
					login_admin
					put :update, merchant_id: @merch, id: @edible, edible: FactoryGirl.attributes_for(:edible, name: nil)

					expect(response).to render_template(:edit)
				end
			end
		end
	end
end