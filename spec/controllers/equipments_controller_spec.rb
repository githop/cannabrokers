require 'rails_helper'

RSpec.describe EquipmentController do

	def login_admin
		@request.env["devise.mapping"] = Devise.mappings[:admin]
		admin = FactoryGirl.create(:admin)
    sign_in :user, admin # sign_in(scope, resource)
  end

	describe "GET index" do
		it "renders the index template" do
			get :index

			expect(response).to render_template(:index)
		end

		it "assigns all @equipments" do
			get :index

			expect(assigns(:equipments)).to eq(Equipment.all)
		end
	end

	describe "GET show/:id" do
		it "renders the show template" do
			equip = FactoryGirl.create(:equipment)
			get :show, id: equip.id

			expect(response).to render_template(:show)
		end
	end

	describe "GET new" do
		it "renders the new template" do
			login_admin
			get :new

			expect(response).to render_template(:new)
		end
	end

	describe "GET edit/:id" do
		before :each do
			@equip = FactoryGirl.create(:equipment)
			login_admin
		end

		it "assigns the @equipment to edit" do
			get :edit, id: @equip

			expect(assigns(:equipment)).to eq(@equip)
		end

		it "renders the edit template" do
			get :edit, id: @equip

			expect(response).to render_template(:edit)
		end
	end

	describe "POST create" do
		before :each do
			login_admin
		end

		context "the happy path - valid" do
			it "as admin, creates a new equipment" do

				expect{
					post :create, equipment: FactoryGirl.attributes_for(:equipment)
				}.to change(Equipment, :count).by(1)
			end

			it "as admin, redirects to the new @equipment" do
				post :create, equipment: FactoryGirl.attributes_for(:equipment)

				expect(response).to redirect_to(Equipment.last)
			end
		end

		context "the sad path - not valid" do
			it "as admin, renders the new template" do
				post :create, equipment: FactoryGirl.attributes_for(:equipment, item: nil)

				expect(response).to render_template(:new)
			end
		end
	end

	describe "PUT update" do
		before :each do
			@equip = FactoryGirl.create(:equipment)
			login_admin
		end

		context "the happy path - valid" do
			it "assigns the @equipment to edit" do
				put :update, id: @equip, equipment: FactoryGirl.attributes_for(:equipment)

				expect(assigns(:equipment)).to eq(@equip)
			end

			it "changes @equipment's attributes" do
				put :update, id: @equip, equipment: FactoryGirl.attributes_for(:equipment, item: "test")

				@equip.reload
				expect(@equip.item).to eq("test")
			end

			it "redirects to the updated @equipment" do
				put :update, id: @equip, equipment: FactoryGirl.attributes_for(:equipment)

				expect(response).to redirect_to(@equip)
			end
		end

		context "the sad path - not valid" do
			it "renders the edit template after validation fail" do
				put :update, id:@equip, equipment: FactoryGirl.attributes_for(:equipment, item: nil)

				expect(response).to render_template(:edit)
			end
		end
	end
end
