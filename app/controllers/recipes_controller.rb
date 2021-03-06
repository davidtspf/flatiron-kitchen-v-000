class RecipesController < ApplicationController

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params(:name, ingredient_ids:[]))
    @recipe.save
    redirect_to recipe_path(@recipe)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    @recipe.update(recipe_params(:name, ingredient_ids:[]))
    redirect_to recipe_path(@recipe)
  end

  private

  def recipe_params(*args)
    params.require(:recipe).permit(*args)
  end

end
