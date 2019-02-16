# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'Association' do
    it { should have_many(:authors).through(:books_authors) }
    it { should have_many(:books_authors) }
    it { is_expected.to belong_to :genre }
  end
end
