require "test_helper"

class QuizzesControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get quizzes_start_url
    assert_response :success
  end
end
