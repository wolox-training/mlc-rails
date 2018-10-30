require 'rails_helper'

describe User do
  # before { create(:user) }
  # subject(:user) { create(:user) }

  subject(:user) do
    User.new(
      first_name: first_name, last_name: last_name, email: email, password: password,
      password_confirmation: password_confirmation
    )
  end

  let(:first_name)            { Faker::Name.first_name }
  let(:last_name)             { Faker::Name.last_name }
  let(:email)                 { Faker::Internet.email }
  let(:password)              { 'password' }
  let(:password_confirmation) { 'password' }

  it { is_expected.to be_valid }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:last_name) }

  # describe '#generate_verification_code' do
  #   context 'When the user is created' do
  #     it 'generates a random verification code' do
  #       user.save!
  #       expect(user.verification_code).to be_present
  #     end
  #   end
  # end

  describe '#create' do
    context 'When the first_name is nil' do
      let(:first_name) { nil }

      it { is_expected.to be_invalid }
    end

    context 'When the last_name is nil' do
      let(:last_name) { nil }

      it { is_expected.to be_invalid }
    end
  end
end
