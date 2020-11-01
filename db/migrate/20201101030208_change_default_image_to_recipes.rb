class ChangeDefaultImageToRecipes < ActiveRecord::Migration
  def change
    change_column_default :recipes, :image, '/images/recipe-default-img.jpg'
  end
end
