class Budget < ApplicationRecord
  belongs_to :book
  belongs_to :item
end
