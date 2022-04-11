require 'test_helper'

class CheckoutControllerTest < ActionDispatch::IntegrationTest
  test "should get basket total price 10000" do
    get "/checkout/summary?items[]=A&items[]=B&items[]=C", xhr: true

    json_response = JSON.parse(@response.body)
    assert_equal 10000.0, json_response['total_price_with_discount'].to_f
  end

  test "should get basket total price 11000" do
    get "/checkout/summary?items[]=B&items[]=A&items[]=B&items[]=A&items[]=A", xhr: true

    json_response = JSON.parse(@response.body)
    assert_equal 11000.0, json_response['total_price_with_discount'].to_f
  end

  test "should get basket total price 15500" do
    get "/checkout/summary?items[]=C&items[]=B&items[]=A&items[]=A&items[]=D&items[]=A&items[]=B", xhr: true

    json_response = JSON.parse(@response.body)
    assert_equal 15500.0, json_response['total_price_with_discount'].to_f
  end

  test "should get basket total price 14000" do
    get "/checkout/summary?items[]=C&items[]=A&items[]=D&items[]=A&items[]=A", xhr: true

    json_response = JSON.parse(@response.body)
    assert_equal 14000.0, json_response['total_price_with_discount'].to_f
  end

end
