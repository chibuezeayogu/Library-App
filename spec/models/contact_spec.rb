# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Contact, type: :model do
  context 'Association' do
    it { is_expected.to belong_to :user }
  end
end
