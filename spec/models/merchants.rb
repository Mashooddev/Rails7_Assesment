require 'rails_helper'

RSpec.describe Merchant, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:merchant) }

    it { should validate_uniqueness_of(:email) }
    it { should allow_value('example@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
  end

  describe 'associations' do
    it { should have_many(:transactions) }
  end

  describe 'scopes' do
    it 'orders merchants by created_at in descending order' do
      merchant1 = FactoryBot.create(:merchant, created_at: 1.day.ago)
      merchant2 = FactoryBot.create(:merchant, created_at: 2.days.ago)
      merchant3 = FactoryBot.create(:merchant, created_at: 3.days.ago)

      expect(Merchant.all).to eq([merchant1, merchant2, merchant3])
    end
  end
end
