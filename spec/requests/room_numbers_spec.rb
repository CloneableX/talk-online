require 'rails_helper'

RSpec.describe "RoomNumbers", type: :request do
  describe "GET /rooms/:room_id/number" do
    it "returns http success" do
      get room_number_path(create(:room))
      expect(response).to have_http_status(:success)
    end
  end

end
