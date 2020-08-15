# frozen_string_literal: true

FactoryBot.define do
  factory :recipient do
    cpf { CPF.generate }
  end
end
