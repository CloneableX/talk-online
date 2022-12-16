require 'rails_helper'

RSpec.describe MessagesChannel, type: :channel do
  # TODO: send message about content, sender and send datetime
  let(:room_number) { 'AAAA' }
  let(:message_text) { 'Hello Message' }
  let(:message) { build(:message, content: message_text) }

  it 'should send message text' do
    subscribe room_number: room_number

    message_html = ApplicationController.render(partial: 'messages/message', locals: { message: message })
    expect do
      subscription.send(:receive, { message_text: message_text }.as_json)
    end.to have_broadcasted_to("room_#{room_number}::messages").with(html: message_html)
  end
  #   TODO: sender of message is current user
  #     TODO: get current user when it needs in channel
  #       TODO: use controller concern that sets current user into session
  #       TODO: include in ApplicationCable::Channel
end
