json.extract! recipe, :id, :title, :description, :chef_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
