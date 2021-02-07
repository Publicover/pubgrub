class IngredientsController < ApplicationController
  before_action :set_ingredient, except: [:index, :new, :create]

  def index
    @ingredients = Ingredient.all
    authorize @ingredients
  end

  def show
  end

  def new
    @ingredient = Ingredient.new
    authorize @ingredient
  end

  def create
    @ingredient = Ingredient.new(ingredient_params)
    authorize @ingredient

    if @ingredient.save
      redirect_to ingredients_path, notice: 'Created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  private

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
    authorize @ingredient
  end

  def ingredient_params
    params.require(:ingredient).permit(policy(Ingredient).permitted_attributes)
  end
end
