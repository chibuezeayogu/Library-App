# frozen_string_literal: true

FactoryBot.define do
  factory :contact do
    firstName { Faker::Name.first_name }
    lastName { Faker::Name.first_name }
    displayName { Faker::Name.first_name }
    email { Faker::Internet.email }
    phone { Faker::PhoneNumber.cell_phone }
    gender { Faker::Gender.binary_type }
    address { Faker::Address.full_address }
    nationality { Faker::Nation.nationality }
    user
  end
end
