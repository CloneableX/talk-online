require 'rails_helper'

RSpec.describe MessagesChannel, type: :channel do
  # TODO: send message about content, sender and send datetime
  #   TODO: render by a message object
  #   TODO: sender of message is current user
  #     TODO: record current user into session
  #       HINT: model User name:string
  #       TODO: record current user into session when user exists
  #       TODO: record a new user when user doesn't exists
  #     TODO: get current user when it needs in channel
  #       TODO: use controller concern that sets current user into session
  #       TODO: include in ApplicationCable::Channel
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
