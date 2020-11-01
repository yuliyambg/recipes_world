class AddDefaultImageToRecipes < ActiveRecord::Migration
  def change
    change_column_default :recipes, :image, 'https://images.unsplash.com/photo-1587200292891-9b3a506060f6?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60'
  end
end
