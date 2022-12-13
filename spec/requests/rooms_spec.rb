require 'rails_helper'

RSpec.describe "Rooms", type: :request do
  describe "GET /:number" do
    it 'should show room' do
      get room_path('AAAA')
      expect(response).to be_successful
    end
  end
end
