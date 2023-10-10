require "test_helper"

class PlataformsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get plataforms_index_url
    assert_response :success
  end

  test "should get show" do
    get plataforms_show_url
    assert_response :success
  end
end
