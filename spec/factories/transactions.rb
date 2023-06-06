FactoryBot.define do
    factory :transaction do
      amount { Faker::Number.decimal(l_digits: 2) }
      status { Faker::Number.between(from: 0, to: 2) }
      customer_email { Faker::Internet.email }
      customer_phone { Faker::PhoneNumber.phone_number }
      association :merchant
    end
end