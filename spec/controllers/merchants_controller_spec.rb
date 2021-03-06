require "rails_helper"

RSpec.describe MerchantsController, type: :controller do


	def login_admin
		@request.env["devise.mapping"] = Devise.mappings[:admin]
		admin = FactoryGirl.create(:admin)
    sign_in :user, admin # sign_in(scope, resource)
  end

  describe "GET show/:id" do
  	it "renders the show template" do
  		merch = FactoryGirl.create(:merchant)
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

  describe 'GET edit/:id' do
    before :each do
      @merchant = FactoryGirl.create(:merchant)
    end

    it "as admin, assigns @merchant to edit" do
      login_admin
      get :edit, id: @merchant.id

      expect(assigns(:merchant)).to eq(@merchant)
    end

  	it "as admin, renders the edit template" do
  		login_admin
  		get :edit, id: @merchant.id

  		expect(response).to render_template(:edit)
  	end
  end

  describe "POST create" do
  	context "the happy path - valid" do
  		it "as admin, creates a new merchant" do
  			login_admin
  			attrs = FactoryGirl.attributes_for(:merchant)
  			expect{
  				post :create, merchant: attrs
  			}.to change(Merchant, :count).by(1)
  		end

  		it "as admin, after create, redirects to show page" do
  				login_admin
  				post :create, merchant: FactoryGirl.attributes_for(:merchant)

  				expect(response).to redirect_to(Merchant.last)
  		end
  	end


		context "the sad path - invalid" do
			it "as admin, renders the new template" do
				login_admin
				post :create, merchant: FactoryGirl.attributes_for(:merchant, name: nil)

				expect(response).to render_template(:new)
			end
		end
  end

  describe "PUT update" do
    before :each do
      @merch = FactoryGirl.create(:merchant, name: "Not a real Merchant")
    end

  	context "happy path - valid" do
  		it "assigns the correct @merchant to edit" do
        login_admin
  			put :update, id: @merch, merchant: FactoryGirl.attributes_for(:merchant)

  			expect(assigns(:merchant)).to eq(@merch)
  		end

  		it "changes the @merchant's attributes" do
        login_admin
        put :update, id: @merch, merchant: FactoryGirl.attributes_for(:merchant, name: "A Real Merchant")

        @merch.reload
        expect(@merch.name).to eq("A Real Merchant")
      end

      it "redirects to @merchant after update" do
        login_admin
        put :update, id: @merch, merchant: FactoryGirl.attributes_for(:merchant)

        expect(response).to redirect_to(@merch)
      end
  	end

    context "sad path - not valid" do
      it "renders the edit template upon failed validation" do
        login_admin
        put :update, id: @merch, merchant: FactoryGirl.attributes_for(:merchant, name: nil)

        expect(response).to render_template(:edit)
      end
    end
  end
end
