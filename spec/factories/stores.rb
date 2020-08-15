# frozen_string_literal: true

FactoryBot.define do
  factory :store do
    name { Faker::Name.name[0, 50] }
    owner_name { Faker::Name.name[0, 50] }
  end
end
