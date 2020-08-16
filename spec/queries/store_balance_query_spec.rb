# frozen_string_literal: true

require 'rails_helper'

describe StoreBalanceQuery do
  subject(:store_balance) { described_class.call(store.id) }

  let(:store) { create(:store) }

  let(:transaction1) { create(:transaction, amount: 10, store: store, transaction_type: transaction_type1) }
  let(:transaction2) { create(:transaction, amount: 10, store: store, transaction_type: transaction_type2) }

  before do
    transaction1
    transaction2
  end

  context 'when balance is positive' do
    let(:transaction_type1) { create(:transaction_type, operation: 0) }
    let(:transaction_type2) { create(:transaction_type, operation: 0) }

    it { expect(store_balance).to eq(20.0) }
  end

  context 'when balance is negative' do
    let(:transaction_type1) { create(:transaction_type, operation: 1) }
    let(:transaction_type2) { create(:transaction_type, operation: 1) }

    it { expect(store_balance).to eq(-20.0) }
  end

  context 'when balance is zero' do
    let(:transaction_type1) { create(:transaction_type, operation: 0) }
    let(:transaction_type2) { create(:transaction_type, operation: 1) }

    it { expect(store_balance).to eq(0.0) }
  end
end
