class MessagesChannel < ApplicationCable::Channel
  def subscribed
    @room_number = params[:room_number]
    stream_from broadcast_name
  end

  def receive(data)
    message_html = ApplicationController.render(partial: 'messages/message', locals: { message_text: data['message_text'] })
    ActionCable.server.broadcast(broadcast_name, html: message_html)
  end

  private

  def broadcast_name
    format('room_%s::messages', @room_number)
  end
end
