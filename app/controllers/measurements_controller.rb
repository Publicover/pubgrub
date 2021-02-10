class MeasurementsController < ApplicationController
  before_action :set_measurement, except: %i[index new create]

  def index
    @measurements = Measurement.all
    authorize @measurements
  end

  def show; end

  def new
    @measurement = Measurement.new
    authorize @measurement
  end

  def create
    @measurement = Measurement.new(measurement_params)
    authorize @measurement

    if @measurement.save
      redirect_to measurements_path, notice: 'Created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    @measurement.update(measurement_params)
    redirect_to measurement_path(@measurement), notice: 'Updated.'
  end

  def destroy
    @measurement.destroy
    redirect_to measurements_path, notice: 'Deleted.'
  end

  private

    def set_measurement
      @measurement = Measurement.find(params[:id])
      authorize @measurement
    end

    def measurement_params
      params.require(:measurement).permit(policy(Measurement).permitted_attributes)
    end
end
