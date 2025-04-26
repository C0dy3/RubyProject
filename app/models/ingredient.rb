class Ingredient < ApplicationRecord
  enum :spiciness,  { no: 0, mild: 1, spicy: 2 }
  validates :name, presence: true, uniqueness: true
  validates :spiciness, presence: true
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

end
