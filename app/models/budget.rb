class Budget < ApplicationRecord
  belongs_to :ownership
  belongs_to :item
end