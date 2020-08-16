# frozen_string_literal: true

FactoryBot.define do
  factory :transaction_type do
    kind { 1 }
    description { 'MyString' }
    operation { 1 }
  end
end
