class Merchant < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_many :transactions

  validates :email,
            uniqueness: true,
            format: { with: EMAIL_REGEX}
end