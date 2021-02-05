class MealsController < ApplicationController
  before_action :set_meal, except: [:index, :new, :create]

  def index
    @meals = policy_scope(Meal)
    authorize @meals
  end

  def show
  end

  def new
    @meal = Meal.new
    authorize @meal
  end

  def create

    @meal = Meal.new(meal_params)
    authorize @meal

    if @meal.save
      @meal.pic.attach(meal_params[:pic])
      redirect_to meals_path, notice: 'Looks delicious.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @meal.update(meal_params)
    redirect_to meal_path(@meal)
  end

  def destroy
    @meal.destroy
    redirect_to meals_path, notice: 'Well, no one liked that anyway.'
  end

  private

  def set_meal
    @meal = Meal.find(params[:id])
    authorize @meal
  end

  def meal_params
    params.require(:meal).permit(policy(Meal).permitted_attributes)
  end
end
