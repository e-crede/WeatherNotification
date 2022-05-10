require "test_helper"

class WeatherStatusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @weather_status = weather_statuses(:one)
  end

  test "should get index" do
    get weather_statuses_url
    assert_response :success
  end

  test "should get new" do
    get new_weather_status_url
    assert_response :success
  end

  test "should create weather_status" do
    assert_difference("WeatherStatus.count") do
      post weather_statuses_url, params: { weather_status: { areaDesc: @weather_status.areaDesc, description: @weather_status.description, driver_id: @weather_status.driver_id, effective: @weather_status.effective, expires: @weather_status.expires, headline: @weather_status.headline, notified: @weather_status.notified, severity: @weather_status.severity, state: @weather_status.state } }
    end

    assert_redirected_to weather_status_url(WeatherStatus.last)
  end

  test "should show weather_status" do
    get weather_status_url(@weather_status)
    assert_response :success
  end

  test "should get edit" do
    get edit_weather_status_url(@weather_status)
    assert_response :success
  end

  test "should update weather_status" do
    patch weather_status_url(@weather_status), params: { weather_status: { areaDesc: @weather_status.areaDesc, description: @weather_status.description, driver_id: @weather_status.driver_id, effective: @weather_status.effective, expires: @weather_status.expires, headline: @weather_status.headline, notified: @weather_status.notified, severity: @weather_status.severity, state: @weather_status.state } }
    assert_redirected_to weather_status_url(@weather_status)
  end

  test "should destroy weather_status" do
    assert_difference("WeatherStatus.count", -1) do
      delete weather_status_url(@weather_status)
    end

    assert_redirected_to weather_statuses_url
  end
end
