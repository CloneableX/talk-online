class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'messages'
  end

  def receive(data)
    ActionCable.server.broadcast('messages', message_text: data['message_text'])
  end
end
