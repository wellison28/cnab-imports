# frozen_string_literal: true

require 'rails_helper'

describe StoreTransactionsController, type: :routing do
  it { expect(get: '/store_transactions').to route_to('store_transactions#index') }
end
