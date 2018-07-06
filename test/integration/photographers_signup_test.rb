require 'test_helper'

class PhotographersSignupTest < ActionDispatch::IntegrationTest

  test "get signup path" do
    get signup_path
    assert_response:success
  end
  
  test "disallow invalid signup" do
    get signup_path
    assert_no_difference "Photographer.count" do
      post photographers_path, params:{photographer:{togname: " ", email: " ", 
                                      password: "password", password_confirmation:" "}}
    end
    assert_template 'photographers/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  
  test "allow valid signup" do
    get signup_path
    assert_difference "Photographer.count", 1 do
      post photographers_path, params: { photographer: { togname: "Barry", email: "barry@example.com", 
                                        password: "password", password_confirmation: "password"}}
    end
    follow_redirect!
    assert_template 'photographers/show'
    assert_not flash.empty?
  end
  
end
