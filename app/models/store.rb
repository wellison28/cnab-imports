# frozen_string_literal: true

class Store < ApplicationRecord
  validates :name, uniqueness: true
  validates :name, :owner_name, presence: true
  validates :name, :owner_name, length: { maximum: 50 }
end
