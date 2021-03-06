class User < ApplicationRecord
  has_many :reading_permissions
  has_many :books, through: :reading_permissions
  accepts_nested_attributes_for :reading_permissions, allow_destroy: true

  authenticates_with_sorcery!

  validates :password, length: { minimum: 6, allow_blank: true }
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, if: 'new_record?'

  validates :uid, uniqueness: true
end
