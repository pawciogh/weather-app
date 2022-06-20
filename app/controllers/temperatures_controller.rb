class TemperaturesController < ApplicationController
  before_action :set_temperature, only: %i[ edit update ]
  before_action :redirect_if_exists, only: %i[  new ]
  before_action :authenticate_admin!, except: [:index, :fetch_temp]

  def fetch_temp
    postcode = params[:postcode]
    pc = UKPostcode.parse(postcode)
      if pc.full_valid?
        url = "https://api.weatherapi.com/v1/forecast.json?key=55b7fdf17805493199a143223212409&q=#{postcode}&days=0"
        begin
          api_response = HTTParty.get(url)
          maxtemp_c = api_response.parsed_response["forecast"]["forecastday"].first["day"]["maxtemp_c"]
          redirect_to temperatures_path(t: maxtemp_c)
        rescue HTTParty::Error, SocketError => e
          redirect_to temperatures_path, notice: 'API not available. Please try again later.'
        end
      else
        redirect_to temperatures_path, notice: 'The postcode is not valid. Please try again.'
      end
  end

  def index
    @temperature = Temperature.last
  end

  def new
    @temperature = Temperature.new
  end
  
  def create
    @temperature = Temperature.new(temperature_params)
    respond_to do |format|
      if @temperature.save
        format.html { redirect_to root_path, notice: 'Temperature was successfully created.' }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end
  
  def update
    respond_to do |format|
      if @temperature.update(temperature_params)
        format.html { redirect_to root_path, notice: 'Temperature was successfully updated.' }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private
  def redirect_if_exists
    if Temperature.any? 
      redirect_to edit_temperature_path(Temperature.last), notice: 'Edit the existing temperatures.'
    end
  end

  def set_temperature
    @temperature = Temperature.find(params[:id])
  end

  def temperature_params
    params.require(:temperature).permit(:warm_bottom_temp, :warm_top_temp)
  end
end
