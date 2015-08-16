require 'test_helper'

class PartsTest < ActionDispatch::IntegrationTest

  test "retrieve all parts" do
    get "/api/v1/parts.json"
    assert_equal 200, response.status
    parts = JSON.parse(response.body)['parts']
    assert_equal 2, parts.count
  end
end
