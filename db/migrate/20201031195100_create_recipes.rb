class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :preparation
      t.string :image
      t.string :category
      t.integer :user_id
    end
  end
end
