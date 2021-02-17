class CuisinesController < ApplicationController
  before_action :set_cuisine, except: [:index, :new, :create]

  def index
    @cuisines = policy_scope(Cuisine)
    authorize @cuisines
  end

  def show
  end

  def new
    @cuisine = Cuisine.new
    authorize @cuisine
  end

  def create
    @cuisine = Cuisine.new(cuisine_params)
    authorize @cuisine

    if @cuisine.save
      redirect_to cuisines_path, notice: 'Successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @cuisine.update(cuisine_params)

    if @cuisine.save
      redirect_to cuisine_path(@cuisine), notice: 'Update successful.'
    else
      render :edit
    end
  end

  def destroy
    @cuisine.destroy
    redirect_to cuisines_path, notice: 'Delete successful.'
  end

  private

  def set_cuisine
    @cuisine = Cuisine.find(params[:id])
    authorize @cuisine
  end

  def cuisine_params
    params.require(:cuisine).permit(policy(Cuisine).permitted_attributes)
  end
end
