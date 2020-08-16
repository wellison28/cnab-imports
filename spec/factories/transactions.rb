# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    kind { 1 }
    date { '2020-08-15' }
    amount { '9.99' }
    card { 'MyString' }
    hour { '19:34:13' }
    recipient { nil }
    store { nil }
  end
end
