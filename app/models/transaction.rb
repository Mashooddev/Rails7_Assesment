class Transaction < ApplicationRecord
  belongs_to :merchant

  enum status: { approved: 0, reversed: 1, refunded: 2, error: 3 }
  
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :customer_email, format: { with: EMAIL_REGEX}
  validates_inclusion_of :status, in: Transaction.statuses.keys

  default_scope { order(created_at: :desc) }
end
