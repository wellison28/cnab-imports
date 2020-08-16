# frozen_string_literal: true

class TransactionType < ApplicationRecord
  has_many :transactions, dependent: :restrict_with_exception

  enum operation: { credit: 0, debit: 1 }

  validates :kind, :description, :operation, presence: true
  validates :kind, numericality: { only_integer: true }
  validates :description, length: { maximum: 30 }
end
