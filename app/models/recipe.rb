class Recipe < ApplicationRecord
  after_create :log_recipe_created
  validates :description, presence: true, length: { maximum: 500 }


  belongs_to :chef
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def log_recipe_created
    Rails.logger.info "recipe created successfully"
  end

  validate :title_must_start_with_capital

  private

  def title_must_start_with_capital
    if title.present? && title[0] != title[0].upcase
      errors.add(:title, "must start with a capital letter")
    end
  end
end
