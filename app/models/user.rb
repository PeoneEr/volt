class User < ApplicationRecord
  attr_accessor :password, :password_confirmation

  validates :email, presence: true, uniqueness: true
  validate :passwords_present
  validate :passwords_equal

  %w(user admin).each do |text_role|
    define_method %(#{text_role}?) do
      text_role == role
    end
  end

  def passwords_present
    errors.add(:password, I18n.t('errors.password.empty')) if password.blank? || password_confirmation.blank?
  end

  def passwords_equal
    errors.add(:password, I18n.t('errors.password.not_equal')) if password != password_confirmation
  end
end
