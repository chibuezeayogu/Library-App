# frozen_string_literal: true

class Genre < ApplicationRecord
  has_many :books

  validates :genre, presence: true, length: { in: 3..20 }, uniqueness: { case_sensitive: true }
end
