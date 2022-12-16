require 'rails_helper'

RSpec.describe MessagesChannel, type: :channel do
  let(:room_number) { 'AAAA' }
  let(:message_text) { 'Hello Message' }
  let(:current_user) { create(:user) }
  let(:message) { build(:message, content: message_text, sender: current_user) }

  before { travel_to Time.local(1994) }
  after { travel_back }

  it 'should send message text' do
    stub_connection current_user: current_user
    subscribe room_number: room_number

    message_html = ApplicationController.render(partial: 'messages/message', locals: { message: message })
    expect do
      subscription.send(:receive, { message_text: message_text }.as_json)
    end.to have_broadcasted_to("room_#{room_number}::messages").with(html: message_html)
  end
end
