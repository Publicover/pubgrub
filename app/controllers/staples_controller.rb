class StaplesController < ApplicationController
  before_action :set_staple, except: [:index, :new, :create]

  def index
    @staples = Staple.all
  end

  def show
  end

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

  def edit
  end

  def update
    @staple.update(staple_params)
    redirect_to staple_path(@staple), notice: 'Update successful.'
  end

  def destroy
    @staple.destroy
    redirect_to staples_path, notice: 'Destroyed successfully.'
  end

  def set_staple
    @staple = Staple.find(params[:id])
  end

  def staple_params
    params.require(:staple).permit(:name, :measurment, :quantity, :user_id, :status)
  end
end
