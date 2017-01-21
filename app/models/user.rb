class User < ApplicationRecord
  has_many :user_ownerships
  has_many :ownerships, through: :user_ownerships

  authenticates_with_sorcery!

  validates :password, length: { minimum: 6 }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true

  validates :uid, uniqueness: true
end
