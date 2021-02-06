class GroceriesController < ApplicationController
  before_action :set_grocery, except: [:index, :new, :create]

  def index
    @groceries = policy_scope(Grocery)
    authorize @groceries
  end

  def show
  end

  def new
    @grocery = Grocery.new
    authorize @grocery
  end

  def create
    @grocery = Grocery.new(grocery_params)
    authorize @grocery

    if @grocery.save
      redirect_to groceries_path, notice: 'Created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @grocery.update(grocery_params)
    redirect_to grocery_path(@grocery), notice: 'Updated.'
  end

  def destroy
    @grocery.destroy
    redirect_to groceries_path, notice: 'Deleted.'
  end

  private

  def set_grocery
    @grocery = Grocery.find(params[:id])
    authorize @grocery
  end

  def grocery_params
    params.require(:grocery).permit(policy(Grocery).permitted_attributes)
  end
end
