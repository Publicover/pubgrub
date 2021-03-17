class StaplesController < ApplicationController
  before_action :set_staple, except: %i[index new create]

  def index
    @staples = Staple.all
  end

  def show; end

  def new
    @staple = Staple.new
  end

  def create
    @staple = Staple.new(staple_params)

    if @staple.save
      redirect_to staples_path, notice: 'Staple created successfully.'
    else
      render :new
    end
  end

  def edit; end

  def update
    @staple.update(staple_params)
    redirect_to staple_path(@staple), notice: 'Update successful.'
  end

  def destroy
    @staple.destroy
    redirect_to staples_path, notice: 'Destroyed successfully.'
  end

  def update_staple_status
    @grocery_list = GroceryList.current.last

    if @staple.out_of_stock?
      @staple.update(status: :in_stock)
    elsif @staple.in_stock?
      @staple.update(status: :out_of_stock)
    end
    respond_to do |format|
      format.html { redirect_to ingredients_path }
      format.js { render layout: false }
    end
  end

  def update_staple_card_status
    if @staple.out_of_stock?
      @staple.update(status: :in_stock)
    elsif @staple.in_stock?
      @staple.update(status: :out_of_stock)
    end
    respond_to do |format|
      format.html { redirect_to staples_path }
      format.js { render layout: false }
    end
  end

  private

    def set_staple
      @staple = Staple.find(params[:id])
    end

    def staple_params
      params.require(:staple).permit(:grocery_id, :pic, :measurement_id, :quantity,
                                     :user_id, :status, :calories_per_package,
                                     :grams_per_package)
    end
end
