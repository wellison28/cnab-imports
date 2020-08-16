# frozen_string_literal: true

class Store < ApplicationRecord
  has_many :transactions, dependent: :restrict_with_exception

  validates :name, uniqueness: true
  validates :name, :owner_name, presence: true
  validates :name, :owner_name, length: { maximum: 50 }
end
