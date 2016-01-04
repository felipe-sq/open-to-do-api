require 'rails_helper'

describe Api::UsersController do
  describe '#index' do
    let!(:user_1) { FactoryGirl.create(:user) }
    let!(:user_2) { FactoryGirl.create(:user) }
    let(:result) { JSON.parse(response.body) }
    before do
      get :index
    end

    it 'returns valid json' do
      expect(JSON.parse(response.body)).to_not raise_error
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
end
