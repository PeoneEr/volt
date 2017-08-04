# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  email              :string
#  encrypted_password :string
#  role               :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'roles' do
    it 'should return user? == true if User.role == user' do
      user = User.create(email: Faker::Internet.email, password: 12_345, password_confirmation: 12_345, role: :user)

      expect(user.user?).to eq(true)
      expect(user.admin?).to eq(false)
    end

    it 'should return admin? == true if User.role == "admin"' do
      user = User.create(email: Faker::Internet.email, password: 12_345, password_confirmation: 12_345, role: :admin)

      expect(user.admin?).to eq(true)
      expect(user.user?).to eq(false)
    end
  end

  context 'email' do
    it 'should return not persisted record if email are taken' do
      email ||= Faker::Internet.email

      user = User.create(email: email, password: 12_345, password_confirmation: 12_345, role: :user)
      user2 = User.create(email: email, password: 12_345, password_confirmation: 12_345, role: :user)

      expect(user).not_to be_new_record
      expect(user2).to be_new_record
    end
  end

  context 'encrypted' do
    it 'should save encrypted password after create' do
      user = User.create(email: Faker::Internet.email, password: 12_345, password_confirmation: 12_345, role: :user)

      expect(user.encrypted_password).not_to be(nil)
      expect(user.encrypted_password).to eq(Digest::SHA1.hexdigest('12345'))
    end
  end

  it 'should save token after create' do
    email ||= Faker::Internet.email
    user = User.create(email: email, password: 12_345, password_confirmation: 12_345, role: :user)

    expect(user.token).not_to be(nil)
    expect(user.token).to eq(Digest::SHA1.hexdigest(email))
  end
end
