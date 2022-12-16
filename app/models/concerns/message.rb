# frozen_string_literal: true

class Message
  attr_reader :content, :created_at

  def initialize(content, sender)
    @content = content
    @sender = sender
    @created_at = Time.now
  end

  def sender_name
    @sender.name
  end
end
