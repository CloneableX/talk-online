require 'rails_helper'

RSpec.describe "Messages", type: :request do
  describe "POST /create" do
    it "returns http success" do
      expect do
        post messages_path, params: { message: { text: 'Hello Room' } }
      end.to have_broadcasted_to('rooms')
      expect(response).to have_http_status(:success)
    end
  end

end
