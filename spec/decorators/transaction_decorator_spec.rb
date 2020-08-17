# frozen_string_literal: true

require 'rails_helper'

describe TransactionDecorator do
  subject(:transaction_decorated) do
    build(:transaction, date: '1992-10-28', hour: '22:10:15').decorate
  end

  it { expect(transaction_decorated.date).to eq('28/10/1992') }
  it { expect(transaction_decorated.hour).to eq('22:10:15') }
end
