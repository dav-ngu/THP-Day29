require 'test_helper'

class PageControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get page_home_url
    assert_response :success
  end

  test "should get team" do
    get page_team_url
    assert_response :success
  end

  test "should get contact" do
    get page_contact_url
    assert_response :success
  end

  test "should get welcome" do
    get page_welcome_url
    assert_response :success
  end

  test "should get potin" do
    get page_potin_url
    assert_response :success
  end

  test "should get auteur" do
    get page_auteur_url
    assert_response :success
  end

end
