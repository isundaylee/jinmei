require "spec_helper"

describe StaticPagesController do
	describe 'GET #index' do
		it "renders the :index template" do
			get :index
			expect(response).to render_template(:index)
		end
	end

	describe 'GET #under_construction' do
		it "renders the :under_construction template" do
			get :under_construction
			expect(response).to render_template(:under_construction)
		end
	end
end