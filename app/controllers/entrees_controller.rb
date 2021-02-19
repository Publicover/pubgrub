class EntreesController < ApplicationController
  before_action :set_entree, except: [:index, :new, :create]

  def index
    @entrees = policy_scope(Entree)
    authorize @entrees
  end

  def show
  end

  def new
    @entree = Entree.new
    authorize @entree
  end

  def create
    @entree = Entree.new(entree_params)
    authorize @entree

    if @entree.save
      redirect_to entrees_path, notice: 'Created successfully.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    @entree.update(entree_params)
    redirect_to entree_path(@entree), notice: 'Update successful.'
  end

  def destroy
    @entree.destroy
    redirect_to entrees_path, notice: 'Delet successful.'
  end

  private

  def set_entree
    @entree = Entree.find(params[:id])
    authorize @entree
  end

  def entree_params
    params.require(:entree).permit(policy(Entree).permitted_attributes)
  end
end
