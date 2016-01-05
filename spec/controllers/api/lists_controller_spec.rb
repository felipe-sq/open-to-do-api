require 'rails_helper'

describe Api::ListsController do
  describe "POST create" do
    let!(:user_1) { FactoryGirl.create(:user) }
    before do
      @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user_1.username, user_1.password)
      @new_list = build(:list)
      post :create, list: { name: @new_list.name, description: @new_list.description }
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "returns json content type" do
      expect(response.content_type).to eq 'application/json'
    end

    it "creates a list with the correct attributes" do
      hashed_json = JSON.parse(response.body)
      puts response.body
      expect(@new_list.name).to eq hashed_json["name"]
      expect(@new_list.description).to eq hashed_json["description"]
    end
  end
end
