require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  describe "GET /new" do
    it 'should return http success' do
      get new_room_path
      expect(response).to be_successful
    end
  end
  describe "POST /" do
    it 'should create a new room' do
      post rooms_path

      expect(response).to be_redirect
    end
  end

  describe "GET :number" do
    it 'should show room' do
      get room_path(create(:room).number)
      expect(response).to be_successful
    end
  end

  describe "#check_number" do
    it 'should redirect to root page when room number is incorrect' do
      get room_path('AAAA')
      expect(response).to redirect_to(root_path)
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
