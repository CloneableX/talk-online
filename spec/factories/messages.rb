# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    transient do
      sender { create(:user) }
    end

    initialize_with { new(content, sender) }
  end
end
