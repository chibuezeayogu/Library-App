# frozen_string_literal: true

FactoryBot.define do
  factory :author do
    name { Faker::Name.name }
    sex { Faker::Gender.binary_typ }
    nationality { Faker::Nation.nationality }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
  end
end
