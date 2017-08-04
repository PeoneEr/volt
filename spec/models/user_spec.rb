require 'rails_helper'

RSpec.describe User, type: :model do
  context 'roles' do
    it 'should return user? == true if User.role == user' do
      user = User.create(email: Faker::Internet.email, password: 12345, password_confirmation: 12345, role: :user)

      expect(user.user?).to eq(true)
      expect(user.admin?).to eq(false)
    end

    it 'should return admin? == true if User.role == "admin"' do
      user = User.create(email: Faker::Internet.email, password: 12345, password_confirmation: 12345, role: :admin)

      expect(user.admin?).to eq(true)
      expect(user.user?).to eq(false)
    end
  end

  context 'email' do
    it 'should return not persisted record if email are taken' do
      email ||= Faker::Internet.email

      user = User.create(email: email, password: 12345, password_confirmation: 12345, role: :user)
      user2 = User.create(email: email, password: 12345, password_confirmation: 12345, role: :user)

      expect(user).not_to be_new_record
      expect(user2).to be_new_record
    end
  end
end
