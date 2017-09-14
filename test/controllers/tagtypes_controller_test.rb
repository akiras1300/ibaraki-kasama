require 'test_helper'

class TagtypesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tagtypes_index_url
    assert_response :success
  end

  test "should get show" do
    get tagtypes_show_url
    assert_response :success
  end

end
