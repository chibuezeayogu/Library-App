# frozen_string_literal: true

FactoryBot.define do
  factory :books_author do
    book
    author
  end
end
