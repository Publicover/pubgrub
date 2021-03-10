class IngredientsController < ApplicationController
  before_action :set_ingredient, except: %i[index new create]
  before_action :set_grocery_list, only: %i[index update_single_status update_multiple_status]

  def index
    @ingredients = Ingredient.all
    authorize @ingredients
  end

  def show; end

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

  def edit; end

  def update
    @ingredient.update(ingredient_params)
    redirect_to ingredient_path(@ingredient)
  end

  def destroy
    @ingredient.destroy
    redirect_to ingredients_path
  end

  def update_single_status
    @ingredient.flip_status
    respond_to do |format|
      format.html { redirect_to ingredients_path }
      format.js { render layout: false }
    end
  end

  def update_multiple_status
    @ingredient.flip_status
    respond_to do |format|
      format.html { redirect_to ingredients_path }
      format.js { render layout: false }
    end
  end

  private

    def set_ingredient
      @ingredient = Ingredient.find(params[:id])
      authorize @ingredient
    end

    def set_grocery_list
      @grocery_list = GroceryList.current.last
    end

    def ingredient_params
      params.require(:ingredient).permit(policy(Ingredient).permitted_attributes)
    end
end
