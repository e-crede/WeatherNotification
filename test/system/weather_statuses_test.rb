require "application_system_test_case"

class WeatherStatusesTest < ApplicationSystemTestCase
  setup do
    @weather_status = weather_statuses(:one)
  end

  test "visiting the index" do
    visit weather_statuses_url
    assert_selector "h1", text: "Weather statuses"
  end

  test "should create weather status" do
    visit weather_statuses_url
    click_on "New weather status"

    fill_in "Areadesc", with: @weather_status.areaDesc
    fill_in "Description", with: @weather_status.description
    fill_in "Driver", with: @weather_status.driver_id
    fill_in "Effective", with: @weather_status.effective
    fill_in "Expires", with: @weather_status.expires
    fill_in "Headline", with: @weather_status.headline
    check "Notified" if @weather_status.notified
    fill_in "Severity", with: @weather_status.severity
    fill_in "State", with: @weather_status.state
    click_on "Create Weather status"

    assert_text "Weather status was successfully created"
    click_on "Back"
  end

  test "should update Weather status" do
    visit weather_status_url(@weather_status)
    click_on "Edit this weather status", match: :first

    fill_in "Areadesc", with: @weather_status.areaDesc
    fill_in "Description", with: @weather_status.description
    fill_in "Driver", with: @weather_status.driver_id
    fill_in "Effective", with: @weather_status.effective
    fill_in "Expires", with: @weather_status.expires
    fill_in "Headline", with: @weather_status.headline
    check "Notified" if @weather_status.notified
    fill_in "Severity", with: @weather_status.severity
    fill_in "State", with: @weather_status.state
    click_on "Update Weather status"

    assert_text "Weather status was successfully updated"
    click_on "Back"
  end

  test "should destroy Weather status" do
    visit weather_status_url(@weather_status)
    click_on "Destroy this weather status", match: :first

    assert_text "Weather status was successfully destroyed"
  end
end
