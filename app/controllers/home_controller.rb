class HomeController < ApplicationController
  before_action :type_cuisines
  def index
    @recipes = Recipe.last(6)
    @morefavoriteds = Favorite.group(:recipe).limit(3).count
    if user_signed_in?
      @favorites = current_user.favorite_recipes
    end
  end
  
  private

  def type_cuisines
    @cuisines = Cuisine.all 
    @recipe_types = RecipeType.all
  end
end
