require "rails_helper"

RSpec.describe ApplicationController do

controller do
	def index
		raise Pundit::NotAuthorizedError
	end
end
	describe "handling unauthorized users" do


		it "rejects unauthorized users to welcome index" do
			get :index
			expect(response).to redirect_to(root_path)
		end
	end
end