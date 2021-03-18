class CondimentsController < ApplicationController
  before_action :set_condiment, except: [:index, :new, :create]

  def index
    @condiments = policy_scope(Condiment).order(:name)
    authorize @condiments
  end

  def show
  end

  def new
    @condiment = Condiment.new
    authorize @condiment
  end

  def create
    @condiment = Condiment.new(condiment_params)
    authorize @condiment

    if @condiment.save
      redirect_to condiments_path, notice: 'Created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @condiment.update(condiment_params)
    redirect_to condiments_path, notice: 'Update successful.'
  end

  def destroy
    @condiment.destroy
    redirect_to condiments_path, notice: 'Delete successful.'
  end

  private

    def set_condiment
      @condiment = Condiment.find(params[:id])
      authorize @condiment
    end

    def condiment_params
      params.require(:condiment).permit(policy(Condiment).permitted_attributes)
    end
end
