require 'rails_helper'

describe ImportCreateService do
  subject(:import_create) { described_class.perform(parse_object) }

  let(:transaction_type) { create(:transaction_type, operation: 1) }

  let(:parse_object) do
    {
      kind: 1,
      date: '1992-10-28',
      amount: 1000.0,
      cpf: '40255489846',
      card: '676387263562',
      hour: '13:23:34',
      store_owner_name: 'john',
      store_name: 'start big'
    }
  end

  let(:parse_result) do
    OpenStruct.new(
      parse: Parse::Cnab::Result.new(
        data_result: parse_object,
        error_message: '',
        valid: true
      )
    )
  end

  before do
    transaction_type
    allow(Parse::Cnab).to receive(:new).and_return(parse_result)
  end

  context 'when success' do
    let(:lasted_transaction) { Transaction.last }
    let(:lasted_recipient) { Recipient.last }
    let(:lasted_store) { Store.last }

    before { import_create }

    it 'save corrects data for transaction' do
      expect(lasted_transaction.transaction_type.operation).to eq('debit')
      expect(lasted_transaction.amount.to_f).to eq(1000.0)
      expect(lasted_transaction.date).to eq(Date.new(1992,10,28))
      expect(lasted_transaction.hour.strftime('%T')).to eq('13:23:34')
      expect(lasted_transaction.card).to eq('676387263562')
    end

    it 'save corrects data for recipient' do
      expect(lasted_recipient.cpf).to eq('40255489846')
      expect(lasted_recipient.transactions.last.id).to eq(lasted_transaction.id)
    end

    it 'save corrects data for store' do
      expect(lasted_store.name).to eq('start big')
      expect(lasted_store.owner_name).to eq('john')
    end
  end

  context 'when error' do
    context 'when operation does not exists'
    context 'when file has invalid format'
  end
end
