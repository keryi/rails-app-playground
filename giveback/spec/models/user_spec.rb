require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }

  context 'blank email' do
    it 'should not be valid' do
      user.email = ''
      expect(user).to be_invalid
    end
  end

  context 'invalid email' do
    it 'should not be valid' do
      user.email = 'abc.com'
      expect(user).to be_invalid
    end
  end

  context 'blank password' do
    it 'should not be valid' do
      user.password = ''
      user.password_confirmation = user.password
      expect(user).to be_invalid
    end
  end

  context 'invalid password length' do
    it 'should not be valid' do
      user.password = Faker::Lorem.characters 7
      user.password_confirmation = user.password
      expect(user).to be_invalid
    end
  end
end
