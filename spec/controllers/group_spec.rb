require 'rails_helper'

RSpec.describe Group, type: :request do
  include Devise::Test::IntegrationHelpers
  before :each do
    @user = User.create(name: 'hevar', email: 'hevar@gmail.com', password: '123456')
    @group = Group.create(name: 'food', icon: 'food.png', user: @user)
  end

  describe 'GET /index' do
    before :each do
      sign_in @user
      get groups_path
    end

    it 'returns a ok status' do
      expect(response).to have_http_status(200)
    end

    it 'render exact text on page' do
      expect(response.body).to include('food')
    end
  end
end
