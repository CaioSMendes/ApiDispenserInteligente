require "test_helper"

class RfidCardsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @rfid_card = rfid_cards(:one)
  end

  test "should get index" do
    get rfid_cards_url, as: :json
    assert_response :success
  end

  test "should create rfid_card" do
    assert_difference("RfidCard.count") do
      post rfid_cards_url, params: { rfid_card: { description: @rfid_card.description, uid: @rfid_card.uid } }, as: :json
    end

    assert_response :created
  end

  test "should show rfid_card" do
    get rfid_card_url(@rfid_card), as: :json
    assert_response :success
  end

  test "should update rfid_card" do
    patch rfid_card_url(@rfid_card), params: { rfid_card: { description: @rfid_card.description, uid: @rfid_card.uid } }, as: :json
    assert_response :success
  end

  test "should destroy rfid_card" do
    assert_difference("RfidCard.count", -1) do
      delete rfid_card_url(@rfid_card), as: :json
    end

    assert_response :no_content
  end
end
