# frozen_string_literal: true

require 'rails_helper'

describe TransactionType, type: :model do
  subject(:transaction_types) { create(:transaction_type) }

  context 'with validations' do
    it { is_expected.to validate_presence_of(:kind) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:operation) }
    it { is_expected.to validate_length_of(:description).is_at_most(30) }
    it { is_expected.to validate_numericality_of(:kind).only_integer }
  end

  context 'with associations' do
    it { is_expected.to have_many(:transactions).dependent(:restrict_with_exception) }
  end

  it 'define enum for operation' do
    expect(transaction_types).to define_enum_for(:operation).with_values(
      credit: 0, debit: 1
    )
  end
end
