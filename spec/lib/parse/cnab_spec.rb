# frozen_string_literal: true

require 'rails_helper'

describe Parse::Cnab do
  subject(:parse_cnab) { described_class.new(file).parse }

  context 'when success' do
    let(:file) do
      Rails.root.join('spec/support/examples/valid_cnab_file.txt')
    end

    let(:result_data) do
      [
        {
          kind: 1,
          date: '1992-10-28',
          amount: 1000.0,
          cpf: '40255489846',
          card: '676387263562',
          hour: '13:23:34',
          store_owner_name: 'john',
          owner_name: 'start big'
        },
        {
          kind: 1,
          date: '1992-10-28',
          amount: 1000.0,
          cpf: '40255489846',
          card: '676387263562',
          hour: '13:23:34',
          store_owner_name: 'john',
          owner_name: 'start big'
        }
      ]
    end

    it { expect(parse_cnab.data).to eq(result_data) }
    it { expect(parse_cnab.valid?).to eq(true) }
    it { expect(parse_cnab.error).to eq('') }
  end

  context 'when failure' do
    let(:file) do
      Rails.root.join('spec/support/examples/invalid_cnab_file.txt')
    end

    context 'when format is invalid' do
      it { expect(parse_cnab.data).to eq([]) }
      it { expect(parse_cnab.valid?).to eq(false) }
      it { expect(parse_cnab.error).to eq('invalid format') }
    end
  end
end
