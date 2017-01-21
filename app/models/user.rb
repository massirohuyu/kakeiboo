class User < ApplicationRecord
  has_many :user_ownerships
  has_many :ownerships, through: :user_ownerships
  accepts_nested_attributes_for :user_ownerships, allow_destroy: true

  authenticates_with_sorcery!

  validates :password, length: { minimum: 6, allow_blank: true }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, if: 'new_record?'

  validates :uid, uniqueness: true
end
