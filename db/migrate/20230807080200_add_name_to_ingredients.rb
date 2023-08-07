class AddNameToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :name, :string
  end
end
