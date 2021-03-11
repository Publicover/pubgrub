class RecipesController < ApplicationController
  before_action :set_recipe, except: %i[index new create]

  def index
    @recipes = policy_scope(Recipe)
    authorize @recipes
  end

  def show; end

  def new
    @recipe = Recipe.new
    authorize @recipe
  end

  def create
    @recipe = Recipe.new(recipe_params)
    authorize @recipe

    if @recipe.save
      redirect_to recipes_path, notice: 'Successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe), notice: 'Update successful.'
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: 'Delete successful.'
  end

  private

    def set_recipe
      @recipe = Recipe.find(params[:id])
      authorize @recipe
    end

    def recipe_params
      params.require(:recipe).permit(policy(Recipe).permitted_attributes)
    end
end
