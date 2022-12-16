# frozen_string_literal: true

class Message
  attr_reader :content

  def initialize(content, sender)
    @content = content
    @sender = sender
  end
end
