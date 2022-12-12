class RoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'rooms'
  end

  def self.send_message(message)
    ActionCable.server.broadcast('rooms', message: message)
  end
end
