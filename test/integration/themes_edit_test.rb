require 'test_helper'

class ThemesEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @photographer = Photographer.create!(togname: "barry", email: "bregan@testing.com",password: "password", password_confirmation: "password")
    @theme = Theme.create(name: "nighttime photography", description: "candid, from hip, no flash, 3200ISO", photographer: @photographer)
  end
  
  test "invalid theme update disallowed" do
    get edit_theme_path(@theme)
    assert_template 'themes/edit'
    patch theme_path(@theme), params: {theme: {name: " ", description: " some descriptive stuff"}}
    assert_template 'themes/edit'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
    
  end
  
  
  test "theme edit successful" do
    get edit_theme_path(@theme)
    assert_template 'themes/edit'
    updated_name = "updated theme name"
    updated_description = "updated theme description"
    patch theme_path(@theme), params: {theme: {name: updated_name, description: updated_description }}
    assert_redirected_to @theme # could also be follow_redirect! as used previously
    assert_not flash.empty?
    @theme.reload
    assert_match updated_name, @theme.name # could also use method from themes_test > response.body
    assert_match updated_description, @theme.description
  end

end
