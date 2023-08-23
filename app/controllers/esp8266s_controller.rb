class Esp8266sController < ApplicationController
    before_action :set_esp8266, only: [:show, :update, :destroy]

  # GET /esp8266s
  def index
    @esp8266s = Esp8266.all
    render json: @esp8266s
  end

  def update_status 
      esp8266 = Esp8266.find_or_initialize_by(device: params[:device])
      esp8266.status = params[:status]
      esp8266.ipadrrs = params[:ipadrrs]
      esp8266.cont = params[:cont]
      esp8266.last_seen = params[:last_seen]
      esp8266.padlock = params[:padlock]
      esp8266.owner = params[:owner]
      esp8266.phone = params[:phone]
      esp8266.fullmax = params[:fullmax]
      esp8266.litro = params[:litro]
      esp8266.save

      if esp8266.nil?
        # Dispositivo não encontrado
        render json: { error: 'Dispositivo não encontrado' }
      else
        #if esp8266.last_seen.present? && esp8266.last_seen > 5.minutes.ago
        #if esp8266.online?
        if params[:status] == "online"
          render json: { success: true, message: 'Online' }
        else
          render json: { success: false, message: 'Offline' }
        end
      end
      # Cria um novo registro de log
      Esp8266.create(device: esp8266.device, status: esp8266.status, ipadrrs: esp8266.ipadrrs, cont: esp8266.cont, last_seen: esp8266.last_seen, padlock: esp8266.padlock,owner: esp8266.owner, phone: esp8266.phone, fullmax: esp8266.fullmax)
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
    params.require(:esp8266).permit(:device, :status, :ipadrrs, :cont, :last_seen, :padlock, :owner, :phone, :fullmax, :litro)
  end
end