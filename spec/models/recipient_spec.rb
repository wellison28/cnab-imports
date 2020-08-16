# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipient, type: :model do
  subject(:recipient) { build(:recipient) }

  context 'with validations' do
    it { is_expected.to validate_uniqueness_of(:cpf).case_insensitive }
    it { is_expected.to validate_presence_of(:cpf) }
    it { is_expected.to validate_length_of(:cpf).is_equal_to(11) }

    context 'when the cpf is not valid' do
      let(:recipient) { build(:recipient, cpf: '11111111111') }

      it { expect(recipient.valid?).to eq(false) }
    end

    context 'when the cpf is valid' do
      let(:recipient) { build(:recipient, cpf: CPF.generate) }

      it { expect(recipient.valid?).to eq(true) }
    end
  end
end