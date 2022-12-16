require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  describe "GET /:number" do
    it 'should show room' do
      get room_path('AAAA')
      expect(response).to be_successful
    end
  end

  describe '#set_current_user' do
    let(:room_number) { 'AAAA' }

    it 'should keep user_id when user exists' do
      get room_path(room_number)
      user_id = session[:user_id]

      get room_path(room_number)
      expect(session[:user_id]).to eq(user_id)
    end

    it 'should record a new user into session when user does not exist' do
      get room_path(room_number)
      expect(session[:user_id]).to be_present
    end
  end
end
