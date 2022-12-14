require 'rails_helper'

RSpec.describe MessagesChannel, type: :channel do
  it 'should send message text' do
    subscribe

    message_text = 'Hello Message'
    message_html = ApplicationController.render(partial: 'messages/message', locals: { message_text: message_text })
    expect do
      subscription.send(:receive, { message_text: message_text }.as_json)
    end.to have_broadcasted_to('messages').with(html: message_html)
  end
end
