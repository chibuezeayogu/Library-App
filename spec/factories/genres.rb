# frozen_string_literal: true

FactoryBot.define do
  factory :genre do
    genre { Faker::Name.first_name }
  end
end
