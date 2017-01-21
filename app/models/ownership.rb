class Ownership < ApplicationRecord
  has_many :user_ownerships
  has_many :user, through: :user_ownerships
  has_many :budgets
  has_many :entries
end