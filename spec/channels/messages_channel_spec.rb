require 'rails_helper'

RSpec.describe MessagesChannel, type: :channel do
  it 'should send message text' do
    subscribe

    message_text = 'Hello Message'
    expect do
      subscription.send(:receive, { message_text: message_text })
    end.to have_broadcasted_to('messages').with(message_text: message_text)
  end
end
