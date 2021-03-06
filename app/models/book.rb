class Book < ApplicationRecord
  has_many :reading_permissions
  has_many :user, through: :reading_permissions
  has_many :budgets
  has_many :entries
  accepts_nested_attributes_for :budgets, allow_destroy: true

  def set_budgets
    Item.all.find_each do |item|
      unless budget = budgets.find_by(item: item)
        self.budgets.new(item: item)
      end
    end
  end
end
