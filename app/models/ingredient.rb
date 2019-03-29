class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :cocktails, through: :doses
  has_many :doses
end
