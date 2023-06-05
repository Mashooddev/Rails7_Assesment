# spec/models/transaction_spec.rb
require 'rails_helper'

RSpec.describe Transaction, type: :model do
  describe "validations" do
    it { should validate_presence_of(:amount) }
    it { should validate_numericality_of(:amount).is_greater_than_or_equal_to(1) }
    it { should allow_value("example@example.com").for(:customer_email) }
    it { should_not allow_value("invalid_email").for(:customer_email) }
  end

  describe "associations" do
    it { should belong_to(:merchant) }
  end

  describe "scopes" do
    describe ".default_scope" do
      it "orders transactions by descending created_at" do
        transaction1 = FactoryBot.create(:transaction)
        transaction2 = FactoryBot.create(:transaction)
        expect(Transaction.all).to eq([transaction2, transaction1])
      end
    end
  end
end
