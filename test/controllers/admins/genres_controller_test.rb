require "test_helper"

class Admins::GenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_genres_index_url
    assert_response :success
  end

  test "should get create" do
    get admins_genres_create_url
    assert_response :success
  end
end
