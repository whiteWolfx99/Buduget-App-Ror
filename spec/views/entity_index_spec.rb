require 'rails_helper'

RSpec.describe 'Transaction Page', type: :feature do
  include Devise::Test::IntegrationHelpers

  before :each do
    @user = User.create(name: 'hevar', email: 'hevar@outlook.com', password: '123456')
    @group = Group.create(name: 'food', icon: 'food.png', user: @user)
    @entity = Entity.create(name: 'groceries', amount: 10.0, user: @user, group: @group)
    @totals = { [@user.id, @group.id] => 10.0 }
    @entities = { [@user.id, @group.id] => [@entity] }
    sign_in @user
  end

  describe 'GET /groups/:id/entities' do
    before :each do
      visit group_entities_path(@group)
    end

    it 'displays the name of the group' do
      expect(page).to have_content(@group.name)
    end

    it 'displays the name and amount of the entity' do
      expect(page).to have_content(@entity.name)
      expect(page).to have_content(@entity.amount)
    end
  end
end
