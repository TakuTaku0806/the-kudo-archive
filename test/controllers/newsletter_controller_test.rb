require "test_helper"

class NewsletterControllerTest < ActionDispatch::IntegrationTest
  test "should get subscribe" do
    get newsletter_subscribe_url
    assert_response :success
  end

  test "should get destroy" do
    get newsletter_destroy_url
    assert_response :success
  end
end
