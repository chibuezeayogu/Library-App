# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Genre, type: :model do
  context 'Association' do
    it { should have_many(:books) }
  end
end
