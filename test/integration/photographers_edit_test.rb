require 'test_helper'

class PhotographersEditTest < ActionDispatch::IntegrationTest

  def setup
    @photographer = Photographer.create!(togname: "barry", email: "bregan@testing.com",password: "password", password_confirmation: "password")
  end
  
  test "disallow invalid edit" do
    sign_in_as(@photographer, "password")
    get edit_photographer_path(@photographer)
    assert_template 'photographers/edit'
    patch photographer_path(@photographer), params: {photographer: {togname: " ", email: " bb@example.com"}}
    assert_template 'photographers/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
  

  
  test "allow valid signup" do
   sign_in_as(@photographer, "password")
   get edit_photographer_path(@photographer)
   assert_template 'photographers/edit'
   patch photographer_path(@photographer), params: {photographer: {togname: "barry22", email: "barry22@example.com"}}
   assert_redirected_to @photographer
   assert_not flash.empty?
   @photographer.reload
   assert_match "barry22", @photographer.togname
   assert_match "barry22@example.com", @photographer.email
  end
end
