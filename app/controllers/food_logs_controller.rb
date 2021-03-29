class FoodLogsController < ApplicationController
  before_action :set_food_log, except: [:index, :new, :create]

  def index
    @food_logs = policy_scope(FoodLog)
    authorize @food_logs
    @meals = Meal.all
  end

  def show
  end

  def new
    @food_log = FoodLog.new
    authorize @food_log
    @meals = Meal.all
  end

  def create
    @food_log = FoodLog.new(food_log_params)
    authorize @food_log
    @meals = Meal.all

    if @food_log.save
      redirect_to food_logs_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @food_log.update(food_log_params)
    redirect_to food_logs_path
  end

  def destroy
    @food_log.destroy
    redirect_to food_logs_path
  end

  private

    def set_food_log
      @food_log = FoodLog.find(params[:id])
      authorize @food_log
    end

    def food_log_params
      params.require(:food_log).permit(policy(FoodLog).permitted_attributes)
    end
end
