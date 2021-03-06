require 'rails_helper'

RSpec.describe PlaylistsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the users" do
      get :index
      expect(response).to render_template(:index)
    end
  end

end
