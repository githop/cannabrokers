require 'rails_helper'

RSpec.describe EquipmentController do
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
			get :new

			expect(response).to render_template(:new)
		end
	end
end