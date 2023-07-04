class Esp8266sController < ApplicationController
    before_action :set_esp8266, only: [:show, :update, :destroy]

  # GET /esp8266s
  def index
    @esp8266s = Esp8266.all
    render json: @esp8266s
  end

  # POST /esp8266s
  def create
    @esp8266 = Esp8266.new(esp8266_params)

    if @esp8266.save
      render json: @esp8266, status: :created
    else
      render json: @esp8266.errors, status: :unprocessable_entity
    end
  end

  # DELETE /esp8266s/:id
  def destroy
    @esp8266 = Esp8266.find(params[:id])
    @esp8266.destroy
    render json: { message: 'ESP8266 destroyed' }
  end

  private

  def set_esp8266
    @esp8266 = Esp8266.find(params[:id])
  end

  def esp8266_params
    params.require(:esp8266).permit(:name)
  end
end
