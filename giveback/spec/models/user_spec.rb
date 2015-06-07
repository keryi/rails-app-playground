require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build :user }

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password) }
  it { should validate_length_of(:password).is_at_least 8 }

  context 'invalid email' do
    it 'should not be valid' do
      user.email = 'abc.com'
      expect(user).to be_invalid
    end
  end
end
