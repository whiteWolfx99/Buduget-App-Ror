require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should not create a new user without a name' do
    user = User.create
    expect(user).not_to be_valid
  end

  it 'should have many groups' do
    user = User.reflect_on_association(:groups)
    expect(user.macro).to eq(:has_many)
  end

  it 'should have many entities' do
    user = User.reflect_on_association(:entities)
    expect(user.macro).to eq(:has_many)
  end
end
