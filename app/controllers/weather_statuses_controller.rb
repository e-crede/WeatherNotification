class WeatherStatusesController < ApplicationController
  before_action :set_weather_status, only: %i[ show edit update destroy ]

  # GET /weather_statuses or /weather_statuses.json
  def index
    @weather_statuses = WeatherStatus.all
    WeatherNotificationJob.perform_later(check_morning = false)
  end

  # GET /weather_statuses/1 or /weather_statuses/1.json
  def show
  end

  # GET /weather_statuses/new
  def new
    @weather_status = WeatherStatus.new
  end

  # GET /weather_statuses/1/edit
  def edit
  end

  # POST /weather_statuses or /weather_statuses.json
  def create
    @weather_status = WeatherStatus.new(weather_status_params)

    respond_to do |format|
      if @weather_status.save
        format.html { redirect_to weather_status_url(@weather_status), notice: "Weather status was successfully created." }
        format.json { render :show, status: :created, location: @weather_status }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @weather_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /weather_statuses/1 or /weather_statuses/1.json
  def update
    respond_to do |format|
      if @weather_status.update(weather_status_params)
        format.html { redirect_to weather_status_url(@weather_status), notice: "Weather status was successfully updated." }
        format.json { render :show, status: :ok, location: @weather_status }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @weather_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /weather_statuses/1 or /weather_statuses/1.json
  def destroy
    @weather_status.destroy

    respond_to do |format|
      format.html { redirect_to weather_statuses_url, notice: "Weather status was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_weather_status
      @weather_status = WeatherStatus.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def weather_status_params
      params.require(:weather_status).permit(:driver_id, :state, :areaDesc, :headline, :description, :effective, :expires, :severity, :notified)
    end
end
