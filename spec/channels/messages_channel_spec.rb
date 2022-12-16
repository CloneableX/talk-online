require 'rails_helper'

RSpec.describe MessagesChannel, type: :channel do
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
