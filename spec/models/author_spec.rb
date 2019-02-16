# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Author, type: :model do
  context 'Association' do
    it { should have_many(:books).through(:books_authors) }
    it { should have_many(:books_authors) }
  end
end
