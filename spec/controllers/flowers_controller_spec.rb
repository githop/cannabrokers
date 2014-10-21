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
  	it "ad admin, renders the edit template" do
  		flower = FactoryGirl.create(:flower)
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
end