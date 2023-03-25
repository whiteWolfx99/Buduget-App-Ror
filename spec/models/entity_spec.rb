require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')
    @group = Group.create(name: 'Test Group', user: @user)
  end

  it 'should create a new entity with a valid group id' do
    @entity = Entity.create(name: 'Test Entity', amount: 10.0, user: @user, group: @group)
    expect(@entity).to be_valid
  end
end
