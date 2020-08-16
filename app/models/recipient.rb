# frozen_string_literal: true

class Recipient < ApplicationRecord
  has_many :transactions, dependent: :restrict_with_exception

  validates :cpf, uniqueness: { case_sensitive: false }
  validates :cpf, presence: true
  validates :cpf, length: { is: 11 }

  validate :cpf_validation

  private

  def cpf_validation
    return if CPF.valid?(cpf)

    errors.add(:cpf, :invalid)
  end
end
