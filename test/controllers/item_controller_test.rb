require 'test_helper'

class ItemControllerTest < ActionDispatch::IntegrationTest
  test "should get item entity" do
    get '/items/A', xhr: true
    json_response = JSON.parse(@response.body)
    assert_equal 'A', json_response['code']
  end
end
