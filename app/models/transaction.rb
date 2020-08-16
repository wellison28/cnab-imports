# frozen_string_literal: true

class Transaction < ApplicationRecord
  belongs_to :recipient
  belongs_to :store
  belongs_to :transaction_type

  validates :kind, :date, :amount, :card, :hour, presence: true
  validates :card, length: { maximum: 12 }
  validates :amount, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 99_999_999.99
  }
end
