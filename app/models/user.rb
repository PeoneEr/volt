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
#  token              :string
#

class User < ApplicationRecord
  attr_accessor :password, :password_confirmation

  validates :email, presence: true, uniqueness: true
  validate :passwords_present
  validate :passwords_equal

  has_many :tasks, dependent: :destroy

  after_validation :store_encrypted_password
  after_validation :store_encrypted_token

  %w[user admin].each do |text_role|
    define_method %(#{text_role}?) do
      text_role == role
    end
  end

  private

  def passwords_present
    errors.add(:password, I18n.t('errors.password.empty')) if password.blank? || password_confirmation.blank?
  end

  def passwords_equal
    errors.add(:password, I18n.t('errors.password.not_equal')) if password != password_confirmation
  end

  def store_encrypted_password
    self.encrypted_password = EncrypeService.new(password).call
  end

  def store_encrypted_token
    self.token = EncrypeService.new(email).call
  end
end
