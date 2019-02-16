# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books_authors
  has_many :books, through: :books_authors
end
