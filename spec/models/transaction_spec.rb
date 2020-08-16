# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  subject(:transaction) { build(:transaction) }

  context 'with validations' do
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_presence_of(:card) }
    it { is_expected.to validate_presence_of(:hour) }

    it { is_expected.to validate_length_of(:card).is_at_most(12) }

    it {
      expect(transaction).to validate_numericality_of(:amount).
        is_greater_than(0).
        is_less_than_or_equal_to(99_999_999.99)
    }
  end

  context 'with associations' do
    it { is_expected.to belong_to(:recipient) }
    it { is_expected.to belong_to(:store) }
    it { is_expected.to belong_to(:transaction_type) }
  end
end
