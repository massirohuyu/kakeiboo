class Entry < ApplicationRecord
  belongs_to :item
  belongs_to :detail
  belongs_to :book
  belongs_to :input_user, class_name: "User"
end
