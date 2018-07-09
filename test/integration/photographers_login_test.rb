require 'test_helper'

class PhotographersLoginTest < ActionDispatch::IntegrationTest
  
  def setup
    @photographer = Photographer.create!(togname: "Brassai", email: "brass@pocket.com",password: "barryregan")
  end
  
  test "disallow invalid login" do
      get login_path
      assert_template 'sessions/new'
      post login_path, params:{session:{email: " ", password: " "}}
      assert_template 'sessions/new'
      assert_not flash.empty?
      assert_select "a[href=?]", login_path
      assert_select "a[href=?]",logout_path, count: 0
      get root_path
      assert flash.empty?
  end
  
  
  test "login credentials ok and begin session" do
      get login_path
      assert_template 'sessions/new'
      post login_path, params:{session:{email: @photographer.email, password: @photographer.password}}
      assert_redirected_to @photographer
      follow_redirect!
      assert_template 'photographers/show'
      assert_not flash.empty?
      assert_select "a[href=?]", login_path, count: 0
      assert_select "a[href=?]", logout_path
      assert_select "a[href=?]", photographer_path(@photographer)
      assert_select "a[href=?]", edit_photographer_path(@photographer)
  end

end