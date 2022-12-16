# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    initialize_with { new(content) }
  end
end
