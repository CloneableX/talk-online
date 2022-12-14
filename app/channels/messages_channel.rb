class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'messages'
  end

  def receive(data)
    message_html = ApplicationController.render(partial: 'messages/message', locals: { message_text: data['message_text'] })
    ActionCable.server.broadcast('messages', html: message_html)
  end
end
