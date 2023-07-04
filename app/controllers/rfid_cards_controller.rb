class RfidCardsController < ApplicationController
  before_action :set_rfid_card, only: %i[ show update destroy ]

  # GET /rfid_cards
  def index
    @rfid_cards = RfidCard.all

    render json: @rfid_cards
  end

  # GET /rfid_cards/1
  def show
    render json: @rfid_card
  end

  # POST /rfid_cards
  def create
    @rfid_card = RfidCard.new(rfid_card_params)

    if @rfid_card.save
      render json: @rfid_card, status: :created, location: @rfid_card
    else
      render json: @rfid_card.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rfid_cards/1
  def update
    if @rfid_card.update(rfid_card_params)
      render json: @rfid_card
    else
      render json: @rfid_card.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rfid_cards/1
  def destroy
    @rfid_card.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rfid_card
      @rfid_card = RfidCard.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rfid_card_params
      params.require(:rfid_card).permit(:uid, :description)
    end
end
