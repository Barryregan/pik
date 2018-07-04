require 'test_helper'

class ThemesTest < ActionDispatch::IntegrationTest
  
  def setup
    @photographer = Photographer.create!(togname: "barry", email: "bregan@testing.com")
    @theme = Theme.create(name: "nighttime photography", description: "candid, from hip, no flash, 3200ISO", photographer: @photographer)
    @theme2 = @photographer.themes.build(name: "family portrait", description: "outdoors natual light candid")
    @theme2.save
  end
  
  test " get themes index" do
    get themes_path
    assert_response :success
  end
    
  test "get themes listing" do
    get themes_path
    assert_template 'themes/index'
    assert_select "a[href=?]", theme_path(@theme), text: @theme.name
    assert_select "a[href=?]", theme_path(@theme2), text: @theme2.name
  end
  
  test "get themes show" do
    get theme_path(@theme)
    assert_template 'themes/show'
    assert_match @theme.description, response.body
    assert_match @photographer.togname, response.body
  end
  
  test "create theme valid" do
    get new_theme_path
  end
  
  test " disallow invalid theme input" do
    get new_theme_path
    assert_template 'themes/new'
    assert_no_difference 'Theme.count' do
      post themes_path, params: { theme: { name: " ", description: " " } }
    end
    assert_template 'themes/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
  end
end
