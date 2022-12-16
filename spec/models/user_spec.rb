require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have name' do
    user = User.new
    expect(user.name).to be_present
  end
end
