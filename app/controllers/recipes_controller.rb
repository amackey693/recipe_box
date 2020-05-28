class RecipesController < ApplicationController 

  def index
    @recipes = Recipe.all
    render :index
  end

  def new
    @recipe = Recipe.new
    render :new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @tags = Tag.all
    if @tag.any?
      @tag = Tag.find(params[:name])
      @recipe.tags << @tag
    elsif @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @tag = Tag.find(params[:id])
    @recipe = Recipe.find(params[:id])
    @recipe.tags << @tag
    render :edit
  end

  def show
    @tags = Tag.all
    @recipe = Recipe.find(params[:id])
    render :show
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private 
    def recipe_params
      params.require(:recipe).permit(:name, :ingredients, :instructions)
    end
end