require 'rails_helper'

RSpec.describe Room, type: :model do
  describe "#generate_number" do
    it 'should generate 4 uppercase letters' do
      room = Room.new
      expect(room.number).to match(/[[:upper:]]{4}/)
    end

    it 'should be unique' do
      srand(0)
      Room.create

      srand(0)
      expect { Room.create! }.to raise_error ActiveRecord::RecordInvalid
    end
  end
  #     TODO: join room by input room number
  #       TODO: redirect back to root page when room number is incorrect
  #       TODO: join room when room number is correct
end
