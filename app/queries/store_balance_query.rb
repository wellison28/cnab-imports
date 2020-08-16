# frozen_string_literal: true

class StoreBalanceQuery
  attr_reader :store_id

  def initialize(store_id)
    @store_id = store_id
  end

  def self.call(*args)
    new(*args).calculate
  end

  def calculate
    (total_credits - total_debits).to_f
  end

  private

  def total_debits
    Transaction.joins(:transaction_type).
      where(store_id: store_id).
      where('transaction_types.operation = ?', 1).
      sum(:amount)
  end

  def total_credits
    Transaction.joins(:transaction_type).
      where(store_id: store_id).
      where('transaction_types.operation = ?', 0).
      sum(:amount)
  end
end
