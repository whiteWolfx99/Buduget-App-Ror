require 'rails_helper'

RSpec.describe 'Group Index Page', type: :feature do
  include Devise::Test::IntegrationHelpers

  before :each do
    @user = User.create(name: 'hevar', email: 'hevar@outlook.com', password: '123456')
    @group = Group.create(name: 'food', icon: 'food.png', user: @user)
    sign_in @user
  end

  describe 'GET /groups' do
    before :each do
      visit groups_path
    end

    it 'displays the category name on the page' do
      expect(page).to have_content('food')
    end

    it 'displays the correct total amount for each category' do
      expect(page).to have_content('Total Amount: $0.00')
    end
  end
end
