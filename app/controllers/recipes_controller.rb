class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  def index
    @recipes= Recipe.paginate(page: params[:page], per_page: 5)
  end

  def show
    @comment = Comment.new
    @comments = @recipe.comments.paginate(page: params[:page], per_page: 5)
  end

  def new
     @recipe= Recipe.new
  end

  def create
     @recipe = Recipe.new(recipe_params)
     @recipe.chef = current_chef
     if @recipe.save
      flash[:success]="Saves recipe"
      redirect_to recipe_path(@recipe)
     else
      render 'new',status: 422
     end
  end
  def edit

  end
  def update

    if @recipe.update(recipe_params)
      flash[:success]="Saves recipe"
      redirect_to recipe_path(@recipe)
    else
      render 'edit', status: 422
    end
  end

  def destroy
    Recipe.find(params[:id]).destroy
    flash[:success] = "Deleted this recipe"
    redirect_to recipes_path
  end

  private
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end
    def recipe_params
      params.require(:recipe).permit(:name, :description, ingredient_ids: [])
    end

    def require_same_user
      if current_chef != @recipe.chef and !current_chef.admin
        flash[:danger]="You can delete or edit you own recipe"
        redirect_to recipes_path
      end
    end
end
