class MessagesController < ApplicationController
  def create
    RoomsChannel.send_message(message_params[:text])
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end
end
