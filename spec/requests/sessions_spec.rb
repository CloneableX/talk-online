require 'rails_helper'

RSpec.describe "Sessions", type: :request do
  describe "POST /" do
    let(:room_number) { create(:room).number }

    it "returns redirect to room show page" do
      post sessions_path, params: { room_number: room_number }
      expect(response).to redirect_to(room_path(room_number))
    end
  end

end
