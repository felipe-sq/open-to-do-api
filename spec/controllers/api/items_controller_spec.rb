require 'rails_helper'

describe Api::ListsController do
  describe 'POST create' do
    let!(:user_1) { FactoryGirl.create(:user) }
    let!(:list_1) { FactoryGirl.create(:list) }
    before do
      @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user_1.username, user_1.password)
      @new_item = build(:item)
      post :create, item: { name: @new_item.name }
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns json content type' do
      expect(response.content_type).to eq 'application/json'
    end

    it 'creates a list with the correct attributes' do
      hashed_json = JSON.parse(response.body)
      expect(@new_item.name).to eq hashed_json['name']
    end
  end
end
