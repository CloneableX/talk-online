require 'rails_helper'

RSpec.describe MessagesChannel, type: :channel do
  # send message about content, sender and send datetime
  #   render by a message object
  #   sender of message is current user
  #     record current user into session
  #       model User name:string
  #       record current user into session when user exists
  #       record a new user when user doesn't exists
  #     get current user when it needs in channel
  #       use controller concern that sets current user into session
  #       include in ApplicationCable::Channel
  let(:room_number) { 'AAAA' }

  it 'should send message text' do
    subscribe room_number: room_number

    message_text = 'Hello Message'
    message_html = ApplicationController.render(partial: 'messages/message', locals: { message_text: message_text })
    expect do
      subscription.send(:receive, { message_text: message_text }.as_json)
    end.to have_broadcasted_to("room_#{room_number}::messages").with(html: message_html)
  end
end
