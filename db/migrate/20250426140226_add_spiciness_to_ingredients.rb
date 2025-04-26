class AddSpicinessToIngredients < ActiveRecord::Migration[8.0]
  def change
    add_column :ingredients, :spiciness, :integer
  end
end
