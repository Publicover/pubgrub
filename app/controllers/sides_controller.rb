class SidesController < ApplicationController
  before_action :set_side, except: %i[index new create]

  def index
    @sides = policy_scope(Side).order(created_at: :desc)
    authorize @sides
  end

  def show; end

  def new
    @side = Side.new
    authorize @side
  end

  def create
    @side = Side.new(side_params)
    authorize @side

    if @side.save
      redirect_to sides_path, notice: 'Successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    @side.update(side_params)
    redirect_to side_path(@side), notice: 'Update successful.'
  end

  def destroy
    @side.destroy
    redirect_to side_path(@side), notice: 'Destroy successful.'
  end

  def finalize_calories
    @sides = policy_scope(Side).order(created_at: :desc)
    CalculateCalories.new.perform(@side)

    respond_to do |format|
      format.html { redirect_to sides_path }
      format.js { render layout: false }
    end
  end

  private

    def set_side
      @side = Side.find(params[:id])
      authorize @side
    end

    def side_params
      params.require(:side).permit(policy(Side).permitted_attributes)
    end
end
