class SideCategoriesController < ApplicationController
  before_action :set_side_category, except: %i[index new create]

  def index
    @side_categories = policy_scope(SideCategory)
    authorize @side_categories
  end

  def show; end

  def new
    @side_category = SideCategory.new
    authorize @side_category
  end

  def create
    @side_category = SideCategory.new(side_category_params)
    authorize @side_category

    if @side_category.save
      redirect_to side_categories_path, notice: 'Successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    @side_category.update(side_category_params)

    if @side_category.save
      redirect_to side_category_path(@side_category), notice: 'Update successful.'
    else
      render :edit
    end
  end

  def destroy
    @side_category.destroy
    redirect_to side_categories_path, notice: 'Delete successful.'
  end

  private

    def set_side_category
      @side_category = SideCategory.find(params[:id])
      authorize @side_category
    end

    def side_category_params
      params.require(:side_category).permit(policy(SideCategory).permitted_attributes)
    end
end
