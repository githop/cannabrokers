require 'rails_helper'

RSpec.describe FlowersController do
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

  	it "assings @flower to all flowers" do
  		get :index

  		expect(assigns(:flowers)).to eq(Flower.all)
  	end
  end

  describe "GET show/:id" do
  	it "renders the show template" do
	  	flower = FactoryGirl.create(:flower)
	  	get :show, id: flower.id

	  	expect(response).to render_template(:show)
  	end
  end

  describe "GET new" do
  	it "as admin, renders the new template" do
	  	login_admin
	  	get :new

	  	expect(response).to render_template(:new)
  	end
  end

  describe "GET edit/:id" do
    before :each do
      @flower = FactoryGirl.create(:flower)
    end

    it "as admin assigns @flower to be edited" do
      login_admin
      get :edit, id: @flower.id

      expect(assigns(:flower)).to eq(@flower)
    end

  	it "as admin, renders the edit template" do
      login_admin
      get :edit, id: @flower.id

      expect(response).to render_template(:edit)
  	end
  end

  describe "POST create" do
  	context "the happy path - valid" do
  		it "as admin, creates a new flower" do
  			login_admin

  			expect{
  				post :create, flower: FactoryGirl.attributes_for(:flower)
  			}.to change(Flower, :count).by(1)
  		end

  		it "as admin, redirects to the new @flower show page" do
  			login_admin
  			post :create, flower: FactoryGirl.attributes_for(:flower)

  			expect(response).to redirect_to(Flower.last)
  		end
  	end

  	context "the sad path - not valid" do
  		it "as admin, renders the new template" do
  			login_admin
  			post :create, flower: FactoryGirl.attributes_for(:flower, strain: nil)

  			expect(response).to render_template(:new)
  		end
  	end
  end

  describe "PUT update" do
    before :each do
      @flower = FactoryGirl.create(:flower, strain: "edit-able")
    end

    context "the happy path - valid" do
      it "as admin, assigns the correct @flower to edit" do
        login_admin
        put :update, id: @flower, flower: FactoryGirl.attributes_for(:flower)

        expect(assigns(:flower)).to eq(@flower)
      end

      it "updates @flower's attributes" do
        login_admin
        put :update, id: @flower, flower: FactoryGirl.attributes_for(:flower, strain: "edited")
        @flower.reload

        expect(@flower.strain).to eq("edited")
      end

      it "redirects to the @flower after update" do
        login_admin
        put :update, id: @flower, flower: FactoryGirl.attributes_for(:flower)

        expect(response).to redirect_to(@flower)
      end
    end

    context "the sad path - not valid" do
      it "as admin, renders edit template after failed validation" do
        login_admin
        put :update, id: @flower, flower: FactoryGirl.attributes_for(:flower, strain: nil)

        expect(response).to render_template(:edit)
      end
    end
  end
end