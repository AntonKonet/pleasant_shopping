require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do
    allow_any_instance_of(User).to receive(:complete_invitation).and_return true
  end

  describe 'validations' do
    it {should validate_presence_of(:first_name)}
    it {should validate_presence_of(:last_name)}
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
    it {should validate_presence_of(:password_confirmation)}

    it {should validate_uniqueness_of(:email)}
  end

  describe 'associations' do
    it {should have_one(:invitation)}
    it {should have_many(:orders)}
  end

  describe '#authenticate' do

    let(:email) { 'john@corporation.com' }
    let(:password) { 'Password1' }
    let(:user) { FactoryGirl.create(:user, first_name: 'John', last_name: 'Doe', email: email, password: password, password_confirmation: password) }

    subject { User.authenticate(email, password) }

    it 'returns nil when user does not exist' do
      expect(subject).to be_nil
    end

    it 'returns nil when user password is incorrect' do
      user
      password = 'wrong_password'
      expect(User.authenticate(email, password)).to be_nil
    end

    it 'returns existing user when credentials are correct' do
      user
      expect(subject).to eq user
    end
  end

end
