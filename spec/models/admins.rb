require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'validations' do
    subject { FactoryBot.build(:admin) }

    it { should validate_uniqueness_of(:email) }
    it { should allow_value('example@example.com').for(:email) }
    it { should_not allow_value('invalid_email').for(:email) }
    it { should validate_length_of(:password).is_at_least(6) }
  end

  describe 'password encryption' do
    let(:admin) { FactoryBot.build(:admin) }

    it 'encrypts the password' do
      admin.password = 'password'
      admin.save

      expect(admin.authenticate('password')).to eq(admin)
    end

    it 'authenticates the user with correct password' do
      admin.password = 'password'
      admin.save

      expect(admin.authenticate('password')).to eq(admin)
    end

    it 'does not authenticate the user with incorrect password' do
      admin.password = 'password'
      admin.save

      expect(admin.authenticate('wrong_password')).to be_falsey
    end
  end
end
