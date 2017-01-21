class UserOwnership < ApplicationRecord
  belongs_to :user
  belongs_to :ownership
end