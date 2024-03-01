# frozen_string_literal: true

FactoryBot.define do
  factory :member do
    email { Faker::Internet.email }
    password { 'password123' }
  end
end
