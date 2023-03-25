RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')
  end

  it 'should create a new group with a valid user id' do
    @group = Group.create(name: 'Test Group', user: @user)
    expect(@group).to be_valid
  end

  it 'should not create a new group without a user id' do
    @group = Group.create(name: 'Test Group')
    expect(@group).not_to be_valid
  end
end
