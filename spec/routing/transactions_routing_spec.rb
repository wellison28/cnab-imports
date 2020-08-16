# frozen_string_literal: true

require 'rails_helper'

describe TransactionsController, type: :routing do
  it { expect(get: '/transactions').to route_to('transactions#index') }
end
