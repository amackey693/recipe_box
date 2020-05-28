class TagController < ApplicationController

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @tag = @recipes.tags.new
    render :new
  end

  def create
     @recipe = Recipe.find(params[:recipe_id])
     @tag = @recipes.tags.new(tag_params)
     if @tag.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:album_id])
    @tag = Tag.find(params[:id])
    render :edit
  end

  def show
    @recipe = Recipe.find(params[:album_id])
    @tag = Tag.find(params[:id])
    render :show
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to recipe_path
  end

  def destroy
   @tag = Tag.find(params[:id])
  @tag.destroy
  redirect_to reci_path(@song.album)
  end
end