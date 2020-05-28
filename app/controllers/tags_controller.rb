class TagsController < ApplicationController

  def index
    @tags = Tag.all
    render :index 
  end
  
  def new
    @tag = Tag.new
    render :new
  end

  def create
     @tag = Tag.new(tag_params)
     if @tag.save
      redirect_to tags_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @tag = Tag.find(params[:id])
    @tag.recipes << @recipe
    render :edit
  end
  
  def show
    @recipes = Recipe.all
    @tag = Tag.find(params[:id])
    render :show
  end

  def update
    @tag = Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to tag_path
    end
  end

  def destroy
   @tag = Tag.find(params[:id])
   @tag.destroy
   redirect_to tags_path
  end

  private 
  def tag_params
    params.require(:tag).permit(:name)
  end
end