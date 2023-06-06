FactoryBot.define do
    factory :merchant do
      name { Faker::Company.name }
      email { Faker::Internet.email }
      description { Faker::Lorem.sentence }
      status { %w[active inactive].sample }
      total_transaction_sum { Faker::Number.decimal(l_digits: 2) }
    end
end