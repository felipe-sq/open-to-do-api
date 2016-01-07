require 'rails_helper'

describe Api::UsersController do
  describe '#index' do
    let!(:user_1) { FactoryGirl.create(:user) }
    let!(:user_2) { FactoryGirl.create(:user) }
    let(:result) { JSON.parse(response.body) }
    before do
      @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user_1.username, user_1.password)
      get :index
    end

    it 'returns valid json' do
      expect { JSON.parse(response.body) }.to_not raise_error
    end

    it 'returns success' do
      expect(response).to have_http_status(200)
    end

    it 'should return an array of all users' do
      expect(result).to be_an(Array)
      expect(result.count).to eq(User.count).and eq(2)
    end

    it 'should have properties for user 1' do
      user = result.detect { |u| u['id'] == user_1.id }
      expect(user['name']).to eq(user_1.name)
      expect(user['email']).to eq(user_1.email)
    end
  end

  describe 'POST create' do
    let!(:user_1) { FactoryGirl.create(:user) }
    before do
      @request.env['HTTP_AUTHORIZATION'] = ActionController::HttpAuthentication::Basic.encode_credentials(user_1.username, user_1.password)
      @new_user = build(:user)
      post :create, user: { username: 'new_user', password: 'password' }
    end
    it 'returns http success' do
      expect(response).to have_http_status(:success)
    end

    it 'returns json content type' do
      expect(response.content_type).to eq 'application/json'
    end

    it 'creates a user with the correct attributes' do
      hashed_json = JSON.parse(response.body)
      puts response.body
      expect(@new_user.username).to eq hashed_json['new_user']
      expect(@new_user.password).to eq hashed_json['password']
    end
  end
end
