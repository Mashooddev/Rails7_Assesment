class Merchant < ApplicationRecord
  before_destroy :check_for_transactions

  default_scope { order(created_at: :desc) }

  has_many :transactions

  validates :email,
            uniqueness: true,
            format: { with: EMAIL_REGEX}

  private

  def check_for_transactions
    if transactions.any?
      raise "Can't delete, this merchant has transactions"
    end
  end
end